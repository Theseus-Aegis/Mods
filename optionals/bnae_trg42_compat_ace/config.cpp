class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "bnae_trg42",
            "bnae_core",
            "bnae_silencer",
            "bnae_muzzle",
            "cba_jr"
        };
        author = ECSTRING(main,Author);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgAmmo.hpp"
