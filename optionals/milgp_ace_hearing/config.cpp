#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_hearing"};
        author = ECSTRING(main,Author);
        authors[] = {"Alganthe"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
