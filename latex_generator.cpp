#include "latex_generator.h"

#include <fstream>
#include <iostream>


void add_section(std::ofstream& fstr, std::string& title_name, std::string& contents) {
    if(!fstr.is_open()) {
        throw std::runtime_error{"CLosed file"};
    }

    fstr << "\\begin{" << title_name << "}\n" << contents;
    fstr << "\\end{" << title_name << "}\n";


}



string Generate_Latex(ParameterPack& params, const char* filepath = nullptr) {

    std::ofstream fstr((!filepath) ? "New Document" : filepath);

    if(!fstr.is_open()) {
        throw std::runtime_error{"Could not open a file"};
    }

    fstr << "\\usepackage[utf8]{inputenc}\n\n\n";

    fstr << "\\documentclass{article}\n";
    fstr << "\\title{" << params.title << "}\n";
    fstr << "\\author{" << params.author << "}\n"; // possibly make 2+ authors
    fstr << "\\begin{document}\n";
    fstr << "\\maketitle\n\n" << params.title_contents << "\n";

    
    size_t i = 0;
    while(i < params.sections.size()) {
        add_section(fstr, params.sections[i].first, params.sections[i].second);
        ++i;
    }


    fstr << "\\end{document}\n";

/*
    file << "\\documentclass{article}\n";
    file << "\\title{My LaTeX Document}\n";
    file << "\\author{Your Name Here}\n";
    file << "\\begin{document}\n";
    file << "\\maketitle\n";
    file << "\\end{document}\n";
*/

}

