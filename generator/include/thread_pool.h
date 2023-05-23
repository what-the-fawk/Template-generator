#pragma once

#include <condition_variable>
#include <mutex>
#include <atomic>
#include <vector>
#include <thread>
#include <queue>
#include <functional>

#include "safe_queue.h"

template <typename T>
class thread_pool {
public:
    explicit thread_pool(size_t size) {

        if(!size) {
            throw std::runtime_error{"Zero thread pool size"};
        }

        threads.reserve(size);

        for(size_t i = 0; i < size; ++i) {
            threads.emplace_back(thread_pool::thread_run, this);
        }
    }

    ~thread_pool() {
        time_to_die.store(1);
        condvar.notify_all();

        for(auto&& thread : threads) {
            thread.join();
        }
    }

    thread_pool() = delete;
    thread_pool(thread_pool) = delete;
    thread_pool(thread_pool&) = delete;
    thread_pool(thread_pool&&) = delete;

    thread_pool& operator=(thread_pool&) = delete;
    thread_pool& operator=(thread_pool&&) = delete;
    thread_pool& operator=(thread_pool) = delete;

public:
    void add_task(std::function<T>& func) {
        queue.emplace(std::move(func));
        condvar.notify_one();
    }

protected:
    void thread_run() {
        
        while(!time_to_die.load()) {
            std::unique_lock<std::mutex> lock{mtx};

            condvar.wait(lock, [this]() -> bool { return !queue.empty(); });

            if(queue.empty() || time_to_die.load()) {
                continue;
            }

            auto function = queue.pop();

            lock.unlock();
            function();
        }
    }

protected:
    std::condition_variable condvar;
    std::mutex mtx;
    std::atomic<bool> time_to_die;
    std::vector<std::thread> threads;
    safe_queue<std::function<T>> queue;
};


