#include <print>
#include <range/v3/all.hpp>
#include <string>

signed main() {
    const std::string msg = "Hello, world.";

    ranges::for_each(msg, [](auto c) { std::print("{} ", c); });
    std::println();
}
