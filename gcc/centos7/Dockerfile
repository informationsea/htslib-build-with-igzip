FROM centos:7
RUN echo "include_only=.jp" >> /etc/yum/pluginconf.d/fastestmirror.conf
RUN yum update -y
RUN yum install -y gcc gcc-c++ make autoconf automake git curl libtool file bzip2 xz autogen
RUN mkdir -p /build
WORKDIR /build
RUN curl -OL https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2 && \
    tar xjf gmp-6.1.2.tar.bz2 && \
    curl -OL https://www.mpfr.org/mpfr-3.1.6/mpfr-3.1.6.tar.gz && \
    tar xzf mpfr-3.1.6.tar.gz  && \
    curl -OL https://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz && \
    tar xzf mpc-1.0.3.tar.gz && \
    curl -OL http://www.ring.gr.jp/archives/GNU/gcc/gcc-8.2.0/gcc-8.2.0.tar.xz && \
    tar xJf gcc-8.2.0.tar.xz
WORKDIR /build/gmp-6.1.2
RUN ./configure --prefix=/opt/gcc && make -j8 && make check && make install
WORKDIR /build/mpfr-3.1.6
RUN ./configure --prefix=/opt/gcc --with-gmp=/opt/gcc && make -j8 && make check && make install
WORKDIR /build/mpc-1.0.3
RUN ./configure --prefix=/opt/gcc --with-gmp=/opt/gcc --with-mpfr=/opt/gcc && make -j8 && make check && make install
WORKDIR /build/gcc-8.2.0
RUN ./configure --prefix=/opt/gcc --disable-multilib --with-gmp=/opt/gcc --with-mpfr=/opt/gcc --with-mpc=/opt/gcc --enable-languages=c,c++,fortran,lto && make -j8 && make check && make install
WORKDIR /opt
RUN tar cJf gcc-8.2.0-centos7.tar.xz gcc