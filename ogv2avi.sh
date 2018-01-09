#!/bin/bash

if [ -z "$1" ]; then
        echo "$0 out.ogv"
        exit 0
fi


echo "begin convert $1"
echo "output to ${1/%ogv/avi}"

#mencoder "$1" -o "${1/%ogv/avi}" -ovc lavc -oac mp3lame
mencoder "$1" -o "${1/%ogv/avi}" -nosound -ovc xvid -xvidencopts pass=1
