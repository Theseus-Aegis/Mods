#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(Launchers),
            QGVAR(Engineer),
            QGVAR(Medic),
            QGVAR(Recruit)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main", "ace_medical_treatment"};
        author = ECSTRING(main,Author);
        authors[] = {"GilleeDoo", "JoramD", "TyroneMF"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
