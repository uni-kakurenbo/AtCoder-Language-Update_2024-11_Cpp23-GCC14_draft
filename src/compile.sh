#!/bin/bash
set -eu

ARGS=(
    "-std=gnu++23"

    -DONLINE_JUDGE
    -DATCODER

    -O2

    "-mtune=native"
    "-march=native"

    -Wall
    -Wextra

    "-fconstexpr-depth=2147483647"
    "-fconstexpr-loop-limit=2147483647"
    "-fconstexpr-ops-limit=2147483647"

    -I/opt/ac-library/
    -I/opt/boost/include/ -L/opt/boost/lib/
    -I/usr/include/eigen3/
    -I/opt/unordered_dense/
    -lgmpxx -lgmp
)

g++-14 ./Main.cpp -o a.out "${ARGS[@]}"
