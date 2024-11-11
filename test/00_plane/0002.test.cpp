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
