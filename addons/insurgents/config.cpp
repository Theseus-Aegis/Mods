#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(soldier_i),
            QGVAR(soldier_i_african),
            QGVAR(soldier_o),
            QGVAR(soldier_o_eastern),
            QGVAR(soldier_b)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main"};
        author = ECSTRING(main,Author);
        authors[] = {"veteran29"};
        VERSION_CONFIG;
    };
};


#include "CfgEventHandlers.hpp"
#include "CfgGroups.hpp"
#include "CfgInsurgentGear.hpp"
#include "CfgVehicles.hpp"
