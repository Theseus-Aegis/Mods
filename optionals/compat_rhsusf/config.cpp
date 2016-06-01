#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_heavylifter"};
        author = ECSTRING(main,Author);
        url = "http://www.theseus-aegis.com/";
        authors[] = {"Jonpas"};
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
