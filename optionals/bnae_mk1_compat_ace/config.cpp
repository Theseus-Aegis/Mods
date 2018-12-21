class CfgPatches {
    class ADDON {
        units[] = {"bnae_mk1_editor"};
        weapons[] = {
            "bnae_mk1_virtual",
            "bnae_mk1_t_virtual",
            "bnae_mk1_t_camo1_virtual",
            "bnae_mk1_no4_t_virtual"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"bnae_core", "bnae_mk1"};
        author = ECSTRING(main,Author);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgAmmo.hpp"
