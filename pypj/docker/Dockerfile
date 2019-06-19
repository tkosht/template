FROM nvidia/cuda

MAINTAINER tkosht <takehito.oshita.business@gmail.com>

RUN apt-get update -y && apt-get install -y git sysstat vim tmux

RUN apt-get install -y --no-install-recommends \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel

# - upgrade system
RUN apt-get upgrade -y

# - make links
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN ln -s /usr/bin/pdb3 /usr/bin/pdb

# - prepare the scripts
ARG tmp_dir=/tmp/build
RUN mkdir -p $tmp_dir
COPY requirements.txt $tmp_dir
RUN pip3 install --no-cache-dir -r $tmp_dir/requirements.txt
RUN rm -rf $tmp_dir

RUN useradd -m gpuser
ARG home_dir=/home/gpuser
COPY config/tmux/.tmux.conf $home_dir

ARG lab_dir=$home_dir/pj/lab
RUN mkdir -p $lab_dir
WORKDIR $lab_dir
RUN git clone https://github.com/pytorch/examples.git
RUN pip3 install https://download.pytorch.org/whl/cu100/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl
RUN pip3 install torchvision
RUN chown -R gpuser:gpuser $home_dir

USER gpuser
# WORKDIR $lab_dir
WORKDIR $lab_dir/examples/vae

