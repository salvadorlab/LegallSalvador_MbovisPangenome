#!/bin/bash
#SBATCH --job-name=aim3_mltree       # Job name
#SBATCH --partition=batch             # Partition (queue) name
#SBATCH --nodes=1
#SBATCH --ntasks=30                  # Run on a single CPU
#SBATCH --mem=50gb                     # Job memory request
#SBATCH --time=120:00:00               # Time limit hrs:min:sec
#SBATCH --output=aim3_mltree.%j.out    # Standard output log
#SBATCH --error=aim3_mltree.%j.err     # Standard error log

#SBATCH --mail-type=BEGIN,END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=noahaus@uga.edu  # Where to send mail


cd $SLURM_SUBMIT_DIR
~/iqtree-2.1.3-Linux/bin/iqtree2 -s core.aln -m MFP -nt 25 -bb 1000 -pre mbov_coresnp