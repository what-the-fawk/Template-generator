#pragma once

#include <atomic>
#include <queue>


template <typename T>
class safe_queue {
public:

    template<typename ...Args>
    safe_queue(Args&&... args) : queue(std::forward<Args>(args)...), flag(false) {}

    ~safe_queue() {
        std::cout << "calls: " << calls << std::endl;
    }

public:
    void push(T&& x) {
        static thread_local bool expected = false;

        while(!flag.compare_exchange_strong(expected, true, std::memory_order_acquire)) {
            expected = false;
        }
        
        queue.push(std::forward<T>(x));
        flag.store(false, std::memory_order_release);
    }

    std::optional<T> pop() {
        static thread_local bool expected = false;

        while(!flag.compare_exchange_strong(expected, true, std::memory_order_acquire)) {
            expected = false;
        }

        if(queue.empty()) {
            flag.store(false, std::memory_order_release);
            return std::nullopt;
        }

        ++calls;

        auto ret_value = std::make_optional(std::move(queue.front()));
        queue.pop();
        flag.store(false, std::memory_order_release);

        return ret_value;
    }

    void emplace(T&& x) {
        static thread_local bool expected = false;

        while(!flag.compare_exchange_strong(expected, true, std::memory_order_acquire)) {
            expected = false;
        }

        queue.emplace(std::forward<T>(x));
        flag.store(false, std::memory_order_release);
    }

    size_t size() {
        return queue.size();
    }


protected:
    std::atomic<bool> flag;
    std::queue<T> queue;


    size_t calls = 0;
};
