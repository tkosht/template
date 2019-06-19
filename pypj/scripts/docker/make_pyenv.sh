#!/bin/sh

d=$(cd $(dirname $0) && pwd)

env_name="lab"
if [ "$1" != "" ]; then
    env_name="$1"
fi

# pyver="miniconda3-latest"
pyver="python3.6"
pyenv install -s $pyver
pyenv versions
pyenv virtualenv $pyver $env_name

mkdir -p ~/pj/$env_name
cd ~/pj/$env_name
pyenv local $env_name

echo pip install -r $d/requirements.txt
pip install -r $d/../../requirements.txt
