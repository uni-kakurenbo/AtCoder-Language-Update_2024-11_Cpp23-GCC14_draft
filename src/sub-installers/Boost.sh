#!/bin/bash
set -eu

sudo wget "https://archives.boost.io/release/${VERSION}/source/boost_${VERSION//./_}.tar.bz2" -O boost.tar.bz2
sudo tar -jxf boost.tar.bz2

cd ./boost/

sudo ./bootstrap.sh --with-toolset=gcc --without-libraries=mpi,graph_parallel

BUILD_ARGS=("-j3" "toolset=gcc" "threading=single" "variant=release" "link=static" "runtime-link=static" "cxxflags=\"-std=gnu++23\"")
sudo ./b2 "${BUILD_ARGS[@]}" stage
sudo ./b2 "${BUILD_ARGS[@]}" --prefix=/opt/boost/gcc install
