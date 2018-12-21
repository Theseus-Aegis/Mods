class CfgPatches {
    class ADDON {
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Weapons_F",
            "bnae_core",
            "bnae_mk1"
        };
        weapons[] = {
            "bnae_mk1_virtual",
            "bnae_mk1_t_virtual",
            "bnae_mk1_t_camo1_virtual",
            "bnae_mk1_no4_t_virtual"
        };
        units[] = {
            "bnae_mk1_editor"
        };
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgAmmo.hpp"
