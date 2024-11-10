#!/bin/bash
set -eu

SHEBANG='#!/bin/bash'

{
    echo "${SHEBANG}"
    cat ./assets/warning.txt
    echo
    cat ./src/compile-options.sh

    TARGET="$(cat ./src/compile.sh)"
    echo "${TARGET//"${SHEBANG}"/}"
} >./dist/compile.sh