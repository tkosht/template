FROM nvidia/cuda

MAINTAINER tkosht <takehito.oshita.business@gmail.com>

#ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y git sysstat vim tmux

# - for virtualenv / pyenv
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl
# llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev


# - upgrade system
RUN apt-get upgrade -y

# - prepare the scripts
ARG tmp_dir=/tmp/build
ARG script_dir=scripts/docker
ARG tmp_script_dir=$tmp_dir/$script_dir
RUN useradd -m gpuser
RUN mkdir -p $tmp_script_dir
COPY $script_dir/install_pyenv.sh $tmp_script_dir
COPY $script_dir/make_pyenv.sh $tmp_script_dir
COPY $script_dir/git.sh $tmp_script_dir
COPY requirements.txt $tmp_dir
RUN chown -R gpuser:gpuser $tmp_dir
ARG home_dir=/home/gpuser
ARG lab_dir=$home_dir/pj/lab
RUN mkdir -p $lab_dir
RUN chown -R gpuser:gpuser $home_dir

USER gpuser

# - prepare pyenv
ENV PATH $PATH:$home_dir/.pyenv/shims
WORKDIR $tmp_script_dir
RUN sh install_pyenv.sh

WORKDIR $lab_dir
