#!/bin/bash
#SBATCH --job-name=aim3_tajima       # Job name
#SBATCH --partition=batch             # Partition (queue) name
#SBATCH --nodes=1
#SBATCH --ntasks=10                 # Run on a single CPU
#SBATCH --mem=50gb                     # Job memory request
#SBATCH --time=24:00:00               # Time limit hrs:min:sec
#SBATCH --output=aim3_tajima.%j.out    # Standard output log
#SBATCH --error=aim3_tajima.%j.err     # Standard error log

#SBATCH --mail-type=BEGIN,END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=noahaus@uga.edu  # Where to send mail

ml Biopython

cd /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/cluster1
ls | grep ".fasta" > cluster_seq.txt 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/tajimas_d.py ./ 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/align_seqs.sh ./ 
python tajimas_d.py > cluster1_results.out &

cd /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/cluster2
ls | grep ".fasta" > cluster_seq.txt 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/tajimas_d.py ./ 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/align_seqs.sh ./ 
python tajimas_d.py > cluster2_results.out &

cd /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/cluster3
ls | grep ".fasta" > cluster_seq.txt 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/tajimas_d.py ./ 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/align_seqs.sh ./ 
python tajimas_d.py > cluster3_results.out &

cd /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/cluster4
ls | grep ".fasta" > cluster_seq.txt 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/tajimas_d.py ./ 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/align_seqs.sh ./ 
python tajimas_d.py > cluster4_results.out &

cd /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/cluster5
ls | grep ".fasta" > cluster_seq.txt 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/tajimas_d.py ./ 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/align_seqs.sh ./ 
python tajimas_d.py > cluster5_results.out &

#already done
cd /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/cluster6
python tajimas_d.py > cluster6_results.out&

cd /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/cluster7
ls | grep ".fasta" > cluster_seq.txt 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/tajimas_d.py ./ 
cp /scratch/noahaus/aim_3/worldwide_data/examp/aim3_pangenome/align_seqs.sh ./ 
python tajimas_d.py > cluster7_results.out &

