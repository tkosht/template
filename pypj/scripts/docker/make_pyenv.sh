#!/bin/sh

d=$(cd $(dirname $0) && pwd)

env_name="lab"
if [ "$1" != "" ]; then
    env_name="$1"
fi

# pyver="miniconda3-latest"
pyver="3.6.8"
pyenv install -s $pyver
pyenv virtualenv $pyver $env_name

mkdir -p ~/pj/$env_name
cd ~/pj/$env_name
pyenv local $env_name

echo pip install -r $d/requirements.txt
pip install --upgrade pip
pip install -r $d/../../requirements.txt
pip install https://download.pytorch.org/whl/cu100/torch-1.1.0-cp36-cp36m-linux_x86_64.whl
pip install https://download.pytorch.org/whl/cu100/torchvision-0.3.0-cp36-cp36m-linux_x86_64.whl
git clone https://github.com/pytorch/examples.git


