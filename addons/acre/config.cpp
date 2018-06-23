#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main", "CUP_WheeledVehicles_LR", "CUP_Wheeled_SUV", "A3_Soft_F_Exp_LSV_01", "A3_Soft_F_Exp_LSV_02"};
        author = ECSTRING(main,Author);
        authors[] = {"JoramD"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
