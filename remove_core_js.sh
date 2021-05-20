#!/usr/bin/env bash

echo "Sart removing core-js from @storybook"

DEV_FOLDER=./node_modules/@storybook/
DEPENDENCY_FOLDER=../../node_modules/@storybook/

if [ -e "$DEV_FOLDER" ]; then
  FOLDER=$DEV_FOLDER
elif [ -e "$DEPENDENCY_FOLDER" ]; then
  FOLDER=$DEPENDENCY_FOLDER
else 
  echo "Could not find @storybook folder"
  exit 1
fi

files=$(grep -rl $FOLDER -e 'require("core-js/modules')

for i in $files
do
  sed -i '' 's/require("core-js\/modules\/.*//g; /^$/ d' $i
done

echo 'Done removing core-js from @storybook'