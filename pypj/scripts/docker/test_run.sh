#!/bin/sh
# docker run --runtime=nvidia -it --rm gpuenv:simple /bin/bash
docker run --runtime=nvidia -it --rm gpuenv:simple python main.py
