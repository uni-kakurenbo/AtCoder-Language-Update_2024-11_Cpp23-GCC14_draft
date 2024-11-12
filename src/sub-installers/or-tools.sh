#!/bin/bash
set -eu

cd /tmp/

mkdir -p ./or-tools/

sudo wget -q "https://github.com/google/or-tools/archive/refs/tags/v${VERSION}.tar.gz" -O ./or-tools.tar.gz
sudo tar -I pigz -xf ./or-tools.tar.gz -C ./or-tools/ --strip-components 1

cd ./or-tools/

sudo cmake -S . -B build -DBUILD_DEPS=ON -DCMAKE_INSTALL_PREFIX:PATH=/opt/or-tools/
sudo cmake --build build --config Release --target install -v --parallel "${PARALLEL}"

if [[ ! -v GITHUB_ACTIONS ]]; then
    sudo cmake --build build --config Release --target test -v --parallel "${PARALLEL}"
fi
