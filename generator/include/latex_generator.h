#pragma once

#include <stdint.h>
#include <string>
#include <vector>
#include <exception>

using std::string;

struct DocumentClass {
    enum { ARTICLE = 1024, BOOK, REPORT, LETTER, SLIDES };

    int32_t doccl;
    std::vector<std::string> options;    
};

struct Background {
    int16_t position;
    int16_t angle;
    int16_t nodeanchor;
    int16_t vshift;
    int16_t opacity;
    int16_t scale;
};

enum class ItemTypes { FIGURE };

// struct DocumentStyle {

// };

struct PackageList {
    std::vector<std::string> packages;
};


struct Item {
    std::string name;
    std::vector<std::string> attributes; // /centering, etc

    std::string caption;

};

struct ItemList {
    std::vector<Item> items;

    // throws
    Item& next() {
        return items.at(position++);
    }

private:
    size_t position = 0;
};

struct Section {
    std::string name;
    std::string contents;
    ItemList list;
};

std::ostream& operator<<(std::ostream& os, ItemList& list) {
    auto item = list.next();

    // os << item.
    return os;
}

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
    "cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", {}}}; // <name, contents, items>
    DocumentClass doc_class = {DocumentClass::ARTICLE, {}};

    Background background;
};


void GenerateLatex(Document& doc, const char* filepath = nullptr);
void init();


std::ostream& operator<<(std::ostream& os, const char* ch) {
    while(*ch != '\0') {
        os << *ch++;
    }

    return os;
}