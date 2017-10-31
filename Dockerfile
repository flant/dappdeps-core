# compile sources

FROM ubuntu:16.04

WORKDIR /

RUN apt-get update && \
apt-get install -y build-essential gawk wget && \
wget https://ftp.gnu.org/gnu/glibc/glibc-2.26.tar.gz && \
tar xf glibc-2.26.tar.gz

RUN cd /glibc-2.26 && \
mkdir build && \
cd build && \
../configure --prefix=/.dapp/deps/core/0.1.0 \
--disable-werror \
--enable-kernel=3.2 \
--enable-stack-protector=strong \
libc_cv_slibdir=/.dapp/deps/core/0.1.0/lib

RUN cd /glibc-2.26/build && \
make -j4 && \
make install

# dappdeps-core

FROM scratch
COPY --from=0 /.dapp/deps/core/0.1.0 .
