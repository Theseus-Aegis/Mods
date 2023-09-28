#define COMPONENT mission
#define COMPONENT_BEAUTIFIED Mission
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MISSION
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MISSION
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSION
#endif

#include "\x\tac\addons\main\script_macros.hpp"
#include "script_macros_mission.hpp"


// Logging
#define MLOG_SYS(MESSAGE) [__FILE__, "WARNING", MESSAGE] call FUNC(log)

#undef WARNING
#undef WARNING_1
#undef WARNING_2
#undef WARNING_3
#undef WARNING_4
#undef WARNING_5
#undef WARNING_6
#undef WARNING_7
#undef WARNING_8

#define WARNING(MESSAGE) MLOG_SYS(MESSAGE)
#define WARNING_1(MESSAGE,ARG1) WARNING(FORMAT_1(MESSAGE,ARG1))
#define WARNING_2(MESSAGE,ARG1,ARG2) WARNING(FORMAT_2(MESSAGE,ARG1,ARG2))
#define WARNING_3(MESSAGE,ARG1,ARG2,ARG3) WARNING(FORMAT_3(MESSAGE,ARG1,ARG2,ARG3))
#define WARNING_4(MESSAGE,ARG1,ARG2,ARG3,ARG4) WARNING(FORMAT_4(MESSAGE,ARG1,ARG2,ARG3,ARG4))
#define WARNING_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) WARNING(FORMAT_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5))
#define WARNING_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) WARNING(FORMAT_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6))
#define WARNING_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) WARNING(FORMAT_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7))
#define WARNING_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) WARNING(FORMAT_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8))
