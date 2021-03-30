from glob import glob
import os

for f in glob("../../T1_prep/*_brain_mask.nii.gz"):
    basename = f.split("_brain_mask.")[0]
    brain_file = basename + ".nii.gz"
    cmd = "fslmaths " + brain_file + " -mas " + f + " " + basename + "_skullstripped.nii.gz"
    os.system(cmd)

