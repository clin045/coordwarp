PET=$1
outdir=$2
base=`basename -s .nii ${PET}`
echo ${base}
T1="../../T1_prep/${base}*_skullstrip*"
echo $T1
workdir=$outdir/${base}_working
mkdir $workdir
export ANTSPATH=/opt/ants/bin
# Rigidly align PET to T1
antsRegistrationSyNQuick.sh -d 3 -f ${T1} -m ${PET} -t r -o ${workdir}/T1xPET
# Register T1 to MNI
antsRegistrationSyNQuick.sh -d 3 -f icbm152_t1_tal_nlin_asym_09c_masked.nii.gz -m ${T1} -o ${workdir}/MNIxT1
## Warp PET to MNI
antsApplyTransforms -d 3 -v 1 -i ${PET} -r icbm152_t1_tal_nlin_asym_09c_masked.nii.gz -o $outdir/${base}_PET_warped_to_MNI.nii -n Linear \
    -t ${workdir}/MNIxT11Warp.nii.gz -t ${workdir}/MNIxT10GenericAffine.mat -t ${workdir}/T1xPET0GenericAffine.mat
