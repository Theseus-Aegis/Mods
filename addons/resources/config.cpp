#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main"};
        author = ECSTRING(main,Author);
        url = "http://www.theseus-aegis.com/";
        authors[] = {"DaC", "Jonpas", "Rory"};
        authorUrl = "http://www.theseus-aegis.com";
        VERSION_CONFIG;
    };
};
