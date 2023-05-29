#pragma once

#include <condition_variable>
#include <mutex>
#include <atomic>
#include <vector>
#include <thread>
#include <queue>
#include <functional>
#include <future>

#include "safe_queue.h"

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

    template <typename Function, typename ...Args>
    void add_task(const Function& task_func, Args&&... args) {

        if(time_to_die.load()) {
            return;
        }

        queue.emplace(std::async(std::launch::deferred, task_func, args...));
        condvar.notify_one();
    }

protected:
    void thread_run() {

        std::optional<std::future<void>> function = std::nullopt;

        while(1) {
            std::unique_lock<std::mutex> lock{mtx};

            while((function = queue.pop()) == std::nullopt && !time_to_die.load()) {
                condvar.wait(lock);
            }
            lock.unlock();
            

            if(time_to_die.load() && !function.has_value()) {
                return;
            }
            


            function.value().get();

            function = std::nullopt;
        }
    }

    

protected:
    std::condition_variable condvar;
    std::mutex mtx;
    std::atomic<bool> time_to_die = false;
    std::vector<std::thread> threads;
    safe_queue<std::future<void>> queue;
};