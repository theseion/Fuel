#!/bin/bash

# -e exit if simple command fails
# -x echo each line
set -ex

# jenkins puts all the params after a / in the job name as well :(
export JOB_NAME=`dirname $JOB_NAME`
REPO=http://smalltalkhub.com/mc/Pharo/Fuel/main

if [[ "$SYSTEM" == "pharo"* ]]; then
	# build and test pharo images
	case "$SYSTEM" in
		"pharo20") IMAGE_VERSION="20"
		;;
		"pharo30") IMAGE_VERSION="30"
		;;
		"pharo40") IMAGE_VERSION="40"
		;;
		*) echo "Invalid value in SYSTEM variable"
		   exit 0
	esac

	VM="vm"
	if [ ${IMAGE_VERSION} == "40" ]; then
		VM="vmLatest"
	fi

	echo "downloading image and vm"
	wget --quiet -O - get.pharo.org/${IMAGE_VERSION}+${VM} | bash

	IMAGE_URL="${JOB_NAME}.image"
	CHANGES_URL="${JOB_NAME}.changes"
	timeout -k 30m 29m ./pharo Pharo.image save ${JOB_NAME} --delete-old
	timeout -k 30m 29m ./pharo ${IMAGE_URL} --version > version.txt

	echo "building image"
	timeout -k 30m 29m ./pharo ${IMAGE_URL} config ${REPO} ConfigurationOfFuel --install=${VERSION} --group=${GROUP}
	echo "running tests"
	timeout -k 30m 29m ./pharo ${IMAGE_URL} test --junit-xml-output "Fuel.*"

else
	# build and test squeak images

	FTP_HOST="ftp.squeak.org"

	function downloadAllInOne() {
		AIO_DIRECTORY_URL="${FTP_HOST}/${1}/"
		AIO_FILE_BASE_NAME="Squeak-${1}-All-in-One"
		AIO_ZIP_FILE_NAME="${AIO_FILE_BASE_NAME}.zip"
		AIO_APP_FILE_NAME="${AIO_FILE_BASE_NAME}.app"

		echo "downloading all-in-one: ${1}"
		wget --quiet "${AIO_DIRECTORY_URL}${AIO_ZIP_FILE_NAME}"
		echo "unzipping ${AIO_ZIP_FILE_NAME}"
		unzip "${AIO_ZIP_FILE_NAME}"

		# new in the 4.5 build: extra folder wrapping everything, new layout
		if [ "${1}" = "4.5" ]; then
			mv "Squeak-${1}-All-In-One"/* . # note the case sensitivity... WTF
			AIO_IMAGE_BASE_NAME=$(cat ${AIO_APP_FILE_NAME}/Contents/LinuxAndWindows/squeak.sh | grep "IMAGE.*image" | sed -r 's/.*(Squeak.*)\.image.*/\1/')
		else
			AIO_IMAGE_BASE_NAME=$(cat ${AIO_APP_FILE_NAME}/squeak.sh | grep "IMAGE.*image" | sed -r 's/.*(Squeak.*)\.image.*/\1/')
		fi
		AIO_IMAGE_URL="${AIO_APP_FILE_NAME}/Contents/Resources/${AIO_IMAGE_BASE_NAME}.image"
		AIO_CHANGES_URL="${AIO_APP_FILE_NAME}/Contents/Resources/${AIO_IMAGE_BASE_NAME}.changes"
		AIO_VM_URL="${AIO_APP_FILE_NAME}/Contents/Linux-i686/bin/squeak"
		if [ "${1}" = "4.5" ]; then
			AIO_VM_URL="${AIO_APP_FILE_NAME}/Contents/LinuxAndWindows/Linux-i686/bin/squeak"
		fi
		AIO_INIT_SCRIPT_URL="${AIO_APP_FILE_NAME}/Contents/Resources/init_script.st"
		AIO_DEBUG_LOG_URL="${AIO_APP_FILE_NAME}/Contents/Resources/SqueakDebug.log"
	}

	function downloadLatestImageAndSources() {
		echo "downloading image: ${1}"
		IMAGE_DIRECTORY_URL="${FTP_HOST}/${1}/"
		IMAGE_BASE_NAME=$(wget --quiet -O - http://${IMAGE_DIRECTORY_URL} | grep "Squeak[0-9.-]*\.zip" | sed -r 's/.*(Squeak.*)\.zip.*/\1/' | sort | tail -1)
		SOURCES_BASE_NAME=$(wget --quiet -O - http://${IMAGE_DIRECTORY_URL} | grep "SqueakV[0-9.-]*sources\.zip" | sed -r 's/.*(Squeak.*)\.zip.*/\1/')
		wget --quiet -O sources.zip http://${IMAGE_DIRECTORY_URL}${SOURCES_BASE_NAME}.zip
		unzip sources.zip
		IMAGE_ZIP_FILE_NAME="${IMAGE_BASE_NAME}.zip"
		wget --quiet "${IMAGE_DIRECTORY_URL}${IMAGE_ZIP_FILE_NAME}"
		unzip -j "${IMAGE_ZIP_FILE_NAME}"
	}

	function prepare44() {
		downloadAllInOne "4.4"
		IMAGE_URL="${AIO_IMAGE_URL}"
		CHANGES_URL="${AIO_CHANGES_URL}"
		VM_URL="${AIO_VM_URL}"
		INIT_SCRIPT_URL="${AIO_INIT_SCRIPT_URL}"
		DEBUG_LOG_URL="${AIO_DEBUG_LOG_URL}"
	}

	function prepare45() {
		downloadAllInOne "4.5"
		IMAGE_URL="${AIO_IMAGE_URL}"
		CHANGES_URL="${AIO_CHANGES_URL}"
		VM_URL="${AIO_VM_URL}"
		INIT_SCRIPT_URL="${AIO_INIT_SCRIPT_URL}"
		DEBUG_LOG_URL="${AIO_DEBUG_LOG_URL}"
	}

	function prepare46() {
		downloadLatestImageAndSources "4.6"
		IMAGE_URL="${IMAGE_BASE_NAME}.image"
		CHANGES_URL="${IMAGE_BASE_NAME}.changes"
		wget --quiet -O cog.tgz http://www.mirandabanda.org/files/Cog/VM/VM.r3410/coglinux-15.28.3410.tgz
		tar -xzf cog.tgz
		VM_URL="$(pwd)/coglinux/squeak"
		INIT_SCRIPT_URL="init_script.st"
		DEBUG_LOG_URL="SqueakDebug.log"
	}

	function prepare50() {
		downloadLatestImageAndSources "5.0"
		IMAGE_URL="${IMAGE_BASE_NAME}.image"
		CHANGES_URL="${IMAGE_BASE_NAME}.changes"
		wget --quiet -O cog.tgz http://www.mirandabanda.org/files/Cog/VM/VM.r3410/cogspurlinux-15.28.3410.tgz
		tar -xzf cog.tgz
		VM_URL="$(pwd)/cogspurlinux/squeak"
		INIT_SCRIPT_URL="init_script.st"
		DEBUG_LOG_URL="SqueakDebug.log"
	}
	
	
	function generateBuildInitScript() {
		echo "generating init_script for build"
		cat <<EOF > ${INIT_SCRIPT_URL}
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
((Smalltalk at: #ConfigurationOfFuel) project version: '${VERSION}') in: [ :version |
	(version groups contains: [ :spec | spec name = '${GROUP}'])
		ifTrue: [ version load: '${GROUP}' ]
		ifFalse: [ version load ] ].
EOF
		echo "] on: Error do: [ :ex | Smalltalk dumpException: ex ] ] ensure: [ Smalltalk snapshot: true andQuit: true ]." >> "${INIT_SCRIPT_URL}"
	}
	
	function generateTestInitScript() {
		echo "generating init_script for tests"
		cat <<EOF >${INIT_SCRIPT_URL}

"load HudsonBuildTools and run tests"
[ [ ((Smalltalk at: #Installer) monticello http: 'http://smalltalkhub.com/mc/Pharo/Fuel/') 
	project: 'main';
	package: 'HudsonBuildTools20';
	install.

HDTestReport runPackage: 'FuelTests'. ] on: Error do: [ :ex | Smalltalk dumpException: ex ] ] ensure: [.
Smalltalk snapshot: false andQuit: true ].
EOF
	}
	
	# get the latest image
	case "$SYSTEM" in 
		"squeak44") prepare44
		;;
		"squeak45") prepare45
		;;
		"squeak46") prepare46
		;;
		"squeak50") prepare50
		;;
		*) echo "Invalid value in SYSTEM variable"
		   exit 0
	esac
	
	echo "path to image: ${IMAGE_URL}"
	echo "path to changes: ${CHANGES_URL}"
	echo "path to vm: ${VM_URL}"
	echo "path to init script: ${INIT_SCRIPT_URL}"
	echo "path to debug log: ${DEBUG_LOG_URL}"
	
	generateBuildInitScript
	
	# build the image
	echo "building image"
	timeout -k 30m 29m ${VM_URL} "-headless" "${IMAGE_URL}" "init_script.st"

	generateTestInitScript

	# run the tests
	echo "running tests"
	timeout -k 30m 29m ${VM_URL} "-headless" "${IMAGE_URL}" "init_script.st"
	# remove those zip files we don't want to keep (jenkins will archive zip files)
	rm -f *.zip
fi
	
zip -r "${JOB_NAME}.zip" "${IMAGE_URL}" "${CHANGES_URL}"

if [ -e "${DEBUG_LOG_URL}" ]; then
	echo "${DEBUG_LOG_URL} generated. Marking build as failure."
	exit 1
fi