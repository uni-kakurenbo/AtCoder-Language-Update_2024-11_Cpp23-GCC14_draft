# shellcheck disable=all
if [[ -v ATCODER ]]; then
    PARALLEL=1
else
    PARALLEL="$(nproc)"
fi
