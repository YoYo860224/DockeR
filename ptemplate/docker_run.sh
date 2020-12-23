#!/bin/bash
# If error, exit.
set -e

# Volumes
VOLUMES="-v=/home/$USER/.ssh/:/home/user/.ssh/
         -v=/home/$USER/dataset/KITTI/:/KITTI/
         -v=/home/$USER/Documents/:/home/user/doc/"

# Port
PORT="-p 8701:22"

# GPU
GPU="--gpus all"

# Display
DIS="-e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix"

# Other args
OTHERS="--shm-size 120G"

# Name
NAME="--name ptemplate"

# Image
IMAGE="ptemplate"

# Command
# xhost +
# docker run -it $VOLUMES $PORT $GPU $DIS $OTHERS $NAME $IMAGE
# docker run -it $VOLUMES $PORT $GPU $OTHERS $NAME $IMAGE
docker run -it --rm $VOLUMES $PORT $GPU $OTHERS $NAME $IMAGE
