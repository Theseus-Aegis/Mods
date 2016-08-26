#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(Locker)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main"};
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEden.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "Dialog.hpp"
