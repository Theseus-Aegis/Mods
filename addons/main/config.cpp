#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_interaction", "ace_zeus"};
        author[]= {"Jonpas"};
        authorUrl = "https://github.com/jonpas";
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        dir = "@tac_mods";
        name = "Theseus Inc. Mods";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = "http://www.theseus-aegis.com";
    };
};

#include "CfgModuleCategories.hpp"
#include "CfgVehicleClasses.hpp"
