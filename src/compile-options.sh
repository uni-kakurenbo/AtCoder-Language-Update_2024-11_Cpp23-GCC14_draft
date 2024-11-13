# shellcheck disable=all
COMPILE_OPTIONS=(
    "-std=gnu++23"

    -DONLINE_JUDGE
    -DATCODER

    -fcoroutines

    "-flto=auto"

    -O2

    "-mtune=native"
    "-march=native"

    -Wall
    -Wextra

    "-fconstexpr-depth=2147483647"
    "-fconstexpr-loop-limit=2147483647"
    "-fconstexpr-ops-limit=2147483647"

    -lstdc++exp

    -I/opt/abseil/include/ -L/opt/abseil/lib/
    -I/opt/ac-library/
    -I/opt/boost/include/ -L/opt/boost/lib/
    -I/usr/include/eigen3/
    -lgmpxx -lgmp
    -I/opt/range-v3/include/
    -I/opt/unordered_dense/include/ -L/opt/unordered_dense/lib/

    -I/opt/libtorch/include/ -I/opt/libtorch/include/torch/csrc/api/include/ -L/opt/libtorch/lib/
    -Wl,-R/opt/libtorch/lib/ -ltorch -ltorch_cpu -lc10

    -I/opt/or-tools/include/ -L/opt/or-tools/lib/
    -Wl,-R/opt/or-tools/lib/ -lortools -lprotobuf
)
