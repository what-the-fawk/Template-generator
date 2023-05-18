#include <iostream>
#include <string>

#include "generator/latex_generator.h"

int main(int argc, char* argv[]) {
    init();

    
    Document doc;
    const char* filename = "example.tex"; 

    // example latex
    GenerateLatex(doc, filename);

    // signal handler


    return 0;      
}


