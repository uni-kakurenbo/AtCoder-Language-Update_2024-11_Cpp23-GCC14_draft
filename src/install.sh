#!/bin/bash
set -eu

### GCC
sudo apt-get install -y "g++-14=${VERSION}"

### Libraries
sudo apt-get install -y build-essential pigz pbzip2

./sub-installers/abseil.sh
./sub-installers/AC-Library.sh
./sub-installers/Boost.sh
./sub-installers/Eigen.sh
./sub-installers/GMP.sh
./sub-installers/unordered_dense.sh

sudo apt-get remove -y --auto-remove build-essential pigz pbzip2
