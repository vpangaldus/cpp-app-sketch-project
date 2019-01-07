#define CATCH_CONFIG_MAIN

#include "catch.hpp"
#include "factorial.h"

TEST_CASE("Factorials are computed", "[factorial]")
{
  REQUIRE(Misc::Factorial(1) == 1);
  REQUIRE(Misc::Factorial(2) == 2);
  REQUIRE(Misc::Factorial(3) == 6);
  REQUIRE(Misc::Factorial(10) == 3628800);
}
