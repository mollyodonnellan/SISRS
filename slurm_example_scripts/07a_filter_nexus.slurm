#!/bin/bash
#SBATCH --job-name="07a_filter_nexus"
#SBATCH --time=45:00:00  # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=1   # processor core(s) per node - just use 1 - it doesn't parallel
#SBATCH --mail-user="rsschwartz@uri.edu" #CHANGE to your user email address
#SBATCH --mail-type=ALL
#SBATCH --output=slurm_%x_%j.out
#SBATCH --error=slurm_%x_%j.err

cd $SLURM_SUBMIT_DIR

module purge

#CHANGE if not on a URI system
module load Python/3.7.4-GCCcore-8.3.0
module load SciPy-bundle/2019.10-foss-2019b-Python-3.7.4
module load Bowtie2/2.3.5.1-GCC-8.3.0
module load FastQC/0.11.8-Java-1.8
module load BBMap/38.81-foss-2019b-Java-1.8
module load Biopython/1.75-foss-2019b-Python-3.7.4
module load Ray/2.3.1-foss-2019b
module load SAMtools/1.10-GCC-8.3.0
module load BEDTools/2.29.2-GCC-8.3.0

OUTFOLDER=../../SISRS_Small_test #CHANGE to analysis directory

../scripts/sisrs filter_nexus -m 4 8 -f ${OUTFOLDER}/SISRS_Run/alignment_pi.nex
