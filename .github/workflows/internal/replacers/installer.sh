#!/bin/bash
set -eu

SHEBANG='#!/bin/bash'

{
    echo "${SHEBANG}"
    cat ./assets/warning.txt
} >./dist/install.sh

HEADER="$(cat ./dist/install.sh)"

VERSION="$(dasel -r toml -w json <./src/install.toml | jq '.version')"
{
    echo
    cat ./src/compile-options.sh
    echo
    cat ./assets/parallel.sh
    echo -e "\nVERSION=${VERSION}"
} >>./dist/install.sh

INSTALLER="$(sed -e '/^\#/d' ./src/install.sh)"
echo -e "${INSTALLER//${SHEBANG}/}" >>./dist/install.sh

mkdir -p ./dist/

function replace() {
    local name
    name="$(basename "$1")"
    name="${name//.sh/}"

    local content
    content="$(cat "$1")"
    content="${content//"$2"/}"

    local target
    target=$(cat ./install.sh)

    echo -e "${target//"$1"/"\n# ${name}${content}\n"}" >./install.sh
}

export -f replace

cd ./dist/

find ./sub-installers/ -type f -name '*.sh' -print0 |
    xargs -0 -I {} bash -c "replace {} \"${HEADER}\""

echo >>./install.sh
