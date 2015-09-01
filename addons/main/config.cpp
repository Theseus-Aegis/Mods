#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_interaction"};
        author[]= {"TAC Mod Team"};
        authorUrl = "http://www.theseus-aegis.com/";
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
        action = "http://www.theseus-aegis.com/";
    };
};
