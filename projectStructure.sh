#!/bin/sh

# generateProjectStructure.sh: A simple shell script for generating a project structure

KEPT_DIR=$PWD
echo Project name?
read PROJECT_NAME
echo Project description?
read PROJECT_DESCRIPTION
echo Maintainer?
read PROJECT_MAINTAINER
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

# --- BEGIN: Creating INSTALL ---
# --- END: Creating INSTALL ---

