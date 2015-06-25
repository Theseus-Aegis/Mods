#define COMPONENT ratelmarker
#include "\x\tac\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_RATELMARKER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_RATELMARKER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_RATELMARKER
#endif

#include "\x\tac\addons\main\script_macros.hpp"


/* To be added to dev documentation
 * TAC Tag 3-ID = 213
 * Project 2-ID = 32
 * Control 2-ID = XY
 * IDs: <TAC Tag 6-ID> + <Project 2-ID> + <Control 2-ID>
 */
#define GUI_ID_INPUT_X 2133201
#define GUI_ID_INPUT_Y 2133201
