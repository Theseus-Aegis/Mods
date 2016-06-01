#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(offroad), QGVAR(truck)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main", "Taliban_fighters", "hlcweapons_aks"};
        author = ECSTRING(main,Author);
        url = "http://www.theseus-aegis.com/";
        authors[] = {"Jonpas", "Rory"};
        VERSION_CONFIG;
    };
};

#include "CfgGroups.hpp"
#include "CfgVehicles.hpp"
