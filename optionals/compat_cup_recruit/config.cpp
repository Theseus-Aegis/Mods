#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QEGVAR(supplies,Recruit)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_supplies", "CUP_Weapons_NVG", "CUP_Weapons_East_Attachments"};
        author = ECSTRING(main,Author);
        authors[] = {"TyroneMF"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
