cmake_minimum_required(VERSION 3.18)
project(clang-tools-conf LANGUAGES NONE)

# Expose cmake modules to the consumer via FetchContent
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Make the path available to the parent scope when used with FetchContent
set(CLANG_TOOLS_CONF_CMAKE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cmake" CACHE PATH "" FORCE)
set(CLANG_TOOLS_CONF_DIR       "${CMAKE_CURRENT_SOURCE_DIR}"       CACHE PATH "" FORCE)

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/ClangFormatCheck.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/ClangFormatFix.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/ClangTidy.cmake")

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/.clang-format"
    "${CMAKE_SOURCE_DIR}/.clang-format"
    COPYONLY
)
