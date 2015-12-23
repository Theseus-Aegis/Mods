#define COMPONENT shootingrange
#include "\x\tac\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_SHOOTINGRANGE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SHOOTINGRANGE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SHOOTINGRANGE
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define DURATIONS_DEFAULT [0, 30, 60, 150, 300]
#define DURATION_DEFAULT 60
#define PAUSEDURATIONS_DEFAULT [1, 2, 3, 4, 5]
#define PAUSEDURATION_DEFAULT 3
#define COUNTDOWNTIME_DEFAULT 9
#define COUNTDOWNTIME_LOWEST 5

#define NOTIFY_DISTANCE 100
