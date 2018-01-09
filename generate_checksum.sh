#!/bin/sh

function usage() {
    echo "usage:"
    echo "generate_checksum.sh checksum_type file"
    echo "for example:"
    echo "generate_checksum.sh md5sum test.txt"
    exit 0
}

if [ -z "$1" ]; then
    usage
fi

if [ -z "$2" ]; then
    usage
fi

checksum=$1
filename=$2
checksum_file="$filename.$checksum"

value=`$checksum $filename`
echo $value
echo $value > $checksum_file
