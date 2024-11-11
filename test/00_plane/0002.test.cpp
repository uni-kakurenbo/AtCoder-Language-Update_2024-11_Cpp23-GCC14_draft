#include <print>
#include <stacktrace>

void a() {
  std::println("{}", std::stacktrace::current());
}

void b() {
  a();
}

void c() {
    a();
    b();
}

void d() {
    a();
    b();
    c();
}

signed main() {
    a();
    b();
    c();
    d();
}
