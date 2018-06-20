#!/bin/sh

# project-generator.sh: A simple shell script for generating a project structure

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROJECT_YEAR=`date +"%Y"`
KEPT_DIR=$PWD

echo Project name \(as in PROJECT_GENERATOR\)?
read PROJECT_NAME
PROJECT_LOWER="$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/_/-/')"
echo "Project lower case name with dashes: $PROJECT_LOWER"
echo Project CMake namespace "["${PROJECT_NAME}"]"
read PROJECT_CM_NAMESPACE
if [ -z "$PROJECT_CM_NAMESPACE" ]; then
    PROJECT_CM_NAMESPACE=$PROJECT_NAME
fi
echo Project description?
read PROJECT_DESCRIPTION
echo AUTHOR?
read PROJECT_AUTHOR
echo LICENSE? \(e.g. \"LGPLv2.1 or later\", \"GNU GPL v2.0\"\)
read PROJECT_LICENSE
echo Installation directory "["${KEPT_DIR}/${PROJECT_NAME}"]"?
read INSTALL_DIR
if [ -z "$INSTALL_DIR" ]; then
    INSTALL_DIR=$KEPT_DIR/$PROJECT_NAME
fi

echo Creating folder structure for $PROJECT_LOWER \($PROJECT_NAME\)  in \"$INSTALL_DIR\"...
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR
mkdir -p cmake/templates cmake/modules cmake/find-modules cmake/ycm-modules
mkdir -p doc examples extern firmware libraries programs scripts share
mkdir -p scripts/admin scripts/gnome scripts/package
mkdir -p libraries/ExampleLibrary programs/exampleProgram

cp $SCRIPT_DIR/CMakeLists.txt .

cp $SCRIPT_DIR/.gitignore .

cp $SCRIPT_DIR/cmake/CMakeLists.txt cmake

cp $SCRIPT_DIR/cmake/templates/TEMPLATE_NAMEConfig.cmake.in "cmake/templates/"$PROJECT_NAME"Config.cmake.in"

cp $SCRIPT_DIR/cmake/TEMPLATE_NAMEDescribe.cmake "cmake/"$PROJECT_NAME"Describe.cmake"

cp $SCRIPT_DIR/cmake/TEMPLATE_NAMEDoc.cmake "cmake/"$PROJECT_NAME"Doc.cmake"

cp $SCRIPT_DIR/cmake/TEMPLATE_NAMEOptions.cmake "cmake/"$PROJECT_NAME"Options.cmake"

cp $SCRIPT_DIR/cmake/TEMPLATE_NAMEPackage.cmake "cmake/"$PROJECT_NAME"Package.cmake"

cp $SCRIPT_DIR/cmake/TEMPLATE_NAMESystem.cmake "cmake/"$PROJECT_NAME"System.cmake"

cp $SCRIPT_DIR/cmake/TEMPLATE_NAMEVersion.cmake "cmake/"$PROJECT_NAME"Version.cmake"

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
find -type f -exec sed -i "s/TEMPLATE_CM_NAMESPACE/$PROJECT_CM_NAMESPACE/g" {} +
find -type f -exec sed -i "s/TEMPLATE_LOWER/$PROJECT_LOWER/g" {} +
find -type f -exec sed -i "s/TEMPLATE_AUTHOR/$PROJECT_AUTHOR/g" {} +
find -type f -exec sed -i "s/TEMPLATE_LICENSE/$PROJECT_LICENSE/g" {} +
find -type f -exec sed -i "s/TEMPLATE_YEAR/$PROJECT_YEAR/g" {} +
find -type f -exec sed -i "s/TEMPLATE_DESCRIPTION/$PROJECT_DESCRIPTION/g" {} +

echo $PROJECT_DESCRIPTION >> README.md
