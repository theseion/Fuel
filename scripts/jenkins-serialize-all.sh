#!/bin/bash
# jenkins puts all the params after a / in the job name as well :(
export JOB_NAME=`dirname $JOB_NAME`
REPO=http://smalltalkhub.com/mc/Pharo/Fuel/main

if [[ "$SYSTEM" == "pharo"* ]]; then
    # build and test pharo images    
    if [ "$SYSTEM" == "pharo20" ]; then
        IMAGE_VERSION="20"
    else
        IMAGE_VERSION="30"
    fi
    
    echo "downloading image and vm"
    wget --quiet -O - get.pharo.org/$IMAGE_VERSION+vm | bash

    #was used to debug build failures (max)
    #wget --quiet -O - get.pharo.org/$VM | bash
    #wget --quiet http://files.pharo.org/image/30/30413.zip
    #unzip -j 30413.zip
    #mv Pharo-30413.image Pharo.image
    #mv Pharo-30413.changes Pharo.changes
    ./pharo Pharo.image save $JOB_NAME --delete-old
    ./pharo $JOB_NAME.image --version > version.txt

    #was used to debug build failures (max)
    #./pharo $JOB_NAME eval -e "Author useAuthor: 'foo' during: [OpalCompiler class compile: 'defaultOptions ^ #(+ optionInlineIf + optionInlineIfNil + optionInlineAndOr + optionInlineWhile + optionInlineToDo + optionInlineCase - optionInlineTimesRepeat + optionIlineNone + optionLongIvarAccessBytecodes  + optionOptimizeIR )'.OpalCompiler recompileAll].Smalltalk snapshot: true andQuit: true."
    echo "building image"
    ./pharo $JOB_NAME.image config $REPO ConfigurationOfFuel --install=$VERSION --group=$GROUP
else
    # build and test squeak images
    echo "downloading sources"
    wget --quiet http://ftp.squeak.org/current_stable/SqueakV41.sources.zip
    unzip -j SqueakV41.sources.zip
    echo "downloading vm"
    wget --quiet http://ftp.squeak.org/current_stable/unix-linux/coglinux.tgz
    tar -xzf coglinux.tgz
    
    # get the latest image for either 4.4 or 4.5
    IMAGE_FTP_HOST="ftp.squeak.org"
    if [ "$SYSTEM" == "squeak44" ]; then
        IMAGE_DIRECTORY="current_stable"
    else
        IMAGE_DIRECTORY="trunk"
    fi
    IMAGE_DIRECTORY_URL="${IMAGE_FTP_HOST}/${IMAGE_DIRECTORY}/"
    
    echo "listing builds on ftp server"
    # -i: no interactive prompt, -n don't ask for login, -p enforces passive mode
    ftp -ipn "$IMAGE_FTP_HOST" <<EOF
user anonymous pharo-fuel@lists.gforge.inria.fr
cd "$IMAGE_DIRECTORY"
ls . ftp_ls.log
quit
EOF

    if [ ! -e "ftp_ls.log"]; then
        echo "could not connect to ftp server. Ignoring build failure."
        exit 0
    fi
    
    echo "found the following files on the ftp server: "
    cat ftp_ls.log
    # parse the file name of the most recent build from the ftp ls output
    IMAGE_FILE_NAME=`cat ftp_ls.log | grep -E "Squeak[0-9]\.[0-9]\-[0-9]+\.zip" | sed -nr 's/.*(Squeak.*\.zip)/\1/p' | sort | tail -1`
    # parse the file extension from the filename
    IMAGE_FILE_EXTENSION=`echo $IMAGE_FILE_NAME | sed -nr 's/.*\.([a-zA-Z0-9]+)/\1/p'`
    IMAGE_BASE_NAME=`echo $IMAGE_FILE_NAME | sed -nr 's/(.*)\.[a-zA-Z0-9]+/\1/p'`
    rm -f ftp_ls.log

    echo "downloading image: ${IMAGE_DIRECTORY_URL}${IMAGE_FILE_NAME}"
    wget --quiet "${IMAGE_DIRECTORY_URL}${IMAGE_FILE_NAME}"
    echo "unzipping ${IMAGE_FILE_NAME}"
    unzip -j "${IMAGE_FILE_NAME}"
    echo "renaming files: "
    echo "mv ${IMAGE_BASE_NAME}.image ${JOB_NAME}.image"
    echo "mv ${IMAGE_BASE_NAME}.changes ${JOB_NAME}.changes"
    mv "${IMAGE_BASE_NAME}.image" "${JOB_NAME}.image"
    mv "${IMAGE_BASE_NAME}.changes" "${JOB_NAME}.changes"
    
    # generate the script to build image and run tests
    echo "generating init_script.st"
    cat <<EOF > init_script.st
"fix Installer for Smalltalkhub"
[ [ (Smalltalk hasClassNamed: #InstallerInternetBased) ifTrue: [
	Utilities setAuthorInitials: 'foo'.
	(Smalltalk classNamed: #InstallerInternetBased) compile: 'urlGet: aUrl

	| page |
	page := HTTPSocket httpGet: aUrl accept: ''application/x-monticello''.  
	(page respondsTo: #reset)  ifFalse: [ ^ nil ].
	(self isHtmlStream: page) ifTrue: [ page := self extractFromHtml: page option: nil ].
	^ page reset
	' ].

((Smalltalk at: #Installer) monticello http: 'http://smalltalkhub.com/mc/Pharo/Fuel/') 
	project: 'main';
	package: 'ConfigurationOfFuel';
	install.
	(Smalltalk at: #ConfigurationOfFuel)
EOF
    if [ "$VERSION" == "bleedingEdge" ]; then
        echo "loadBleedingEdge." >> "init_script.st"
    else
        echo "load." >> "init_script.st"
    fi
    echo "] on: Error do: [ :ex | Smalltalk dumpException: ex ] ] ensure: [ Smalltalk snapshot: true andQuit: true ]." >> init_script.st
    
    # build the image
    echo "building image"
    ./coglinux/squeak -headless "${JOB_NAME}.image" "init_script.st"
    # remove those zip files we don't want to keep (jenkins will archive zip files)
    rm -f *.zip
fi


wget --quiet -N https://github.com/theseion/stuff/raw/master/fuel/fuel_serialize_materialize_everything.st
if [[ "$SYSTEM" == "pharo"* ]]; then
    RUN="./pharo ${JOB_NAME}.image init_script.st"
else
    RUN="./coglinux/squeak -headless ${JOB_NAME}.image init_script.st"
fi
# serialize all instances
echo "generating script to serialize all instances"
echo "[ [ [" > "init_script.st"
cat fuel_serialize_materialize_everything.st >> "init_script.st"
echo " ] on: Error do: [ :ex | ex serializeToFileNamed: 'exception_serializing_everything.fuel' ] ] on: Error do: [] ]" >> "init_script.st"
echo " ensure: [ Smalltalk snapshot: false andQuit: true ]." >> "init_script.st"

echo "running serialization of all instances"
bash -c "$RUN"
    
zip -r $JOB_NAME.zip $JOB_NAME.image $JOB_NAME.changes

if [ -e "exception_serializing_everything.fuel" -o -e "SqueakDebug.log" -o -e "PharoDebug.log" ]; then
    exit 1
fi