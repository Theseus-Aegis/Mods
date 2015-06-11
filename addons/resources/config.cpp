#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_common"};
        author[]= {"DaC", "Jonpas", "Rory"};
        authorUrl = "http://www.theseus-aegis.com";
        VERSION_CONFIG;
    };
};
