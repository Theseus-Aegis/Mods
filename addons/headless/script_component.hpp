#define COMPONENT headless
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_HEADLESS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_HEADLESS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_HEADLESS
#endif

#include "\x\tac\addons\main\script_macros.hpp"


#define DELAY_DEFAULT 15
