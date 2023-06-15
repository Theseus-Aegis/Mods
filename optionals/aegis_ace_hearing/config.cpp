#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tac_main",
            "ace_hearing",
            "A3_Aegis_Characters_F_Aegis_Headgear",
            "A3_athena_Characters_F_athena_Headgear",
            "A3_Atlas_Characters_F_Atlas_Headgear",
            "A3_revolucion_Characters_F_revolucion_Headgear"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Mike"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
