#!/bin/bash
#SBATCH --job-name=power_sim
#SBATCH --partition=wrobel
#SBATCH --output=power_sim.out
#SBATCH --error=power_sim.err

module purge
module load R

# Submit a single scenario (scenario 1: n = 25)
# In Part 2 of the lab you will convert this to an array job
JOBID=1
Rscript power_sim.R $JOBID
