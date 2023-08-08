#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tac_heavylifter",
            // Heavy Lifter - Generated using heavylifter_exportConfig function
            "Air_F_lxWS",
            "Air_1_F_lxWS",
            "vehicles_1_F_lxWS_APC_Wheeled_02"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
