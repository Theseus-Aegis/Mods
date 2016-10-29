// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define PREFIX tac

#define MAJOR 1
#define MINOR 8
#define PATCHLVL 2
#define BUILD 0

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.62
#define REQUIRED_CBA_VERSION {3,1,1}
#define REQUIRED_ACE_VERSION {3,8,0}

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(TAC - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(TAC - COMPONENT)
#endif
