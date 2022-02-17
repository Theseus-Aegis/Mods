#define COMPONENT apollo
#define COMPONENT_BEAUTIFIED Apollo
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_APOLLO
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_APOLLO
    #define DEBUG_SETTINGS DEBUG_SETTINGS_APOLLO
#endif

#include "\x\tac\addons\main\script_macros.hpp"

#define REQUIRED_JNI_VERSION "1.0.0"
#define REQUIRED_APOLLOCLIENT_VERSION "1.24.0.56"

#define SAVE_DELAY_PERIODIC 30
#define SAVE_DELAY_INV_CHANGE 10
