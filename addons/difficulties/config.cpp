#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tac_main"};
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas", ACECSTRING(Common,ACETeam)};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAILevelPresets.hpp"
#include "CfgAISkill.hpp"
#include "CfgDifficultyPresets.hpp"
