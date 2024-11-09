#!/bin/bash

set -eu

installer=$(cat ./install.sh)
builder=$(cat ./compile.sh)

target=$(cat ./install.toml)

mkdir -p ./dist/

target="${target//"\${{ref:installer}}"/"\n${installer}\n"}"

cat ./assets/warn.txt >./dist/install.toml
echo >>./dist/install.toml
echo "${target//"\${{ref:builder}}"/"\n${builder}\n"}" >>./dist/install.toml
