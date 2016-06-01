#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(offroad), QGVAR(truck)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main", "Taliban_fighters", "hlcweapons_aks"};
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas", "Rory"};
        PBO_URL;
        VERSION_CONFIG;
    };
};

#include "CfgGroups.hpp"
#include "CfgVehicles.hpp"
