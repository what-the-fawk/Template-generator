#pragma once

#include <stdint.h>
#include <string>
#include <vector>
#include <exception>

using std::string;

enum class DocumentType { ARTICLE };

struct Background {
    int16_t position;
    int16_t angle;
    int16_t nodeanchor;
    int16_t vshift;
    int16_t opacity;
    int16_t scale;
};


struct ParameterPack {
    int16_t indent;
    int16_t para_distance;

    std::string title;
    std::string author;

    std::string title_contents;

    // ...

    std::vector<std::pair<std::string, std::string>> sections;
    DocumentType type = DocumentType::ARTICLE;

    Background background;

    
};



string GenerateLatex(ParameterPack& params, const char* filedir = nullptr);