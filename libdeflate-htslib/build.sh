#!/bin/sh

docker build -t htslib:centos7-libdeflate centos7

mkdir -p build
docker run -v $PWD/build:/dist -it --rm htslib:centos7-libdeflate cp /opt/htslib-libdeflate-centos7.tar.gz /dist
