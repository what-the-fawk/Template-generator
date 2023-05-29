#include "../include/latex_generator.h"

#include <fstream>
#include <iostream>
#include <exception>
#include <unordered_map>
#include <mutex>


static std::unordered_map<int, std::string> classes;
static std::unordered_map<int, std::string> fonts;
static std::unordered_map<std::string, std::string> formulas;
static std::mutex mtx;

void init() {

    classes.insert({DocumentClass::ARTICLE, "article"});
    classes.insert({DocumentClass::BOOK, "book"});
    classes.insert({DocumentClass::REPORT, "report"});
    classes.insert({DocumentClass::LETTER, "letter"});
    classes.insert({DocumentClass::SLIDES, "slides"});
    //...

    fonts.insert({Document::LMR, "lmodern"});
    fonts.insert({Document::LMDH, "lmodern"});
    fonts.insert({Document::QTM, "tgtermes"});
    fonts.insert({Document::QPL, "tgpagella"});
    fonts.insert({Document::QBK, "tgbonum"});
    fonts.insert({Document::QCS, "tgschola"});
    fonts.insert({Document::PTM, "mathptmx"});
    //...

    formulas.insert({"sin", "\\sin"});
    formulas.insert({"cos", "\\cos"});
    formulas.insert({"sinh", "\\sinh"});
    formulas.insert({"cosh", "\\cosh"});
    formulas.insert({"arcsin", "\\arcsin"});
    formulas.insert({"arccos", "\\arccos"});
    formulas.insert({"tan", "\\tan"});
    //...

}

void add_formula(std::string& f, std::string& tex_f) {
    formulas.insert({f, tex_f});
}

void add_font(std::string& font) {
    mtx.lock();
    int k = 0;

    while(fonts.find(k) != fonts.end()) {}

    fonts.insert({k, font});
    mtx.unlock();
}

void remove_font(int k) {
    mtx.lock();
    if(fonts.find(k) != fonts.end()) {
        fonts.erase(k);
    }
    mtx.unlock();
}

void add_packages(std::ostream& fstr, Document& doc) {

    auto font = fonts.find(doc.font);

    if(font != fonts.end()) {
        doc.packlist.packages.push_back(font->second);
    }

    fstr << '\n';
    for(auto& pack : doc.packlist.packages) {
        fstr << "\\usepackage{" << pack << "}\n";
    }

    fstr << '\n';
}


void add_class(std::ostream& fstr, DocumentClass& doc_class) {    
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

    std::string buf;

    bool is_math = false;
    size_t bracket_count = 0;

    for(auto& section: sections) {
        fstr << "\\section{" << section.name << "}\n";

        for(size_t i = 0; i < section.contents.size(); ++i) {
            if(section.contents[i] == '\n') {
                fstr << " \\\\";
                continue;
            }

            if(section.contents[i] == ')') {
                if(is_math) {
                    --bracket_count;
                    fstr << section.contents[i];
                    if(!bracket_count) {
                        fstr << "\\)";
                        is_math = false;
                    }
                    continue;
                }
            }

            if(section.contents[i] == '(') {
                if(is_math) {
                    ++bracket_count;
                }
            }

            if(section.contents[i] == '%') {
                ++i;
                if(section.contents[i] != '%') {
                    fstr << "\\%";
                    continue;
                }
                ++i;

                if(!is_math) {
                    is_math = true;
                    fstr << "\\(";
                }

                while(section.contents[i] != '(') {
                    buf.push_back(section.contents[i]);
                    ++i;
                }

                ++bracket_count;

                auto f = formulas.find(buf);
                if(f != formulas.end()) {
                    fstr << f->second;
                }
                buf.clear();
            }

            fstr << section.contents[i];
        }
        fstr << '\n';
    }

}

void GenerateLatex(Document&& doc, const char* filepath) {

    std::ofstream fstr((!filepath) ? "example.tex" : filepath);
    
    if(!fstr.is_open()) {
        return;
    }

    add_class(fstr, doc.doc_class);
    add_packages(fstr, doc);
    fstr << "\\title{" << doc.title << "}\n";
    add_authors(fstr, doc.author);
    fstr << "\\begin{document}\n";
    fstr << "\\maketitle\n";
    add_sections(fstr, doc.sections);

    fstr << "\\end{document}\n";

    fstr.flush();
    fstr.close(); ///////////
}