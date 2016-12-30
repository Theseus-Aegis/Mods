#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tac_main",
            "CUP_Creatures_Military_ACR",
            "CUP_Creatures_Military_BAF",
            "CUP_Creatures_Military_CDF",
            "CUP_Creatures_Military_Germany",
            "CUP_Creatures_Military_Chedaki",
            "CUP_Creatures_Military_NAPA",
            "CUP_Creatures_Military_RACS",
            "CUP_Creatures_Military_Russia",
            "CUP_Creatures_Military_SLA",
            "CUP_Creatures_Military_Taki",
            "CUP_Creatures_Military_TakiInsurgents",
            "CUP_Creatures_Military_USArmy",
            "CUP_Creatures_Military_USMC",
            "CUP_Creatures_People_Civil_Chernarus"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
