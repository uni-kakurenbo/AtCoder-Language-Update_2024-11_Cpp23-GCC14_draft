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
    -Wno-misleading-indentation

    "-fconstexpr-depth=2147483647"
    "-fconstexpr-loop-limit=2147483647"
    "-fconstexpr-ops-limit=2147483647"

    -I/opt/ac-library
    -I/opt/boost/gcc/include -L/opt/boost/gcc/lib
    -Igmpxx -lgmp
    -I/usr/include/eigen3
)

g++-14 "${ARGS[@]}" ./Main.cpp
