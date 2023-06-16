#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(BreachingCharge),
            QGVAR(BreachingCharge_Place)
        };
        weapons[] = {
            QGVAR(BreachingCharge_Muzzle)
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main", "ace_explosives"};
        author = ECSTRING(main,Author);
        authors[] = {"Ampersand", "Mike", "Jonpas"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
