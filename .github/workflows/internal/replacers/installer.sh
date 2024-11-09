#!/bin/bash
set -eu

SHEBANG='#!/bin/bash'

echo "${SHEBANG}" >./dist/install.sh
cat ./assets/warning.txt >>./dist/install.sh

REMOVABLE_HEADER="$(cat ./dist/install.sh)"

echo "${REMOVABLE_HEADER}"

INSTALLER="$(cat ./src/install.sh)"
echo "${INSTALLER//${SHEBANG}/}" >>./dist/install.sh

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

    echo -e "${target//"$1"/"# ${name}${content}\n"}" >./install.sh
}

export -f replace

cd ./dist/

time find ./sub-installers/ -type f -name '*.sh' -print0 |
    xargs -0 -I {} bash -c "replace {} \"${REMOVABLE_HEADER}\""

echo >>./install.sh
