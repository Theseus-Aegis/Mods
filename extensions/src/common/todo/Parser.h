#pragma once

#include "shared.hpp"

#include <string>


class Parser {
private:
    void ClearQueue(std::queue<std::string> &q);
    void DebugOut(std::string type, std::string message, std::string completedIn = "");
    void TCPRequest(std::string playerId);
    void Execute(char*, int, const char*);
public:
    Parser(char*, int, const char*);
};
