#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {
            QGVAR(moduleAddObjectToChronos)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main", "ace_zeus"};
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas"};
        url = "http://www.theseus-aegis.com/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
