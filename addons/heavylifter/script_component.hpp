#define COMPONENT heavylifter
#define COMPONENT_BEAUTIFIED Heavy Lifter
#include "\x\tac\addons\main\script_mod.hpp"

#define DRAW_ATTACHPOS_INFO
#define ALLOW_QUICK_PREP
// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_HEAVYLIFTER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_HEAVYLIFTER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_HEAVYLIFTER
#endif

#include "\x\tac\addons\main\script_macros.hpp"

#ifdef ALLOW_QUICK_PREP
    #define HEAVYLIFTER_PREP_TIME 0
#else
    #define HEAVYLIFTER_PREP_TIME 30
#endif
