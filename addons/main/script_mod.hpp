// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define PREFIX tac

#include "script_version.hpp"

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.78
#define REQUIRED_CBA_VERSION {3,5,0}
#define REQUIRED_ACE_VERSION {3,10,1}

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(TAC - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(TAC - COMPONENT)
#endif
