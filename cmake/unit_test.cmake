# create the unit test executables

set(CATCH_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/extern/catch2)

# make test executables
set(MISC_SOURCE_TESTS_DIR ${CMAKE_SOURCE_DIR}/tests/misc )
add_executable(Test_Factorial "")
target_include_directories(Test_Factorial
  PUBLIC
    ${CATCH_INCLUDE_DIR}
    ${MISC_INCLUDE_DIR}
)
target_sources(Test_Factorial
  PUBLIC
    ${MISC_SOURCE_TESTS_DIR}/test_factorial.cpp
    ${MISC_SOURCE_FILES}
  PRIVATE
    ${CATCH_INCLUDE_DIR}/catch.hpp
)
set_target_properties(Test_Factorial
  PROPERTIES
    CXX_STANDARD 14
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
)

# List test sources for clang-tool
file(GLOB_RECURSE TEST_SOURCE_FILES ${CMAKE_SOURCE_DIR}/tests/*.cpp)

# CMake tests support
enable_testing()
add_test(NAME TestFactorial COMMAND Test_Factorial)
