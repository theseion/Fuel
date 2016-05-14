#!/bin/bash

# -e exit if simple command fails
# -x echo each line
set -ex

# jenkins puts all the params after a / in the job name as well :(
export JOB_NAME=$(dirname $JOB_NAME)
REPO=http://smalltalkhub.com/mc/Pharo/Fuel/main

case "$SYSTEM" in
	# these can't be built on Travis
	"pharo20") IMAGE_VERSION="20"
	;;
	"pharo30") IMAGE_VERSION="30"
	;;
	*) echo "Invalid value in SYSTEM variable"
	   exit 0
esac

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

zip -r "${JOB_NAME}.zip" "${IMAGE_URL}" "${CHANGES_URL}"