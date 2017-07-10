#include "script_component.hpp"

class CfgPatches {
    class cba_settings_userconfig {
        name = "$STR_CBA_Settings_Component";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_settings"};
        author = "$STR_CBA_Author";
        authors[] = {"commy2"};
        url = "$STR_CBA_URL";
        VERSION_CONFIG;
    };
};
