FROM centos:7
RUN yum install -y epel-release
RUN yum update -y
RUN yum install -y gcc make autoconf automake git curl libtool file
RUN yum install -y zlib-devel libcurl-devel openssl-devel xz-devel bzip2-devel ncurses-devel yasm
RUN mkdir -p /build
WORKDIR /build
RUN curl -OL https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.xz && git clone https://github.com/01org/isa-l.git && git clone https://github.com/informationsea/htslib.git && git clone https://github.com/samtools/samtools.git && git clone https://github.com/samtools/bcftools.git
RUN tar xJf nasm-2.13.03.tar.xz
WORKDIR /build/nasm-2.13.03
#RUN ./configure && make && make install # remove comment to enable AVX512 support
WORKDIR /build/isa-l
RUN git checkout v2.23.0 && ./autogen.sh && CPPFLAGS="-fPIC" LDFLAGS="-fPIC" ./configure --prefix=/opt/htslib && make -j12 && make install && rm /opt/htslib/lib/libisal.so*
ENV CPPFLAGS=-I/opt/htslib/include
ENV LDFLAGS=-L/opt/htslib/lib
WORKDIR /build/htslib
RUN git checkout origin/feature/igzip && autoreconf && ./configure --prefix=/opt/htslib --with-libisal && make -j12 && make check && make install
WORKDIR /build/samtools
RUN git checkout 1.9 && autoreconf && ./configure --prefix=/opt/htslib --with-htslib=/build/htslib && make -j12 && make install && make check
WORKDIR /build/bcftools
RUN git checkout 1.9 && autoreconf && ./configure --prefix=/opt/htslib --with-htslib=/build/htslib && make -j12 && make install && make check
WORKDIR /opt
RUN tar czf htslib-igzip-centos7.tar.gz htslib
