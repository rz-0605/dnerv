#!/bin/bash

#SBATCH --job-name=dnerv
#SBATCH --output=outfiles/debug.out.%j
#SBATCH --error=outfiles/debug.out.%j
#SBATCH --time=48:00:00
#SBATCH --qos=scavenger
#SBATCH --partition=scavenger
#SBATCH --account=scavenger
#SBATCH --gres=gpu:rtxa4000:1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G

module load cuda/11.8.0

source /fs/nexus-scratch/rz0605/mediainrenv/bin/activate

srun bash -c "CUDA_VISIBLE_DEVICES=0 python -u main.py --cfg_path=cfgs/DNeRV.yaml --output_dir=output"


