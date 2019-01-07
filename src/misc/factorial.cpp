#include "factorial.h"

namespace Misc
{

unsigned int Factorial(unsigned int number)
{
  return number <= 1 ? 1 : number * Factorial(number - 1);
}

} // namespace Misc
