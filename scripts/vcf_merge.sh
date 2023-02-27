#!/bin/bash
#SBATCH --job-name=aim3_merge       # Job name
#SBATCH --partition=batch             # Partition (queue) name
#SBATCH --nodes=1
#SBATCH --ntasks=1                  # Run on a single CPU
#SBATCH --mem=50gb                     # Job memory request
#SBATCH --time=120:00:00               # Time limit hrs:min:sec
#SBATCH --output=aim3_merge.%j.out    # Standard output log
#SBATCH --error=aim3_merge.%j.err     # Standard error log

#SBATCH --mail-type=BEGIN,END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=noahaus@uga.edu  # Where to send mail


cd $SLURM_SUBMIT_DIR
ml VCFtools

ls | grep ".vcf.gz" | xargs -I {} tabix -p vcf {}

vcf-merge $(ls | grep "vcf.gz" | tr '\n' ' ') > mbov_pyseer.out.vcf 
gzip mbov_pyseer.out.vcf 