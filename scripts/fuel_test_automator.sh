#!/bin/bash

# usage
# ============
#
# fuel_test_automator [-ms]:
#
#
# options
# ============
#
# -m serialize / materialize all objects to / from all images (tests will not be run)
# -s load latest stable (instead of bleeding edge)

SERIALIZE_MATERIALIZE=0
LOAD_STABLE=0
VM_PATH="/devel/VM"
IMAGE_PATH="/devel/fuel"
COG_VM="$VM_PATH/CogVM.app/Contents/MacOS/CogVM"
PHARO_VM="$VM_PATH/Pharo.app/Contents/MacOS/Pharo"
STACK_VM="$VM_PATH/Squeak 4.2.5beta1U.app/Contents/MacOS/Squeak VM Opt"
PREPARATION_SCRIPT="$IMAGE_PATH/fuel_fix_installer_for_squeak.st"
LOADER_SCRIPT_STABLE="$IMAGE_PATH/fuel_load_packages_stable.st"
LOADER_SCRIPT_BLEEDING_EDGE="$IMAGE_PATH/fuel_load_packages_bleeding_edge.st"
TEST_RUNNER_SCRIPT="$IMAGE_PATH/fuel_run_all_tests.st"
SERIALIZATION_SCRIPT="$IMAGE_PATH/fuel_serialize_all_objects.st"
MATERIALIZATION_SCRIPT="$IMAGE_PATH/fuel_materialize_all_objects.st"
FINAL_SCRIPT_BASE="$IMAGE_PATH/run_it"
FINAL_SCRIPT=""

PHARO_IMAGES_COG_VM=("Pharo111" "Pharo112" "Pharo12" "Pharo122" "Pharo13" "Pharo14" "Pharo20")
PHARO_IMAGES_PHARO_VM=("Pharo30")
SQUEAK_IMAGES_STACK_VM=("Squeak41")
SQUEAK_IMAGES_COG_VM=("Squeak42" "Squeak43" "Squeak44" "Squeak45")

# help function
function display_help() {
	echo "$(basename $0) [-ms]"
	echo " -m serialize / materialize all objects to / from all images (tests will not be run)"
	echo " -s load latest stable (instead of bleeding edge)"
}

function prepare_final_script(){
	IMAGE_NAME=$1
	FINAL_SCRIPT="${FINAL_SCRIPT_BASE}_${IMAGE_NAME}.st"
	cat "$PREPARATION_SCRIPT" > "$FINAL_SCRIPT"
	if [ $LOAD_STABLE = 1 ]; then
		cat "$LOADER_SCRIPT_STABLE" >> "$FINAL_SCRIPT"
	else
		cat "$LOADER_SCRIPT_BLEEDING_EDGE" >> "$FINAL_SCRIPT"
	fi
	
	if [ $SERIALIZE_MATERIALIZE = 0 ]; then
		cat "$TEST_RUNNER_SCRIPT" >> "$FINAL_SCRIPT"
    else
		echo "Smalltalk at: #FuelFormatTestScriptsPath put: '$IMAGE_PATH'." >> "$FINAL_SCRIPT"
		
		echo "Smalltalk at: #FuelFormatTestImageNames put: #(" >> "$FINAL_SCRIPT"
		for image_name in ${PHARO_IMAGES_COG_VM[@]}; do
			echo "'${image_name}' " >> "$FINAL_SCRIPT"
		done
		for image_name in ${PHARO_IMAGES_PHARO_VM[@]}; do
			echo "'${image_name}' " >> "$FINAL_SCRIPT"
		done
		for image_name in ${SQUEAK_IMAGES_STACK_VM[@]}; do
			echo "'${image_name}' " >> "$FINAL_SCRIPT"
		done
		for image_name in ${SQUEAK_IMAGES_COG_VM[@]}; do
			echo "'${image_name}' " >> "$FINAL_SCRIPT"
		done
		echo ")." >> "$FINAL_SCRIPT"
		
		echo "Smalltalk at: #FuelFormatTestFilename put: '$IMAGE_NAME.fuel'." >> "$FINAL_SCRIPT"
		
		cat "$SERIALIZATION_SCRIPT" >> "$FINAL_SCRIPT"
		
		cat "$MATERIALIZATION_SCRIPT" >> "$FINAL_SCRIPT"
	fi
}


while getopts ":msh?" OPT ; do
	case "$OPT" in

		# serialize / materialize objects
		m)	SERIALIZE_MATERIALIZE=1
		;;
		
		# load latest stable
		s)	LOAD_STABLE=1
		;;
		
		# show help
		h)	display_help
		;;
		
		# show help
		\?)	display_help
			exit 1
		;;

	esac
done

if [ $LOAD_STABLE = 1 ]; then
	echo "loading stable"
else
	echo "loading bleeding edge"
fi

if [ $SERIALIZE_MATERIALIZE = 1 ]; then
	echo "serializing / materializing all objects"
else
	echo "running all tests"
fi

# #pharo cog
# for image in ${PHARO_IMAGES_COG_VM[@]}; do
#     prepare_final_script ${image}
#     echo "running $COG_VM $IMAGE_PATH/${image}/${image}.image $FINAL_SCRIPT"
#     exec "$COG_VM" "$IMAGE_PATH/${image}/${image}.image" "$FINAL_SCRIPT" &
# done
# 
# #pharo vm
# for image in ${PHARO_IMAGES_PHARO_VM[@]}; do
#     prepare_final_script ${image}
#     echo "running $PHARO_VM $IMAGE_PATH/${image}/${image}.image $FINAL_SCRIPT"
#     exec "$PHARO_VM" "$IMAGE_PATH/${image}/${image}.image" "$FINAL_SCRIPT" &
# done

#squeak stack
for image in ${SQUEAK_IMAGES_STACK_VM[@]}; do
	prepare_final_script ${image}
	echo "running $STACK_VM $IMAGE_PATH/${image}/${image}.image $FINAL_SCRIPT"
	exec "$STACK_VM" "$IMAGE_PATH/${image}/${image}.image" "$FINAL_SCRIPT" &
done

# #squeak cog
# for image in ${SQUEAK_IMAGES_COG_VM[@]}; do
#     prepare_final_script ${image}
#     echo "running $COG_VM $IMAGE_PATH/${image}/${image}.image $FINAL_SCRIPT"
#     exec "$COG_VM" "$IMAGE_PATH/${image}/${image}.image" "$FINAL_SCRIPT" &
# done

exit 0