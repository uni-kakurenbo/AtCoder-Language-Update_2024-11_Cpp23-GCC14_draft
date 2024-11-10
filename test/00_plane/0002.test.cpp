#include <coroutine>
#include <print>

template<class T>
struct generator {
    struct promise_type {
        T _v;

        generator get_return_object() { return generator(*this); }

        std::suspend_always initial_suspend() { return {}; }

        std::suspend_always final_suspend() noexcept { return {}; }

        std::suspend_always yield_value(T value) {
            _v = value;
            return {};
        }

        void return_void() {}

        void unhandled_exception() { std::terminate(); }
    };

    generator() = default;
    generator(generator const &) = delete;
    generator &operator=(generator const &) = delete;

    generator(generator &&other) noexcept : handle(other.handle) {
        other.handle = nullptr;
    }

    generator &operator=(generator &&other) noexcept {
        if(this != &other) {
            handle = other.handle;
            other.handle = nullptr;
        }

        return *this;
    }

    ~generator() {
        if(handle != nullptr) {
            handle.destroy();
        }
    }

    auto next() {
        handle.resume();
        return !handle.done();
    }

    T value() { return handle.promise()._v; }

  private:
    explicit generator(promise_type &p)
        : handle(std::coroutine_handle<promise_type>::from_promise(p)) {}

    std::coroutine_handle<promise_type> handle;
};


template<class T>
generator<T> iota(T end) {
    for(T i = 0; i < end; ++i) {
        co_yield i;
    }
}

signed main() {
    auto g = iota<int>(10);

    while(g.next()) std::println("{}", g.value());
}
