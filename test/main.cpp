#include <iostream>
#include <string>
#include <atomic>
#include <cassert>
#include <unistd.h>

#include "../generator/include/latex_generator.h"
#include "../generator/include/thread_pool.h"

std::atomic<int> cnt = 0;

void foo() {
    ++cnt;
}


#define THREAD_NUM 10
#define ITERS 1000

void add_number(safe_queue<int>& queue) {

    for(int i = 0; i < ITERS; ++i) {
        queue.push(1);
    }
}


int main(int argc, char* argv[]) {
    // init();

    size_t num_threads = 3;
    thread_pool<void()> pool = thread_pool<void()>(num_threads);


    size_t task_adds = 0;

    for(int i = 0; i < 1000; ++i) {
        ++task_adds;
        std::function<void()> func(foo);
        pool.add_task(func);
    }

    // std::cout << cnt << std::endl;

    std::cout << "tasks: " << task_adds << std::endl;

    // safe_queue<int> queue;

    // std::vector<std::thread> threads;
    // threads.reserve(THREAD_NUM);

    // for(int i = 0; i < THREAD_NUM; ++i) {
    //     threads.emplace_back(add_number, std::ref(queue));
    // }


    // for(auto&& thread : threads) {
    //     thread.join();
    // }

    // assert(queue.size() == ITERS * THREAD_NUM);

    

    // example latex
    // Document doc;
    // const char* filename = "example.tex"; 
    // GenerateLatex(doc, filename);

    // sleep(5);

    return 0;
}


