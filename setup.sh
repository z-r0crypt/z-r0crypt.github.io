#!/bin/bash

# Quick setup script to config a Hugo
# blog on a new computer.

set -e

DESTINATION="z-r0crypt.github.io"
GIT="git@github.com:z-r0crypt/z-r0crypt.github.io.git"

echo -e "\033[0;32mCloning blog source..\033[0m"
git clone -b source $GIT $DESTINATION
cd $DESTINATION

echo -e "\033[0;32mCloning blog build directory (public)..\033[0m"
git clone -b master $GIT public

if ! command -v hugo
then
	echo -e "\033[0;32mHugo might not be installed. Double check it..\033[0m"
fi
