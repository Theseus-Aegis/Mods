//#include "\x\cba\addons\main\script_macros_common.hpp" // Included in ACE3's "script_macros.hpp"
//#include "\x\cba\addons\xeh\script_xeh.hpp" // Included in ACE3's "script_macros.hpp"
#include "\z\ace\addons\main\script_macros.hpp"
//#include "script_debug.hpp" // ACE3 debugging framework // Included in ACE3's "script_macros.hpp"

// Custom
#define LSTRING(var1) QUOTE(TRIPLES(STR,ADDON,var1)) //PRed to ACE3
#define CSTRING(var1) QUOTE(TRIPLES($STR,ADDON,var1)) //PRed to ACE3

// ACE3 references
#define ACE_FUNC(var1,var2) TRIPLES(DOUBLES(ace,var1),fnc,var2)
