#!/bin/bash
set -ue

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
    -I/opt/boost/gcc/include/ -L/opt/boost/gcc/lib/
    -I/usr/include/eigen3/
    -lgmpxx -lgmp
)

g++-14 ./Main.cpp "${ARGS[@]}"
