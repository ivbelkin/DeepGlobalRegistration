ARG PYTORCH="1.8.1"
ARG CUDA="11.1"
ARG CUDNN="8"

FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-devel

ARG CUDA="11.1"
ENV CUDA_HOME=/usr/local/cuda-${CUDA}

ENV TORCH_CUDA_ARCH_LIST="6.1"
ENV TORCH_NVCC_FLAGS="-Xfatbin -compress-all"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-get update && \
    apt-get install -y \
        git \
        wget \
        sudo \
        ninja-build \
        cmake \
        mesa-utils \
        pcl-tools \
        build-essential \
        libopenblas-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install open3d easydict tensorboardx numpy>=1.20.3

RUN pip install -U git+https://github.com/NVIDIA/MinkowskiEngine@02fc608bea \
    -v --no-deps \
    --install-option="--blas=openblas" \
    --install-option="--force_cuda"

ARG USER=user
ARG UID=1000
ARG GROUP=user
ARG GID=1000
ARG PW=user

RUN groupadd -f -g ${GID} ${GROUP} && \
    useradd -m -u ${UID} -g ${GID} ${USER} && \
    echo "${USER}:${PW}" | chpasswd && \
    adduser ${USER} sudo
RUN chown -R ${UID}:${GID} /home/${USER}
WORKDIR /home/${USER}
USER ${UID}:${GID}
