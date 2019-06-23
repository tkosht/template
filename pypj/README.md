# README for `template` repository

# environment

- OS: Ubuntu 18.04.2 LTS (Bionic Beaver)
- Memory: 64GB
- CPU: Intel(R) Core(TM) i7-7700K CPU @ 4.20GHz
    - 4 cpu cores
- GPU: GeForce GTX 1080Ti
- CUDA: release 10.1
- PyTorch: 1.0.1, 1.1.0


# installation for docker environment

## cuda10
```bash
cd $(git rev-parse --show-toplevel)/pypj/scripts/docker
sh install_cuda10.sh
```

## cudnn
you must download cudnn for cuda10,
which named `cudnn-10.0-linux-x64-v7.5.0.56.tgz`,
and placed current dir
```bash
cd $(git rev-parse --show-toplevel)/pypj/scripts/docker
install_cudnn.sh
```


## nvidia-docker2 installation
```bash
cd $(git rev-parse --show-toplevel)/pypj/scripts/docker
sh install_docker.sh
```

## docker-compose installation
```bash
cd $(git rev-parse --show-toplevel)/pypj/scripts/docker
sh install_docker-compose.sh
```

## test for nvidia-docker2 installation
```bash
docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
```


# to build docker for gpuenv:simple

```bash
cd $(git rev-parse --show-toplevel)/pypj/scripts/docker
sh build.sh
```

# to debug for build
```bash
cd $(git rev-parse --show-toplevel)/pypj/scripts/docker
sh build.sh --debug
```

# test for build gpuenv:simple
execute vae example for pytorch
```bash
docker run --runtime=nvidia -it --rm gpuenv:simple python main.py
```

or do as follow:

```bash
cd $(git rev-parse --show-toplevel)/pypj/scripts/docker
sh run.sh
```

# to build docker for gpuenv:pyenv
```bash
cd $(git rev-parse --show-toplevel)/pypj/scripts/docker
sh build.sh
```

# test for build gpuenv:pyenv
execute vae example for pytorch
```bash
docker run --runtime=nvidia -it --rm gpuenv:pyenv python main.py
```
