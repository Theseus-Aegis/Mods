#define COMPONENT melb_tweaks
#define COMPONENT_BEAUTIFIED MELB Tweaks
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MELB_TWEAKS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MELB_TWEAKS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MELB_TWEAKS
#endif

#include "\x\tac\addons\main\script_macros.hpp"

#define ZOOM_DEFAULT 0.8
#define ZOOM_PREOPEN 28 // value read before camera is first used
