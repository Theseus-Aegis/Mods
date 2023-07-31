#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main", "MELB"};
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

class Mode_FullAuto;
class RscControlsGroup;
class RangeText;

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscInGameUI.hpp"
