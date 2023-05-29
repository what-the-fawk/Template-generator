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

int main() {
    init();
    Document doc;

    doc.font = Document::QBK;
    doc.doc_class.options.push_back("12pt");
    doc.packlist.packages.push_back("lipsum");
    GenerateLatex(std::move(doc), "example.tex");
}