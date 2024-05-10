#!/bin/bash

#SBATCH -p shared
#SBATCH --job-name=transfer_files 
#SBATCH --mail-user=sparthi1@jhu.edu
#SBATCH --mail-type=ALL
#SBATCH -o logs/transfer.txt
#SBATCH -e logs/transfer.txt
#SBATCH -t 7-00:00:00
#SBATCH --partition=transfer


echo "**** Job starts ****"
date +"%Y-%m-%d %T"
echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${SLURM_JOB_ID}"
echo "Job name: ${SLURM_JOB_NAME}"
echo "Node name: ${SLURMD_NODENAME}"
echo "Task id: ${SLURM_ARRAY_TASK_ID}"

data_dir=/users/sparthib/public_sequin_data/raw_data
output_dir=/dcs04/hicks/data/sparthib/public_sequin_data/
genome_bams=${data_dir}/genome_bams.txt
transcriptome_bams=${data_dir}/transcriptome_bams.txt
bigwigs=${data_dir}/bigwigs.txt
fastqs=${data_dir}/fastqs.txt

# Transfer genome bams
wget -i ${genome_bams} -P ${output_dir}/genome_bams

# Transfer transcriptome bams
wget -i ${transcriptome_bams} -P ${output_dir}/transcriptome_bams

# Transfer bigwigs
wget -i ${bigwigs} -P ${output_dir}/bigwigs

# Transfer fastqs
wget -i ${fastqs} -P ${output_dir}/fastqs

echo "**** Job ends ****"
date +"%Y-%m-%d %T"