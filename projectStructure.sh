#!/bin/sh

# generateProjectStructure.sh: A simple shell script for generating a project structure

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROJECT_YEAR=`date +"%Y"`
KEPT_DIR=$PWD
echo Project name \(as in PROJECT_STRUCTURE\)?
read PROJECT_NAME
echo Project description?
read PROJECT_DESCRIPTION
echo AUTHOR?
read PROJECT_AUTHOR
echo Installation directory "["${KEPT_DIR}"]"?
read INSTALL_DIR
if [ -z "$INSTALL_DIR" ]; then
	INSTALL_DIR=$KEPT_DIR
fi
echo Creating folder structure for project in \"$INSTALL_DIR\"...
cd $INSTALL_DIR
mkdir -p cmake doc example extern firmware libraries programs scripts share
mkdir -p cmake/template
mkdir -p scripts/admin scripts/gnome

cp $SCRIPT_DIR/CMakeLists.txt .
sed -i "s/TEMPLATE_NAME/$PROJECT_NAME/g" CMakeLists.txt
sed -i "s/TEMPLATE_AUTHOR/$PROJECT_AUTHOR/g" CMakeLists.txt
sed -i "s/TEMPLATE_YEAR/$PROJECT_YEAR/g" CMakeLists.txt

cp $SCRIPT_DIR/cmake/template/TEMPLATE_NAMEConfig.cmake.in "cmake/template/"$PROJECT_NAME"Config.cmake.in"
sed -i "s/TEMPLATE_NAME/$PROJECT_NAME/g" "cmake/template/"$PROJECT_NAME"Config.cmake.in"

cp $SCRIPT_DIR/cmake/template/TEMPLATE_NAMEConfigUninstall.cmake.in "cmake/template/"$PROJECT_NAME"ConfigUninstall.cmake.in"
# sed -i "s/TEMPLATE_NAME/$PROJECT_NAME/g" "cmake/template/"$PROJECT_NAME"ConfigUninstall.cmake.in"  #-- Not needed

