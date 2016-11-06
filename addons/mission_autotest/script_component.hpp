#define COMPONENT mission_autotest
#define COMPONENT_BEAUTIFIED Mission Autotest
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MISSION_AUTOTEST
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MISSION_AUTOTEST
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSION_AUTOTEST
#endif

#include "\x\tac\addons\main\script_macros.hpp"


#define __ERROR -1
#define __WARNING 0
#define __PASS 1

#define COLUMN_SIZE 0, 0.05
