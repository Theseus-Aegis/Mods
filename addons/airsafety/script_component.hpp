#define COMPONENT airsafety
#define COMPONENT_BEAUTIFIED Air Safety
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_AIRSAFETY
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_AIRSAFETY
    #define DEBUG_SETTINGS DEBUG_SETTINGS_AIRSAFETY
#endif

#include "\x\tac\addons\main\script_macros.hpp"

// A ground vehicle slower than this (km/h) when its driver leaves is left as it is
#define MIN_SPEED_GROUND 5
