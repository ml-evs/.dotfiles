#!/bin/bash

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -p $HOME/.local/conda -b

chmod 444 $HOME/.local/conda/lib/python3.7/site-packages

yes | conda create -n dev python=3.7 --file $HOME/.dotfiles/dev_requirements.txt
conda activate dev
pip install black
conda deactivate
