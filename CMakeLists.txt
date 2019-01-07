cmake_minimum_required(VERSION 3.6...3.13)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
  message("CMake version less than 3.12")
  cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

# Project stuffs
project(cpp-clang-draft-project VERSION 0.0
                                DESCRIPTION "A sketch for cpp project"
                                LANGUAGES CXX
)

# Internal libraries
set(MISC_INCLUDE_DIR include/misc)
set(MISC_HEADER_FILES include/misc/factorial.h)
set(MISC_SOURCE_FILES src/misc/factorial.cpp)

# Create app exe
add_executable(DemoApp "")
set_target_properties(DemoApp
  PROPERTIES
    CXX_STANDARD 14
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
)
target_sources(DemoApp
  PUBLIC
    app/main.cpp
    ${MISC_SOURCE_FILES}
)
target_include_directories(DemoApp
  PUBLIC
    ${MISC_INCLUDE_DIR}
)

# External libraries
# Use find_library() and target_link_library() when possible

# List all sources and header files for the clang-tools (exclude 3rd party library)
file(GLOB_RECURSE PROJECT_HEADER_FILES ${CMAKE_SOURCE_DIR}/include/*.h)
file(GLOB_RECURSE PROJECT_SOURCE_FILES ${CMAKE_SOURCE_DIR}/src/*.cpp)
file(GLOB_RECURSE APP_HEADER_FILES ${CMAKE_SOURCE_DIR}/app/*.h)
file(GLOB_RECURSE APP_SOURCE_FILES ${CMAKE_SOURCE_DIR}/app/*.cpp)

# Include cmake 'helper' modules
include(${CMAKE_SOURCE_DIR}/cmake/unit_test.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/clang_tools.cmake)
