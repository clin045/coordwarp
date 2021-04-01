#!/bin/bash

orig=$1
parentdir=$(dirname "$1")
filename=$(basename "$(basename "$orig" .nii.gz)" .nii)
workdir=$parentdir/${filename}_working
mkdir $workdir
cp $orig $workdir
# prep environment
source scripts/prep/prep_env.sh
# run prep script
sh scripts/prep/prep_T1w.sh $workdir/${filename}.nii*
# apply brain mask
fslmaths $workdir/${filename}.nii.gz -mas $workdir/*_brain_mask.nii.gz $workdir/${filename}_skullstripped.nii.gz

