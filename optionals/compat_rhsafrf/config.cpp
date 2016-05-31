#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_heavylifter"};
        authors[] = {"Jonpas"};
        authorUrl = "https://github.com/jonpas";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
