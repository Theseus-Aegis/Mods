#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QCLASS(Breaching_Charge),
            QCLASS(Breaching_Charge_Place)
        };
        weapons[] = {
            QCLASS(Breaching_Charge_Muzzle)
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tac_main",
            "ace_explosives",
            "ace_interaction"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Mike", "Jonpas"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
