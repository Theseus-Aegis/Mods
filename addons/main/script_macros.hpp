//#include "\x\cba\addons\main\script_macros_common.hpp" // Included in ACE3's "script_macros.hpp"
//#include "\x\cba\addons\xeh\script_xeh.hpp" // Included in ACE3's "script_macros.hpp"
#include "\z\ace\addons\main\script_macros.hpp"
//#include "script_debug.hpp" // ACE3 debugging framework // Included in ACE3's "script_macros.hpp"


// ACE3 reference macros
#define ACE_PREFIX ace

#define ACELSTRING(var1,var2) QUOTE(TRIPLES(STR,DOUBLES(ACE_PREFIX,var1),var2))
#define ACECSTRING(var1,var2) QUOTE(TRIPLES($STR,DOUBLES(ACE_PREFIX,var1),var2))
