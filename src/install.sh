#!/bin/bash
set -eu

### GCC
sudo apt-get install -y g++-14=14.2.0-4ubuntu2~24.04

### Libraries
sudo apt-get install -y build-essential
cd /tmp

./sub-installers/AC-Library.sh
./sub-installers/Boost.sh
./sub-installers/Eigen.sh
./sub-installers/GMP.sh
