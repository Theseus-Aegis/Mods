#define COMPONENT insurgents
#include "\x\tac\addons\main\script_mod.hpp"

#define DEBUG_SYNCHRONOUS

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_INSURGENTS
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_INSURGENTS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INSURGENTS
#endif

#include "\x\tac\addons\main\script_macros.hpp"

#define EMPTY_LOADOUT [[],[],[],[],[],[],"","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]

#define IS_DISPOSABLE(var) (cba_disposable_replaceDisposableLauncher && {!isNil {cba_disposable_NormalLaunchers getVariable var}})
#define RANDOM_GEAR(var) (GVAR(randomGear) getOrDefault [#var,[]])

#define GEAR_SETTING(var) (format [QGVAR(enabled_%1), var])
#define GEAR_ENABLED(var) (missionNamespace getVariable [GEAR_SETTING(var), true])
