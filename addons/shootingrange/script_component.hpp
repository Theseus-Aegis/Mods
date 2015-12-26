#define COMPONENT shootingrange
#include "\x\tac\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_SHOOTINGRANGE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SHOOTINGRANGE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SHOOTINGRANGE
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define MODE_DEFAULT 1

#define DURATIONS_DEFAULT [0, 30, 60, 150, 300]
#define DURATION_DEFAULT 60

#define TARGETAMOUNTS_DEFAULT [5, 10, 15, 30, 45]
#define TARGETAMOUNT_DEFAULT 15

#define PAUSEDURATIONS_DEFAULT [1, 2, 3, 4, 5]
#define PAUSEDURATION_DEFAULT 3

#define COUNTDOWNTIMES_DEFAULT [6, 9, 12, 15]
#define COUNTDOWNTIME_DEFAULT 9
#define COUNTDOWNTIME_LOWEST 5


#define NOTIFY_DISTANCE 100
#define NOTIFY_DISTANCE_SUPERVISOR 25

#define HIT_HEAD_CENTER [0,0.175,0.665] //@todo accuracy rating
#define HIT_TORSO_CENTER [0,0.175,0.175] //@todo accuracy rating

#define TIME_ROUND_CHARS 4
