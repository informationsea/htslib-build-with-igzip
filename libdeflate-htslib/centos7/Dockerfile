FROM centos:7
RUN yum install -y epel-release
RUN yum update -y
RUN yum install -y gcc make autoconf automake git curl libtool yasm file
RUN yum install -y zlib-devel libcurl-devel openssl-devel xz-devel bzip2-devel ncurses-devel
RUN mkdir -p /build
WORKDIR /build
RUN git clone https://github.com/ebiggers/libdeflate.git && git clone https://github.com/samtools/htslib.git && git clone https://github.com/samtools/samtools.git && git clone https://github.com/samtools/bcftools.git
ENV LIB_CFLAGS="-fPIC"
ENV CPPFLAGS="-I/build/libdeflate -fPIC"
ENV LDFLAGS="-L/build/libdeflate -fPIC"
WORKDIR /build/libdeflate
RUN git checkout v1.0 && make -j12 && rm libdeflate.so
WORKDIR /build/htslib
RUN git checkout 1.9 && autoreconf && ./configure --prefix=/opt/htslib --with-libdeflate=/build/libdeflate && make -j12 && make check && make install
WORKDIR /build/samtools
RUN git checkout 1.9 && autoreconf && ./configure --prefix=/opt/htslib --with-htslib=/build/htslib && make -j12 && make install && make check
WORKDIR /build/bcftools
RUN git checkout 1.9 && autoreconf && ./configure --prefix=/opt/htslib --with-htslib=/build/htslib && make -j12 && make install && make check
WORKDIR /opt
RUN tar czf htslib-libdeflate-centos7.tar.gz htslib
