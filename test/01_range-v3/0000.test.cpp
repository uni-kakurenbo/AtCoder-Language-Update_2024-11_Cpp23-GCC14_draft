#include <print>
#include <string>
#include <range/v3/all.hpp>

signed main() {
    const std::string msg = "Hello, world.";

    ranges::for_each(msg, [](auto c) { std::print("{} ", c); });
    std::println();
}
