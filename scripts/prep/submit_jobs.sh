#!/bin/bash
for f in `ls -d ../../T1_prep/*.nii`; do
    bsub -q normal sh prep_T1w.sh $f;
done;
