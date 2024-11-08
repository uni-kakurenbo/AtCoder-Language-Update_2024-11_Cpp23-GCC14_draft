#!/bin/bash

set -eu

cd ./test/
mkdir -p ./tmp/

cp ./sample.cpp ./tmp/Main.cpp
cp ../compile.sh ./tmp/compile.sh

cd ./tmp/
./compile.sh
./a.out

cd ..
rm -rf ./tmp/
