#include <print>
#include <range/v3/all.hpp>
#include <string>

signed main() {
    const std::string msg = "Hello, World.";

    ranges::for_each(msg, [](auto c) { print("{} ", c); });
    std::println();
}
