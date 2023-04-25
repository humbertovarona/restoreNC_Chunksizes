#!/bin/bash

FULLNAME=$(basename "$1")
NCFILENAME=${FULLNAME%.*}
NCEXT=${FULLNAME##*.}

time -p sh -c "cdo -f nc4 copy $1 $1.new"
rm -f $1
mv $1.new $1

ncpack.sh $1
rm -f $1
mv "$NCFILENAME-pkg.$NCEXT" $1

exit 0

