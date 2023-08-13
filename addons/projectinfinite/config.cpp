#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tac_main",
            "bnae_falkor",
            "bnae_mk1",
            "bnae_trg42"
        };
        author = ECSTRING(main,Author);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

class Mode_SemiAuto;
class Mode_FullAuto;
class asdg_OpticRail1913;

#include "CfgAmmo.hpp"
#include "CfgWeapons.hpp"
