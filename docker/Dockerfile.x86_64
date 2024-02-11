FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

#Install required apt libs and packages
RUN apt-get update -y && \
    apt-get autoremove -y && \ 
    apt-get install -y --no-install-recommends \
            wget \
            curl \
            python3.9 \
            python3-pip \
            python3-dev\
            python3-tk \
            ca-certificates \
            lsb-release \
            ninja-build \
            build-essential \
            git \
            software-properties-common \
            cmake \
            libx11-6 ffmpeg libsm6 libxext6 \
            libegl1 \
            libgl1 \
            libgomp1 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Update pip & install pytorch
RUN python3 -m pip install pip --upgrade

RUN pip install torch==2.0.0+cu118 torchvision==0.15.1+cu118 --index-url https://download.pytorch.org/whl/cu118

# Set up environment Arch
ENV TORCH_CUDA_ARCH_LIST="5.2 6.0 6.1 7.0 7.5 8.0 8.6+PTX"


RUN FORCE_CUDA=1 python3 -m pip install 'git+https://github.com/facebookresearch/detectron2.git@v0.6'
RUN python3 -m pip install "git+https://github.com/facebookresearch/pytorch3d.git"

RUN python3 -m pip install \
    setuptools \
    tim \
    opencv-python 

# Install Open3D from the PyPI repositories
# RUN python3 -m pip install --no-cache-dir --upgrade pip && \
#     python3.9 -m pip install --no-cache-dir --upgrade open3d==0.14.1

# User setup
ARG USER=user
ARG UID=1000
ARG GID=1000
# default password
ARG PW=user 

RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd && adduser ${USER} sudo

WORKDIR /home/${USER}
RUN cd /home/${USER} && mkdir -p dagm_mono && chown -R ${UID}:${GID} ./

USER ${UID}:${GID}

