FROM centos:7
RUN echo "include_only=.jp" >> /etc/yum/pluginconf.d/fastestmirror.conf
RUN yum update -y
RUN yum install -y gcc gcc-c++ make autoconf automake git curl libtool file bzip2 xz cmake
RUN mkdir -p /build
WORKDIR /build
ENV LLVM_VERSION=7.0.0
RUN curl -OL http://releases.llvm.org/${LLVM_VERSION}/llvm-${LLVM_VERSION}.src.tar.xz && \
    curl -OL http://releases.llvm.org/${LLVM_VERSION}/cfe-${LLVM_VERSION}.src.tar.xz && \
    curl -OL http://releases.llvm.org/${LLVM_VERSION}/compiler-rt-${LLVM_VERSION}.src.tar.xz && \
    curl -OL http://releases.llvm.org/${LLVM_VERSION}/libcxx-${LLVM_VERSION}.src.tar.xz && \
    curl -OL http://releases.llvm.org/${LLVM_VERSION}/libcxxabi-${LLVM_VERSION}.src.tar.xz && \
    curl -OL http://releases.llvm.org/${LLVM_VERSION}/libunwind-${LLVM_VERSION}.src.tar.xz && \
    curl -OL http://releases.llvm.org/${LLVM_VERSION}/lld-${LLVM_VERSION}.src.tar.xz && \
    curl -OL http://releases.llvm.org/${LLVM_VERSION}/lldb-${LLVM_VERSION}.src.tar.xz && \
    curl -OL http://releases.llvm.org/${LLVM_VERSION}/openmp-${LLVM_VERSION}.src.tar.xz && \
    curl -OL http://releases.llvm.org/${LLVM_VERSION}/polly-${LLVM_VERSION}.src.tar.xz && \
    curl -OL http://releases.llvm.org/${LLVM_VERSION}/clang-tools-extra-${LLVM_VERSION}.src.tar.xz
RUN for i in *.tar.xz; do tar xJf $i; done
ENV PREFIX=/opt/llvm
ENV PATH=/opt/llvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN curl -OL https://cmake.org/files/v3.12/cmake-3.12.2.tar.gz && tar xzf cmake-3.12.2.tar.gz
WORKDIR /build/cmake-3.12.2
RUN ./configure --prefix=${PREFIX} && make -j6 && make install
RUN mkdir -p /build/llvm-${LLVM_VERSION}.src/build
WORKDIR /build/llvm-${LLVM_VERSION}.src/build
RUN cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 .. && make -j6 && make install
RUN mkdir -p /build/cfe-${LLVM_VERSION}.src/build
WORKDIR /build/cfe-${LLVM_VERSION}.src/build
RUN cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 .. && make -j6 && make install
RUN mkdir -p /build/compiler-rt-${LLVM_VERSION}.src/build
WORKDIR /build/compiler-rt-${LLVM_VERSION}.src/build
RUN cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 .. && make -j6 && make install
RUN mkdir -p /build/libcxx-${LLVM_VERSION}.src/build
WORKDIR /build/libcxx-${LLVM_VERSION}.src/build
RUN cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 .. && make -j6 && make install
RUN mkdir -p /build/libcxxabi-${LLVM_VERSION}.src/build
WORKDIR /build/libcxxabi-${LLVM_VERSION}.src/build
RUN cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 .. && make -j6 && make install
RUN mkdir -p /build/libunwind-${LLVM_VERSION}.src/build
WORKDIR /build/libunwind-${LLVM_VERSION}.src/build
RUN cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 .. && make -j6 && make install
RUN mkdir -p /build/lld-${LLVM_VERSION}.src/build
WORKDIR /build/lld-${LLVM_VERSION}.src/build
RUN cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 .. && make -j6 && make install
#RUN mkdir -p /build/lldb-${LLVM_VERSION}.src/build
#WORKDIR /build/lldb-${LLVM_VERSION}.src/build
#RUN cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 .. && make -j6 && make install
RUN mkdir -p /build/openmp-${LLVM_VERSION}.src/build
WORKDIR /build/openmp-${LLVM_VERSION}.src/build
RUN cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=X86 .. && make -j6 && make install
WORKDIR /opt
RUN tar cJf llvm-centos7.tar.xz llvm