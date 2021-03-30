from glob import glob
import os

for f in glob("../../pet_registered/*_reslice.nii.gz"):
    basename = os.path.basename(f).split(".")[0]
    brain_file = basename + ".nii.gz"
    cmd = "fslmaths " + f + " -mas MNI152_T1_2mm_brain_mask_dil.nii.gz" +  " " + basename + "_masked.nii.gz"
    os.system(cmd)

