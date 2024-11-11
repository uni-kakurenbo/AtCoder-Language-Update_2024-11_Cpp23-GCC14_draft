#!/bin/bash
########## AUTO-GENERATED ##########
# Do not modify this file manually #
####################################

# shellcheck disable=all
COMPILE_OPTIONS=(
    "-std=gnu++23"

    -DONLINE_JUDGE
    -DATCODER

    -O2

    "-mtune=native"
    "-march=native"

    -Wall
    -Wextra

    "-fconstexpr-depth=2147483647"
    "-fconstexpr-loop-limit=2147483647"
    "-fconstexpr-ops-limit=2147483647"

    -I/opt/ac-library/
    -I/opt/boost/include/ -L/opt/boost/lib/
    -I/usr/include/eigen3/
    -lgmpxx -lgmp
    -I/opt/unordered_dense/include/ -L/opt/unordered_dense/lib/
)

# shellcheck disable=all
if [[ -v ATCODER ]]; then
    PARALLEL=1
else
    PARALLEL="$(nproc)"
fi

VERSION="14.2.0-4ubuntu2~24.04"

set -eu

### GCC
sudo apt-get install -y "g++-14=${VERSION}"

### Libraries
sudo apt-get install -y build-essential
sudo apt-get install pigz
sudo apt-get install pbzip2

# AC-Library
VERSION="1.5.1"

set -eu

cd /tmp/

sudo wget -q "https://github.com/atcoder/ac-library/releases/download/v${VERSION}/ac-library.zip" -O ./ac-library.zip
sudo unzip -oq ./ac-library.zip -d /opt/ac-library/

# Boost
VERSION="1.86.0"

set -eu

cd /tmp/

mkdir -p ./boost/

sudo wget -q "https://archives.boost.io/release/${VERSION}/source/boost_${VERSION//./_}.tar.bz2" -O ./boost.tar.bz2
sudo tar -I pbzip2 -xf ./boost.tar.bz2 -C ./boost/ --strip-components 1

cd ./boost/

sudo ./bootstrap.sh --with-toolset=gcc --without-libraries=mpi,graph_parallel

BUILD_ARGS=(-d0 "-j$(nproc)" "toolset=gcc" "threading=single" "variant=release" "link=static" "runtime-link=static" "cxxflags=\"-std=gnu++23\"")
sudo ./b2 "${BUILD_ARGS[@]}" stage
sudo ./b2 "${BUILD_ARGS[@]}" --prefix=/opt/boost/ install

# Eigen
VERSION="3.4.0-4"

set -eu

sudo apt-get install -y "libeigen3-dev=${VERSION}"

# GMP
VERSION="2:6.3.0+dfsg-2ubuntu6"

set -eu

sudo apt-get install -y "libgmp3-dev=${VERSION}"

# unordered_dense
VERSION="4.4.0"

set -eu

mkdir -p ./unordered_dense/

sudo wget "https://github.com/martinus/unordered_dense/archive/refs/tags/v${VERSION}.tar.gz" -O ./unordered_dense.tar.gz
sudo tar -I pigz -xf ./unordered_dense.tar.gz -C ./unordered_dense/ --strip-components 1

cd ./unordered_dense/

mkdir -p ./build/ && cd ./build/
sudo cmake "-DCMAKE_INSTALL_PREFIX:PATH=/opt/unordered_dense/" ../
sudo cmake --build ./ --target install --parallel "${PARALLEL}"

