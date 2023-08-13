#define COMPONENT flags
#define COMPONENT_BEAUTIFIED Flags
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_FLAGS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FLAGS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FLAGS
#endif

#include "\x\tac\addons\main\script_macros.hpp"
