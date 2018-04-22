#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {QGVAR(painkillersItem)};
        weapons[] = {QGVAR(painkillers)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main","ace_medical"};
        author = ECSTRING(main,Author);
        authors[] = {"Alganthe"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "ACE_Medical_Actions.hpp"
