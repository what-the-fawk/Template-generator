#pragma once

#include <stdint.h>
#include <string>
#include <vector>
#include <exception>

using std::string;

struct DocumentClass {
    enum { ARTICLE = 0, BOOK, REPORT, LETTER, SLIDES };

    int32_t doccl;
    std::vector<std::string> options;    
};

struct PackageList {
    std::vector<std::string> packages;
};


struct Section {
    std::string name;
    std::string contents;
};


// \n -> //

struct Document {
    std::string title = "Lorem ipsum";
    std::vector<std::string> author = {"Some random Guy"};
    std::string title_contents = "Some title";
    std::vector<Section> sections = {{"Basic section", "Lorem ipsum dolor sit amet, " 
    "consectetur adipiscing elit, sed do eiusmod tempor incididunt "
    "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis "
    "nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo " 
    "consequat. Duis aute irure dolor in reprehenderit in voluptate velit " 
    "esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat "
    "cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n"}, 
    {"Some math stuff", "%%sin(%%cos(%%tan(48)))"}}; // <name, contents>

    DocumentClass doc_class = {DocumentClass::ARTICLE, {}};
    PackageList packlist = {};

    enum {CMR = 0, LMR, LMDH, QTM, QPL, QBK, QCS, PTM, PUT, PPL, PBK, BCH, LMSS, QAG, QHV, PHV};

    int32_t font = CMR;
};


void GenerateLatex(Document&& doc, const char* filepath = nullptr);
void init();

void add_formula(std::string& f, std::string& tex_f);
void add_font(std::string& font);
void remove_font(int k);

