#define COMPONENT alarm
#include "\x\tac\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_ALARM
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ALARM
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ALARM
#endif

#include "\x\tac\addons\main\script_macros.hpp"


#define NOINTERACTMENU_DURATION 30
#define DEFAULT_SOUNDS ["Sound_Alarm"]
#define DEFAULT_SOUNDNAMES  ["Default Alarm"]
