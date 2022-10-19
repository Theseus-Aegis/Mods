#define COMPONENT mission
#include "\x\tac\addons\main\script_mod.hpp"

#define DEBUG_SYNCHRONOUS

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_MISSION
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_MISSION
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSION
#endif

#include "\x\tac\addons\main\script_macros.hpp"
#include "script_macros_mission.hpp"
