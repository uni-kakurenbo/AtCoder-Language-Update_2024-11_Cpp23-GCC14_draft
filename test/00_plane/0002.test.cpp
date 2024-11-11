#include <coroutine>
#include <print>
#include <generator>

template<class T>
std::generator<T> iota(T end) {
    for(T i = 0; i < end; ++i) {
        co_yield i;
    }
}

signed main() {
    auto g = iota<int>(10);

    for(auto v : g) std::println("{}", v);
}

#include <print>
#include <stacktrace>

void a() {
  std::println("{}", std::stacktrace::current());
}

void b() {
  a();
}

void c() {
    b();
}

void d() {
    c();
}

signed main() {
    a();
    b();
    c();
    d();
}
