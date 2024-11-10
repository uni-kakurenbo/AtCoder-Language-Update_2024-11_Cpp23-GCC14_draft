#!/bin/bash
set -eu

### GCC
sudo apt-get install -y "g++-14=${VERSION}"

### Libraries
sudo apt-get install -y build-essential
sudo apt-get install pigz
sudo apt-get install pbzip2

cd /tmp

./sub-installers/AC-Library.sh
./sub-installers/Boost.sh
./sub-installers/Eigen.sh
./sub-installers/GMP.sh
