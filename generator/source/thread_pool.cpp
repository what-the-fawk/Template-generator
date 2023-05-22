#include "thread_pool.h"

explicit thread_pool::thread_pool(size_t size) : time_to_die(0)  {
        if(!size) {
            throw std::runtime_error{"Zero thread pool size"};
        }

        threads.reserve(size);

        for(size_t i = 0; i < size; ++i) {
            threads.emplace_back(thread_pool::thread_run, this); // 
        }
}

// condvar by default
// lock-free - ?
void thread_pool::thread_run() {
    while(!time_to_die.load()) {
        std::unique_lock<std::mutex> lock{mtx};

        condvar.wait(lock, [this]() -> bool { return !queue.empty(); });

        if(queue.empty()) {
            continue;
        }

        auto function = queue.pop();

        lock.unlock();
        function();
    }
}

void thread_pool::add_task(std::function<void()>& func) {
    queue.emplace(std::move(func));
    condvar.notify_one();
}



