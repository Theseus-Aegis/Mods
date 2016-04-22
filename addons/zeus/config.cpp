#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {
            QGVAR(moduleAddObjectToChronos)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main", "ace_zeus"};
        author[]= {"Jonpas"};
        authorUrl = "https://github.com/jonpas";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
