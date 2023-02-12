#include <iostream>
#include <string>

#include "generator/latex_generator.h"

int main(int argc, char* argv[]) {

    
    Document doc;
    const char* filename = "example.tex"; 

    // example latex
    GenerateLatex(doc, filename);


    return 0;      
}


