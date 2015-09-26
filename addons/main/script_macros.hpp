//#include "\x\cba\addons\main\script_macros_common.hpp" // Included in ACE3's "script_macros.hpp"
//#include "\x\cba\addons\xeh\script_xeh.hpp" // Included in ACE3's "script_macros.hpp"
#include "\z\ace\addons\main\script_macros.hpp"
//#include "script_debug.hpp" // ACE3 debugging framework // Included in ACE3's "script_macros.hpp"

// Log project name
#define ACE_LOGFORMAT(module,level,message) FORMAT_2(QUOTE([TAC] (module) %1: %2),level,message)
