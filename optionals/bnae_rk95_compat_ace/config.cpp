#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        magazines[] = {
            "6Rnd_B_357_Mag",
            "8Rnd_9x19_B",
            "30Rnd_762x39_Magazine",
            "2Rnd_B_00_buckshot",
            "6Rnd_B_00_buckshot",
            "7Rnd_B_338_lapua",
            "9Rnd_B_45ACP"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main","bnae_rk95"};
        author = ECSTRING(main,Author);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgAmmo.hpp"
