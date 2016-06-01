#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cha_av8b", "tac_heavylifter"};
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas"};
        PBO_URL;
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
