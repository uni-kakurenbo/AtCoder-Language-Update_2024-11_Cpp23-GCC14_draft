#!/bin/bash
set -eu

mkdir -p ./abseil/

sudo wget -q "https://github.com/abseil/abseil-cpp/releases/download/${VERSION}/abseil-cpp-${VERSION}.tar.gz" -O abseil.tar.gz
sudo tar -I pigz -xf abseil.tar.gz -C ./abseil/ --strip-components 1

cd ./abseil/

mkdir -p ./build/ && cd ./build/

BUILD_ARGS=("-DABSL_PROPAGATE_CXX_STD=ON" "-DCMAKE_INSTALL_PREFIX:PATH=/opt/unordered_dense/")

echo "Paralell: ${PARALLEL}"

if [[ -v GIHUB_ACTIONS ]]; then
    sudo cmake "${BUILD_ARGS[@]}" ../
else
    cmake -DABSL_BUILD_TESTING=ON -DABSL_USE_GOOGLETEST_HEAD=ON "${BUILD_ARGS[@]}" ../

    make "-j${PARALLEL}"
    ctest --parallel "${PARALLEL}"
fi

sudo cmake --build ./ --target install --parallel "${PARALLEL}"
