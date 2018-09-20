#!/bin/sh

docker build -t llvm:centos7 centos7
docker run -v $PWD/build:/dist -it --rm llvm:centos7 cp /opt/llvm-centos7.tar.xz /dist