#define COMPONENT shootingrange
#define COMPONENT_BEAUTIFIED Shooting Range
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_SHOOTINGRANGE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SHOOTINGRANGE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SHOOTINGRANGE
#endif

#include "\x\tac\addons\main\script_macros.hpp"


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

#define POPONTRIGGEREXIT_DEFAULT true


#define NOTIFY_DISTANCE 10

#define TIME_ROUND_CHARS 4


#define OVAL_TARGETS ["land_target_oval_f", "land_target_oval_wall_bottom_f", "land_target_oval_wall_left_f", "land_target_oval_wall_right_f", "land_target_oval_wall_top_f"]
#define OVAL_TARGET_ANIMS [ \
    ["Bottom_Rotate", "Target_Bottom_Rotate"], \
    ["Bottom_Rotate", "Target_Bottom_Rotate"], \
    ["Left_Rotate", "Target_Left_Rotate"], \
    ["Right_Rotate", "Target_Right_Rotate"], \
    ["Top_Rotate", "Target_Top_Rotate"] \
]
