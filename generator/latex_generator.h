#pragma once

#include <stdint.h>
#include <string>
#include <vector>
#include <exception>

using std::string;

enum class DocumentClass { ARTICLE, REPORT };

struct Background {
    int16_t position;
    int16_t angle;
    int16_t nodeanchor;
    int16_t vshift;
    int16_t opacity;
    int16_t scale;
};

enum class ItemTypes { FIGURE };



struct Item {
    std::string name;
    std::vector<std::string> attributes; // /centering, etc

    std::string caption;

};

struct Section {
    std::string name;
    std::string contents;
    std::vector<Item> items;
};

// TODO: exception handlers
// TODO: attachments
// TODO: Items in sections
// TODO: Use background class

struct Document {
    int16_t para_distance; // not in use

    std::string title = "Lorem ipsum";
    std::vector<std::string> author = {"Dasha"}; // +1
    std::string title_contents = "";
    ///
    std::vector<FILE*> attachments = {}; // <---
    ///

    // ...

    std::vector<Section> sections = {{"Section 1", "Lorem ipsum dolor sit amet, " 
    "consectetur adipiscing elit, sed do eiusmod tempor incididunt "
    "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis "
    "nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo " 
    "consequat. Duis aute irure dolor in reprehenderit in voluptate velit " 
    "esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat "
    "cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", {}}}; // <name, contents>
    DocumentClass doc_class = DocumentClass::ARTICLE;

    Background background;
};


void GenerateLatex(Document& doc, const char* filepath = nullptr);
