#define COMPONENT crates
#define COMPONENT_BEAUTIFIED Crates
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_BALLISTICS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_BALLISTICS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BALLISTICS
#endif

#include "\x\tac\addons\main\script_macros.hpp"

#define EDITOR_CATEGORY \
    editorCategory = "tac_Mission_Items"; \
    editorSubCategory = "tac_Mission_Items_Supplies";

// Box fill Macros
#define MACRO_ADDWEAPON(WEAPON,COUNT) class _xx_##WEAPON { \
    weapon = #WEAPON; \
    count = COUNT; \
}

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
    name = #ITEM; \
    count = COUNT; \
}

#define MACRO_ADDMAGAZINE(MAGAZINE,COUNT) class _xx_##MAGAZINE{ \
    magazine = #MAGAZINE; \
    count = COUNT; \
}
#define MACRO_ADDBACKPACK(BACKPACK,COUNT) class _xx_##BACKPACK { \
    backpack = #BACKPACK; \
    count = COUNT; \
}
