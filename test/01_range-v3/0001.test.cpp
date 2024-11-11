#include <print>
#include <string>
#include <range/v3/all.hpp>

signed main() {
    const std::string a = "ABCD";
    const std::string b = "1234";

    ranges::for_each(
        ranges::views::concat(a, b) | ramges::views::cycle | ranges::views::take(30),
        [](auto c) { std::print("{}", c); }
    );
    std::println();
}
