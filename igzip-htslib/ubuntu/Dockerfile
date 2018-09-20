FROM ubuntu:18.04
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y build-essential git curl libtool yasm file
RUN apt-get install -y zlib1g-dev libcurl4-openssl-dev libssl-dev liblzma-dev libbz2-dev libncurses-dev
RUN apt-get install -y autoconf automake 
RUN mkdir -p /build
WORKDIR /build
RUN git clone https://github.com/01org/isa-l.git && git clone https://github.com/informationsea/htslib.git && git clone https://github.com/samtools/samtools.git && git clone https://github.com/samtools/bcftools.git
WORKDIR /build/isa-l
RUN git checkout v2.23.0 && ./autogen.sh && CPPFLAGS="-fPIC" LDFLAGS="-fPIC" ./configure --prefix=/opt/htslib && make && make install && rm /opt/htslib/lib/libisal.so*
ENV CPPFLAGS=-I/opt/htslib/include
ENV LDFLAGS=-L/opt/htslib/lib
WORKDIR /build/htslib
RUN git checkout origin/feature/igzip && autoreconf && ./configure --prefix=/opt/htslib --with-libisal && make -j12 && make check && make install
WORKDIR /build/samtools
RUN git checkout 1.9 && autoreconf && ./configure --prefix=/opt/htslib --with-htslib=/build/htslib && make -j12 && make install && make check
WORKDIR /build/bcftools
RUN git checkout 1.9 && autoreconf && ./configure --prefix=/opt/htslib --with-htslib=/build/htslib && make -j12 && make install && make check
WORKDIR /opt
RUN tar czf htslib-igzip-ubuntu-18.04.tar.gz htslib
