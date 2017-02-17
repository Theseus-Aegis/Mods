#define COMPONENT tban_armed
#define COMPONENT_BEAUTIFIED Taliban Fighters Armed
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_TBAN_ARMED
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_TBAN_ARMED
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TBAN_ARMED
#endif

#include "\x\tac\addons\main\script_macros.hpp"


// += doesn't work correctly with inheritance
#define MOD_WEAPONS "Throw", "Put"
#define MOD_MAGAZINES ITEMS_2(HandGrenade)

#define ITEMS_2(item) item, item
#define ITEMS_3(item) item, item, item
#define ITEMS_4(item) item, item, item, item
#define ITEMS_5(item) item, item, item, item, item

#define MACRO_VEHICLE_TBAN_ARMED \
    scope = 2; \
    scopeCurator = 2; \
    side = 0; \
    faction = "Tban"; \
    author = ECSTRING(common,Author);
