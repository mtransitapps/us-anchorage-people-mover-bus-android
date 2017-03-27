#!/bin/bash
echo ">> Building...";
# ant clean release;
# PWD=${PWD}
# echo "PWD: $PWD.";
DIRECTORY=$(basename ${PWD});
# echo $DIRECTORY;
CUSTOM_SETTINGS_GRADLE_FILE="../settings.gradle.all";
echo "CUSTOM_SETTINGS_GRADLE_FILE: $CUSTOM_SETTINGS_GRADLE_FILE.";
if [ -f $CUSTOM_SETTINGS_GRADLE_FILE ]; then
	echo "CUSTOM_SETTINGS_GRADLE_FILE: $CUSTOM_SETTINGS_GRADLE_FILE exits.";
	../gradlew -c $CUSTOM_SETTINGS_GRADLE_FILE :$DIRECTORY:clean :$DIRECTORY:assembleRelease :$DIRECTORY:copyReleaseApkToOutputDirs;
	RESULT=$?;
else
	echo "CUSTOM_SETTINGS_GRADLE_FILE: $CUSTOM_SETTINGS_GRADLE_FILE does NOT exit.";
	../gradlew :$DIRECTORY:clean :$DIRECTORY:assembleRelease :$DIRECTORY:copyReleaseApkToOutputDirs;
	RESULT=$?;
fi
echo ">> Building... DONE";
exit $RESULT;
