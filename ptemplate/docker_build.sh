#!/bin/bash
# If error, exit.
set -e

# Image
IMAGE="ptemplate"

docker build  -t $IMAGE .
