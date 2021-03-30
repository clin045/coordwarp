module load singularity
for f in ../../pet_data/*.nii; do
    echo $f
    bsub -q normal singularity run /data/nimlab/singularity_containers/ants.sif ./ants_reg.sh $f ../../pet_registered/;
done;
