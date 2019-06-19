#!/bin/sh
# echo "$0 [pyenv|simple|--debug] " >&2
d=$(cd $(dirname $0)/../../ && pwd)

log_dir="$d/log"
mkdir -p $log_dir
log_file="$log_dir/docker.build.log"

echo "`date +'%Y/%m/%d %T'` - Start" > $log_file

tag="simple"
docker_file="$d/docker/Dockerfile"
if [ "$1" = "simple" ]; then
    shift
elif [ "$1" = "pyenv" ]; then
    tag="$1"
    docker_file="$d/docker/pyenv/Dockerfile"
    shift
fi

opt_cache="--no-cache=true"
if [ "$1" = "-d" -o "$1" = "--debug" ]; then
    opt_cache=""
fi

echo "docker build -f $docker_file $d -t gpuenv:$tag $opt_cache"
docker build -f $docker_file $d -t gpuenv:$tag $opt_cache

echo "`date +'%Y/%m/%d %T'` - End" >> $log_file
