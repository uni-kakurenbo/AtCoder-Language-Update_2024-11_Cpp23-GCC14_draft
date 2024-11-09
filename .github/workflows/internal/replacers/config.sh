#!/bin/bash
set -eu

INSTALLER=$(cat ./dist/install.sh)
BUILDER=$(cat ./src/compile.sh)

TARGET=$(cat ./src/install.toml)

mkdir -p ./dist/

TARGET="${TARGET//"\${{ref:installer}}"/"\n${INSTALLER}\n"}"

cat ./assets/warning.txt >./dist/install.toml
echo >>./dist/install.toml
echo -e "${TARGET//"\${{ref:builder}}"/"\n${BUILDER}\n"}" >>./dist/install.toml
