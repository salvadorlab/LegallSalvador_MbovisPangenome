#!/bin/bash
#SBATCH --job-name=aim3_genes       # Job name
#SBATCH --partition=batch             # Partition (queue) name
#SBATCH --nodes=1
#SBATCH --ntasks=1                  # Run on a single CPU
#SBATCH --mem=10gb                     # Job memory request
#SBATCH --time=120:00:00               # Time limit hrs:min:sec
#SBATCH --output=aim3_genes.%j.out    # Standard output log
#SBATCH --error=aim3_genes.%j.err     # Standard error log

#SBATCH --mail-type=BEGIN,END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=noahaus@uga.edu  # Where to send mail


cd $SLURM_SUBMIT_DIR

ml BLAST+
ml Biopython 

while read id; do
    echo $id 
    extract_gene.py -q $id --pa gene_presence_absence.csv --gene_data gene_data.csv -o ./ --dna
    get_first.py $id.fasta > $id.first.fasta 
    blastn -db mbov_genes -query $id.first.fasta  -out $id.out.txt
done < unknown_genes.txt