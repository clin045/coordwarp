for f in ../../pet_registered/*.nii; do
    base=`basename "${f}" .nii`
    echo $base
    flirt -in $f -ref /PHShome/cl20/fsl/data/standard/MNI152_T1_2mm.nii.gz -datatype float -interp spline -applyxfm -usesqform -out /PHShome/cl20/PET/pet_registered/${base}_reslice.nii.gz;
done;
