#pragma once

#include "targetver.h"
#include "constants.h"
#include "logging.hpp"

#ifdef _DEBUG
#define ZERO_OUTPUT() { memset(output, 0x00, outputSize); }
#define EXTENSION_RETURN() {output[outputSize-1] = 0x00; } return;
#else
#define ZERO_OUTPUT()
#define EXTENSION_RETURN() return;
#endif

#ifdef _WIN32
#define sleep(x) Sleep(x)
#else
#define _strdup strdup
#define strtok_s strtok_r
#endif

#ifndef _WIN32
#define __stdcall
#endif

#if defined(_MSC_VER)
    // MSVC
    #define EXPORT __declspec(dllexport)
    #define IMPORT __declspec(dllimport)
#elif defined(_GCC)
    // GCC
    #define EXPORT __attribute__((visibility("default")))
    #define IMPORT
#else
    // Uknown compiler
    #define EXPORT
    #define IMPORT
    #pragma warning Unknown dynamic link import/export semantics.
#endif
