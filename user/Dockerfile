FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04

# Install some basic utilities
RUN apt-get update -qq
RUN apt-get install -y \
    git \
    zip \
    sudo \
    libx11-6 \
    openssh-server \
    build-essential \
    ca-certificates \
    wget \
    curl \
    tmux \
    htop \
    nano \
    vim

# ####################################################################################
# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' --shell /bin/bash user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

# Install Miniconda
WORKDIR /home/user
RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.6.14-Linux-x86_64.sh \
 && chmod +x ~/Miniconda3-4.6.14-Linux-x86_64.sh\
 && ~/Miniconda3-4.6.14-Linux-x86_64.sh -b -p ~/miniconda \
 && rm ~/Miniconda3-4.6.14-Linux-x86_64.sh
ENV PATH=/home/user/miniconda/condabin/:$PATH
ENV CONDA_AUTO_UPDATE_CONDA=false
RUN conda init

# Create a Python 3.6 environment
RUN conda create -y --name py36 python=3.6.9 && conda clean -ya
RUN echo "conda activate py36" >> .bashrc
ENV CONDA_DEFAULT_ENV=py36
ENV CONDA_PREFIX=/home/user/miniconda/envs/$CONDA_DEFAULT_ENV
ENV PATH=$CONDA_PREFIX/bin:$PATH

# Basic Deep Leaning
RUN conda install -y pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
RUN conda install -y notebook

# Opencv3
RUN sudo apt-get install -y \
    libgtk2.0-0 \
    libcanberra-gtk-module \
    libgl1-mesa-glx \
    python3-pyqt5
RUN pip install opencv-python

RUN pip install scikit-image
RUN pip install scikit-learn
RUN pip install matplotlib
RUN pip install easydict
RUN pip install requests
RUN pip install pyyaml
RUN pip install vtk
RUN pip install mayavi

# ####################################################################################
# RUN sudo rm -rf /var/lib/apt/lists/*
# RUN echo `echo PATH=$PATH`:\$PATH >> .bashrc
# RUN echo "conda activate py36" >> .bashrc
CMD bash
