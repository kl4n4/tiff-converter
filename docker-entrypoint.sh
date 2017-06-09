#!/bin/bash

filePattern=$1
filePattern=${filePattern:="*.tif"}

for f in /input/$filePattern
do 
    # echo "Processing $f file..."
    bitDepth=$(identify -format "%[depth]" $f)
    echo "$f's bit depth: $bitDepth"
done
