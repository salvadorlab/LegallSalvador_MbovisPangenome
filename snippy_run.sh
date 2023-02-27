#!/bin/bash
#SBATCH --job-name=aim3_snippy       # Job name
#SBATCH --partition=batch             # Partition (queue) name
#SBATCH --nodes=1
#SBATCH --ntasks=30                  # Run on a single CPU
#SBATCH --mem=50gb                     # Job memory request
#SBATCH --time=120:00:00               # Time limit hrs:min:sec
#SBATCH --output=aim3_snippy.%j.out    # Standard output log
#SBATCH --error=aim3_snippy.%j.err     # Standard error log

#SBATCH --mail-type=BEGIN,END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=noahaus@uga.edu  # Where to send mail

ml Miniconda3/4.10.3
conda activate /scratch/noahaus/snippy_test 

cd $SLURM_SUBMIT_DIR
sh runme.sh