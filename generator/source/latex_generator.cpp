#include "latex_generator.h"

#include <fstream>
#include <iostream>
#include <exception>
#include <unordered_map>

struct Data {

};

static std::unordered_map<int, const char*> classes;
static std::unordered_map<std::string, std::vector<Data*>> clients;


void init() {

    classes.insert({DocumentClass::ARTICLE, "article"});
    classes.insert({DocumentClass::BOOK, "book"});
    classes.insert({DocumentClass::REPORT, "report"});
    classes.insert({DocumentClass::LETTER, "letter"});
    classes.insert({DocumentClass::SLIDES, "slides"});

}


void add_class(std::ostream& fstr, DocumentClass doc_class) {    
    fstr << "\\documentclass";

    if(doc_class.options.size()) {
        fstr << '[';
        fstr << doc_class.options[0];
        for(size_t i = 1; i < doc_class.options.size(); ++i) {
            fstr << ", " << doc_class.options[i];
        }
        fstr << ']';
    }

    auto doccl = classes.find(doc_class.doccl);

    if(doccl != classes.end()) {
        fstr << '{' << doccl->second << "}\n";
    }

}

void add_authors(std::ostream& fstr, std::vector<std::string>& authors) {

    for(auto& el : authors) {
        fstr << "\\author{" << el << "}\n";
    }

}

void add_sections(std::ostream& fstr, std::vector<Section> sections) {

    for(auto& section: sections) {
        fstr << "\\section{" << section.name << "}\n";
        fstr << section.contents;
        fstr << '\n';
    }

}

void GenerateLatex(Document&& doc, const char* filepath) {

    std::ofstream fstr((!filepath) ? "New Document" : filepath);
    
    // if(!fstr.is_open()) {
    //     throw std::runtime_error{"Could not open a file"};
    // }

    add_class(fstr, doc.doc_class);

    fstr << "\\title{" << doc.title << "}\n";
    add_authors(fstr, doc.author);
    fstr << "\\begin{document}\n";
    fstr << "\\maketitle\n";
    add_sections(fstr, doc.sections);

    fstr << "\\end{document}\n";
}

void add_data(std::string& usr, Data data) {
    auto it = clients.find(usr);
    if(it != clients.end()) {
        it->second.push_back(new Data(data));
    }
}
