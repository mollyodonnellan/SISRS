#!/bin/bash
#SBATCH --job-name="01_setup"
#SBATCH --time=1:00:00  # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=1   # processor core(s) per node
#SBATCH --mail-user="rsschwartz@uri.edu" #CHANGE TO user email address
#SBATCH --mail-type=ALL
#SBATCH -p uri-cpu #CHANGE if not on Unity
#SBATCH --output=slurm_%x_%j.out
#SBATCH --error=slurm_%x_%j.err

cd $SLURM_SUBMIT_DIR

module purge

#CHANGE THESE IF NOT ON UNITY
module load uri/main bio/Biopython/1.79-intel-2022a

D=../SISRS_Small #CHANGE THIS to the path for the folder containing folders of fastq.gz
DIR=../../SISRS_Small_test #CHANGE THIS to the path for the output of your analysis

../scripts/sisrs setup -d $D -dir $DIR
