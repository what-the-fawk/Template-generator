#pragma once

#include <atomic>
#include <queue>


template <typename T>
class safe_queue {
public:

    template<typename ...Args>
    safe_queue(Args&&... args) : queue(std::forward<Args>(args), ...), flag(ATOMIC_FLAG_INIT) {}


    void push(T&& x) {
        while(std::atomic_flag_test_and_set_explicit(&flag, std::memory_order::memory_order_acquire));

        queue.push(std::forward(x));

        std::atomic_flag_clear(&flag);
    }

    T pop() {
        // compare_exchange
        while(flag.load());

        T ret_value = queue.front();
        queue.pop();

        std::atomic_flag_clear(&flag);

        return ret_value;
    }

    void emplace(T&& x) {
        // while(std::atomic_flag_test_and_set_explicit(&flag, std::memory_order::memory_order_acquire));
        while(!flag.exchange(true));

        queue.emplace(std::forward(x));

        std::atomic_flag_clear(&flag);
    }

    // unsafe
    bool empty() {
        return queue.empty(); // data race
    }


protected:
    std::atomic<bool> flag;
    std::queue<T> queue;
};

