#include <iostream>
#include <string>

#include "include/latex_generator.h"

int main(int argc, char* argv[]) {
    init();

    // example latex
    Document doc;
    const char* filename = "example.tex"; 
    GenerateLatex(doc, filename);

    // signal handler


    // thread_safe queue
    // queue not safe

    return 0;      
}

