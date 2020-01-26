#!/bin/bash
#
# Start a new post!
# @leonjza - 2018

set -e

# ensure we have a title as arg
if [ $# -eq 0 ]
then
    echo -e "\033[0;31mI need a post name!\033[0m"
    exit
fi

name="$@"
date=`date +%Y-%m-%d`
path="post/"

# build the path, replacing spaces with dashes
title=$path$date"-"${name// /-}

# Update local source with remote
echo -e "\033[0;32mGenerating new post with title: $title...\033[0m"
hugo new "$title.markdown"

