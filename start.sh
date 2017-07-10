#!/bin/bash

for file in `find /input -name *.nii.gz`
do
    /usr/bin/fslview $file &
done
