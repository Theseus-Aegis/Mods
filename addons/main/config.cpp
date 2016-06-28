#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_interaction"};
        author = CSTRING(Author);
        authors[] = {"Jonpas"};
        url = CSTRING(URL);
        VERSION_CONFIG;
    };
};

class CfgMods {
    class Mod_Base;
    class PREFIX: Mod_Base {
        dir = "@tac_mods";
        name = "Theseus Inc. Mods";
        picture = QPATHTOF(UI\logo_tac_ca.paa);
        logo = QPATHTOF(UI\logo_tac_small_ca.paa);
        logoOver = QPATHTOF(UI\logo_tac_small_ca.paa);
        logoSmall = QPATHTOF(UI\logo_tac_small_ca.paa);
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = CSTRING(URL);
    };
};

#include "CfgModuleCategories.hpp"
#include "CfgSettings.hpp"
#include "CfgVehicleClasses.hpp"
