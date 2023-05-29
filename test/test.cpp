#include <iostream>
#include <string>
#include <atomic>
#include <cassert>
#include <unistd.h>
#include <future>
#include <sys/time.h>
#include <chrono>

#include "../generator/include/latex_generator.h"
#include "../generator/include/thread_pool.h"

#define THREAD_NUM 30
#define ITERS 100

void test_queue() {
    safe_queue<size_t> q;

    for(size_t i = 0; i < ITERS; ++i) {
        q.push(std::move(i));
    }

    for(size_t i = 0; i < ITERS; ++i) {
        auto v = q.pop();
        assert(v.value() == i);
    }
    std::cout << __FUNCTION__ << std::endl;
}

void test_queue_threads() {

    safe_queue<size_t> q;

    auto f = [&]() {
        for(size_t i = 0; i < ITERS; ++i) {
            q.push(std::move(i));
        }
    };

    std::vector<std::thread> threads;
    threads.reserve(THREAD_NUM);

    for(size_t i = 0; i < THREAD_NUM; ++i) {
        threads.emplace_back(f);
    }

    for(size_t i = 0; i < THREAD_NUM; ++i) {
        threads[i].join();
    }

    assert(q.size() == THREAD_NUM * ITERS);

    std::cout << __FUNCTION__ << std::endl;
}

void test_thread_pool() {

    safe_queue<size_t> q;

    auto f = [&]() {
        for(size_t i = 0; i < ITERS; ++i) {
            q.push(std::move(i));
        }
    };

    {
        thread_pool pool(4);
        pool.add_task(f);
        pool.add_task(f);
        pool.add_task(f);
    }

    assert(q.size() == 3 * ITERS);

    std::cout << __FUNCTION__ << std::endl;
}

void test_thread_pool_stress() {

    std::atomic<size_t> n = 0;

    auto f = [&]() {
        for(size_t i = 0; i < ITERS; ++i) {
            n.fetch_add(1);
        }
    };

    {   
        thread_pool pool(THREAD_NUM);

        for(size_t i = 0; i < ITERS; ++i) {
            pool.add_task(f);
        }
    }

    assert(n == ITERS * ITERS);

    std::cout << __FUNCTION__ << std::endl;
}

void test_thread_pool_compare() {

    size_t num = 1;

    auto f = [&]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(10));
    };

    auto time = std::chrono::high_resolution_clock::now();

    {   
        thread_pool pool(num);

        time = std::chrono::high_resolution_clock::now();

        for(size_t i = 0; i < ITERS; ++i) {
            pool.add_task(f);
        }
    }

    auto duration = duration_cast<std::chrono::microseconds>(std::chrono::high_resolution_clock::now() - time);

    std::cout << "1 thread: " << std::to_string(duration.count()) << " ms" << std::endl;

    num = 6;

    {   
        thread_pool pool(num);

        time = std::chrono::high_resolution_clock::now();

        for(size_t i = 0; i < ITERS; ++i) {
            pool.add_task(f);
        }
    }

    auto duration_prev = duration;

    duration = duration_cast<std::chrono::microseconds>(std::chrono::high_resolution_clock::now() - time);

    std::cout << num << " threads: " << std::to_string(duration.count()) << " ms" << std::endl;

    std::cout << "Speed coeff: " << double(duration_prev.count()) / double(duration.count()) << std::endl; 

    std::cout << __FUNCTION__ << std::endl;

}

int main(int argc, char* argv[]) {
    // init();

    test_queue();
    test_queue_threads();
    test_thread_pool();
    test_thread_pool_stress();
    test_thread_pool_compare();

    return 0;
}


