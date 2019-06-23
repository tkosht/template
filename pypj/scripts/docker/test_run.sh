#!/bin/sh
d=$(cd $(dirname $0)/../../ && pwd)

hostdir="$d/data"                   # host
labdir="/home/gpuser/pj/lab"        # container
datadir="$labdir/examples/data"     # container
workdir="$labdir/examples/vae"      # container

mkdir -p $hostdir

opts="-v $hostdir:$datadir -w $workdir -it --rm"
docker run --runtime=nvidia $opts gpuenv:simple /bin/bash
# docker run --runtime=nvidia $opts gpuenv:pyenv /bin/bash
