#pragma once

#include <atomic>
#include <queue>


template <typename T>
class safe_queue {
public:

    template<typename ...Args>
    safe_queue(Args&&... args) : queue(std::forward<Args>(args), ...), flag(0) {}


public:
    void push(T&& x) {
        while(!flag.compare_exchange_strong(0, 1)) {}
        queue.push(std::forward(x));
        flag.store(0);
    }

    T pop() {
        while(!flag.compare_exchange_strong(0, 1)) {}
        T ret_value = queue.front();
        queue.pop();
        flag.store(0);
        return ret_value;
    }

    void emplace(T&& x) {
        while(!flag.compare_exchange_strong(0, 1)) {}
        queue.emplace(std::forward(x));
        flag.store(0);
    }

    bool empty() {
        return queue.empty();
    }


protected:
    std::atomic<bool> flag;
    std::queue<T> queue;
};

