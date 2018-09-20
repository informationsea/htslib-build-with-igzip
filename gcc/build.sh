#!/bin/sh

docker build -t gcc8:centos7 centos7
docker run -v $PWD/build:/dist -it --rm gcc8:centos7 cp /opt/gcc-8.2.0-centos7.tar.gz /dist