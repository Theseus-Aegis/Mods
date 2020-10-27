cmake_minimum_required(VERSION 3.0)
project(TAC)
cmake_policy(SET CMP0074 NEW) # BOOST_ROOT use

if(WIN32)
    add_definitions(/DWINVER=0x0600 /D_WIN32_WINNT=0x0600)
endif()

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/CMakeModules)
include(${CMAKE_MODULE_PATH}/cxx_compiler_functions.cmake)

option(USE_64BIT_BUILD "USE_64BIT_BUILD" OFF)
option(USE_STATIC_LINKING "USE_STATIC_LINKING" ON)

set(CMAKE_BUILD_TYPE "RelWithDebInfo")

set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_STATIC_RUNTIME ON)
find_package(Boost COMPONENTS system date_time regex)
if(Boost_FOUND)
    include_directories(${Boost_INCLUDE_DIRS})
else()
    message(FATAL_ERROR "Boost NOT FOUND")
endif()

if(USE_STATIC_LINKING)
    message("INFO: Linking statically")
    set(TAC_LINK_TYPE "static")
else()
    message("INFO: Linking dynamically")
    set(TAC_LINK_TYPE "dynamic")
endif()

if(CMAKE_GENERATOR_PLATFORM MATCHES "x64")
    set(USE_64BIT_BUILD ON)
endif()

message("GENERATOR USED: ${CMAKE_GENERATOR}")

set(CMAKE_CL_64 ${USE_64BIT_BUILD})

if(USE_64BIT_BUILD)
    message("INFO: Building 64-bit projects")
    set(TAC_ARCH "x64")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/build/win64/")
else()
    message("INFO: Building 32-bit projects")
    set(TAC_ARCH "x86")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/build/win32/")
    string(REPLACE "/lib64" "/lib32" Boost_LIBRARIES "${Boost_LIBRARIES}")
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Windows file details
if(MSVC)
    string(TIMESTAMP TAC_BUILDSTAMP "%Y-%m-%dT%H:%M:%SZ")
    configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/src/common/tac_version_win32.rc.in"
        "${CMAKE_CURRENT_BINARY_DIR}/src/common/tac_version_win32.rc"
      @ONLY)
    set(GLOBAL_RC ${CMAKE_CURRENT_BINARY_DIR}/src/common/tac_version_win32.rc)
    set(GLOBAL_SOURCES ${GLOBAL_RC})
endif()

include_directories(src/common)

add_subdirectory(src/common)
add_subdirectory(src/apollo_client)
