#!/bin/bash
#SBATCH --job-name=aim3_lineage       # Job name
#SBATCH --partition=batch             # Partition (queue) name
#SBATCH --nodes=1
#SBATCH --ntasks=30                  # Run on a single CPU
#SBATCH --mem=10gb                     # Job memory request
#SBATCH --time=120:00:00               # Time limit hrs:min:sec
#SBATCH --output=aim3_lineage.%j.out    # Standard output log
#SBATCH --error=aim3_lineage.%j.err     # Standard error log

#SBATCH --mail-type=BEGIN,END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=noahaus@uga.edu  # Where to send mail

cd $SLURM_SUBMIT_DIR
ml Miniconda3 
source activate /home/noahaus/.conda/envs/tb-profile


while read tb; do
    # The command to create the json output 
    tb-profiler profile -1 $(echo $tb)_trimmed_R1.fastq -2 $(echo $tb)_trimmed_R2.fastq -m illumina --no_trim --no_flagstat --no_clip --no_delly --dir ./aim3_profiler -t 25 --prefix $tb
done < list_of_isolates.txt

# "lineage": [{"lin": "La1", "family": "M.bovis", "spoligotype": "None", "rd": "None", "frac": 1.0}, {"lin": "La1.8", "family": "M.bovis", "spoligotype": "None", "rd": "None", "frac": 1.0}, {"lin": "La1.8.1", "family": "M.bovis", "spoligotype": "None", "rd": "None", "frac": 1.0}], "main_lin": "La1", "sublin": "La1.8.1"