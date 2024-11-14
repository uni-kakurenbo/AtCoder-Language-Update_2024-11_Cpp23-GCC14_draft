#!/bin/bash
set -eu

cd /tmp/

sudo wget -q https://github.com/microsoft/LightGBM/releases/download/v4.5.0/lightgbm-4.5.0.tar.gz -O ./light-gbm.tar.gz

mkdir -p ./build/ && cd ./build/

cmake -DCMAKE_CXX_FLAGS:STRING="${COMPILE_OPTIONS[*]}" -S ./
cmake --build build --parallel "${PARALLEL}"
