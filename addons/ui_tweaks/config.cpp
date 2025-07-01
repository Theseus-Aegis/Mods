#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main"};
        author = ECSTRING(main,Author);
        authors[] = {"Drofseh, Mike"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "RscDisplay.hpp"
#include "Display3DEN.hpp"
