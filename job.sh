#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --account=ctb-wsmith
#SBATCH --mem=35G             # memory, roughly 2 times %mem defined in the input name.com file
#SBATCH --time=40:00:00      # expect run time (DD-HH:MM)
#SBATCH --cpus-per-task=6   # No. of cpus for the job as defined by %nprocs in the name.com file
#SBATCH --output=name.log    # output file

export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}


module load gaussian/g16.a03

g16 XXX_c${SLURM_ARRAY_TASK_ID}.mol2.com

