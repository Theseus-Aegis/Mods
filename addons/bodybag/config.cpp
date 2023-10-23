#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QCLASS(Bodybag_Object_OrangeLogo)
        };
        weapons[] = {
            QCLASS(Bodybag_OrangeLogo)
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main", "ace_medical"};
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
