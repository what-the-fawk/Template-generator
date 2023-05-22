#pragma once

#include <condition_variable>
#include <mutex>
#include <atomic>
#include <vector>
#include <thread>
#include <queue>
#include <functional>

#include "safe_queue.h"

class thread_pool {
public:
    explicit thread_pool(size_t size);

    ~thread_pool() = default;

    thread_pool() = delete;
    thread_pool(thread_pool&&) = delete;

    thread_pool& operator=(thread_pool&) = delete;
    thread_pool& operator=(thread_pool&&) = delete;

public:
    void add_task(std::function<void()>& func);

protected:
    void thread_run();

protected:
    std::condition_variable condvar;
    std::mutex mtx;
    std::atomic<bool> time_to_die;
    std::vector<std::thread> threads;
    safe_queue<std::function<void()>> queue;
};


