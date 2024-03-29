#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
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
        dir = "@theseus_mods";
        name = "Theseus Mods";
        picture = QPATHTOF(UI\logo_tac_ca.paa);
        logo = QPATHTOF(UI\logo_tac_small_ca.paa);
        logoOver = QPATHTOF(UI\logo_tac_small_ca.paa);
        logoSmall = QPATHTOF(UI\logo_tac_small_ca.paa);
        hidePicture = "true";
        hideName = "true";
        actionName = "GitHub";
        action = CSTRING(URL);
    };
};

#include "CfgEden.hpp"
#include "CfgEditorCategories.hpp"
#include "CfgModuleCategories.hpp"
#include "CfgSettings.hpp"
#include "CfgVehicleClasses.hpp"
#include "displayEden.hpp"
