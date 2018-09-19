#!/bin/sh

sudo docker build -t htslib:centos7 centos7
sudo docker build -t htslib:ubuntu18.04 ubuntu
sudo docker build -t htslib:ubuntu16.04 ubuntu16.04

mkdir -p build
sudo docker run -v $PWD/build:/dist -it --rm htslib:centos7 cp /opt/htslib-igzip-centos7.tar.gz /dist
sudo docker run -v $PWD/build:/dist -it --rm htslib:ubuntu18.04 cp /opt/htslib-igzip-ubuntu-18.04.tar.gz /dist
sudo docker run -v $PWD/build:/dist -it --rm htslib:ubuntu16.04 cp /opt/htslib-igzip-ubuntu-16.04.tar.gz /dist
