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
            threads.emplace_back(&thread_pool::thread_run, this);
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
    thread_pool(thread_pool&) = delete;
    thread_pool(thread_pool&&) = delete;

    thread_pool& operator=(thread_pool&) = delete;
    thread_pool& operator=(thread_pool&&) = delete;
    thread_pool& operator=(thread_pool) = delete;

public:
    void add_task(std::function<T> func) {

        if(time_to_die.load()) {
            return;
        }
        
        queue.emplace(std::move(func));
        condvar.notify_one();
    }

protected:
    void thread_run() {

        std::optional<std::function<T>> function = std::nullopt;

        while(1) {
            std::unique_lock<std::mutex> lock{mtx};

            while((function = queue.pop()) == std::nullopt && !time_to_die.load()) {
                condvar.wait(lock);
            }

            if(time_to_die.load() && function == std::nullopt) {
                return;
            }
            
            
            function.value()();
            function = std::nullopt;
        }
    }

protected:
    std::condition_variable condvar;
    std::mutex mtx;
    std::atomic<bool> time_to_die = false;
    std::vector<std::thread> threads;
    safe_queue<std::function<T>> queue;
};
