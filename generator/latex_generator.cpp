#include "latex_generator.h"

#include <fstream>
#include <iostream>

static inline void add_class(std::ostream& fstr, DocumentClass doc_class) {

    static auto lambda = [] (DocumentClass doc_class) -> std::string {
      switch(doc_class) {

        case DocumentClass::ARTICLE:
            return "article";
            break; // <--- unreachable anyway
        
        case DocumentClass::REPORT:
            return "report";
            break;

        default:
            throw 1;
            break;
      }
    };

    fstr << "\\documentclass{" << lambda(doc_class) << "}\n";
}

static inline void add_authors(std::ostream& fstr, std::vector<std::string>& authors) {

    for(auto& el : authors) {
        fstr << "\\author{" << el << "}\n";
    }

}

static inline void add_sections(std::ostream& fstr, std::vector<Section> sections) {

    for(auto& section: sections) {
        fstr << "\\section{" << section.name << "}\n" << section.contents << "\n";
    }

}


// return value - FILE*
void GenerateLatex(Document& doc, const char* filepath) {

    std::ofstream fstr((!filepath) ? "New Document" : filepath);
    
    if(!fstr.is_open()) {
        throw std::runtime_error{"Could not open a file"}; // bad
    }

    add_class(fstr, doc.doc_class);
    fstr << "\\title{" << doc.title << "}\n";
    add_authors(fstr, doc.author);
    fstr << "\\begin{document}\n";
    fstr << "\\maketitle\n";
    add_sections(fstr, doc.sections);

    fstr << "\\end{document}\n";
}

