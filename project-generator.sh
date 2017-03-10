#!/bin/sh

# project-generator.sh: A simple shell script for generating a project structure

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROJECT_YEAR=`date +"%Y"`
KEPT_DIR=$PWD
echo Project name \(as in PROJECT_GENERATOR\)?
read PROJECT_NAME
PROJECT_LOWER="$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/_/-/')"
echo "Project lower case name with dashes: $PROJECT_LOWER"
PROJECT_PASCAL="$(echo "$PROJECT_LOWER" | sed -r 's/(^|-)([a-z])/\U\2/g')"
echo "Project upper pascal case name: $PROJECT_PASCAL"
echo Project description?
read PROJECT_DESCRIPTION
echo AUTHOR?
read PROJECT_AUTHOR
echo Installation directory "["${KEPT_DIR}"]"?
read INSTALL_DIR
if [ -z "$INSTALL_DIR" ]; then
	INSTALL_DIR=$KEPT_DIR
fi
echo Creating folder structure for $PROJECT_LOWER \($PROJECT_NAME\)  in \"$INSTALL_DIR\"...
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR
mkdir -p cmake doc example extern firmware libraries programs scripts share
mkdir -p scripts/admin scripts/gnome scripts/package
mkdir -p libraries/ExampleLibrary programs/exampleProgram

cp $SCRIPT_DIR/CMakeLists.txt .

cp $SCRIPT_DIR/TEMPLATE_NAMEConfig.cmake.in $PROJECT_NAME"Config.cmake.in"

cp $SCRIPT_DIR/cmake/IncludeUrl.cmake cmake

cp $SCRIPT_DIR/cmake/YCMBootstrap.cmake cmake

cp $SCRIPT_DIR/cmake/ProjectDescribe.cmake "cmake/"$PROJECT_PASCAL"Describe.cmake"

cp $SCRIPT_DIR/cmake/ProjectDoc.cmake "cmake/"$PROJECT_PASCAL"Doc.cmake"

cp $SCRIPT_DIR/cmake/ProjectOptions.cmake "cmake/"$PROJECT_PASCAL"Options.cmake"

cp $SCRIPT_DIR/cmake/ProjectPackage.cmake "cmake/"$PROJECT_PASCAL"Package.cmake"

cp $SCRIPT_DIR/cmake/ProjectSystem.cmake "cmake/"$PROJECT_PASCAL"System.cmake"

cp $SCRIPT_DIR/cmake/ProjectVersion.cmake "cmake/"$PROJECT_PASCAL"Version.cmake"

cp $SCRIPT_DIR/doc/* doc

cp $SCRIPT_DIR/libraries/CMakeLists.txt libraries

cp $SCRIPT_DIR/libraries/ExampleLibrary/* libraries/ExampleLibrary

cp $SCRIPT_DIR/programs/CMakeLists.txt programs

cp $SCRIPT_DIR/programs/exampleProgram/* programs/exampleProgram

cp $SCRIPT_DIR/share/* share

cp $SCRIPT_DIR/scripts/admin/* scripts/admin

cp $SCRIPT_DIR/scripts/gnome/TEMPLATE_LOWER.desktop "scripts/gnome/"$PROJECT_LOWER".desktop"

cp $SCRIPT_DIR/scripts/package/* scripts/package

find -type f -exec sed -i "s/TEMPLATE_NAME/$PROJECT_NAME/g" {} +
find -type f -exec sed -i "s/TEMPLATE_LOWER/$PROJECT_LOWER/g" {} +
find -type f -exec sed -i "s/TEMPLATE_PASCAL/$PROJECT_PASCAL/g" {} +
find -type f -exec sed -i "s/TEMPLATE_AUTHOR/$PROJECT_AUTHOR/g" {} +
find -type f -exec sed -i "s/TEMPLATE_YEAR/$PROJECT_YEAR/g" {} +
find -type f -exec sed -i "s/TEMPLATE_DESCRIPTION/$PROJECT_DESCRIPTION/g" {} +

echo $PROJECT_DESCRIPTION >> README.md

