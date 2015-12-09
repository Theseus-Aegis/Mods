#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(offroad), QGVAR(truck)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_common", "Taliban_fighters", "hlcweapons_aks"};
        author[]= {"Jonpas", "Rory"};
        authorUrl = "https://github.com/jonpas";
        VERSION_CONFIG;
    };
};

#include "CfgGroups.hpp"
#include "CfgVehicles.hpp"
