#!/bin/sh

sudo apt remove --purge cuda* -y
sudo dpkg -i --force-overwrite cuda/cuda-repo-ubuntu1804_10.1.105-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo apt update
sudo apt install cuda -y
