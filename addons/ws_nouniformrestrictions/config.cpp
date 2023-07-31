#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tac_main",
            "data_f_lxWS_Loadorder"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Mike"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

#include "CfgVehicles.hpp"
