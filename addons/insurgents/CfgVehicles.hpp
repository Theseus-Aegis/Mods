class CfgVehicles {
    class I_G_Soldier_base_F;
    class I_G_Soldier_F: I_G_Soldier_base_F {
        class EventHandlers;
    };

    class GVAR(soldier_i): I_G_Soldier_F {
        displayName = CSTRING(Insurgent);

        scope = 2;
        scopeCurator = 2;

        uniformClass = "";

        headgearProbability = 0;
        weapons[] = {"Throw", "Put"};
        respawnWeapons[] = {"Throw", "Put"};
        magazines[] = {};
        respawnMagazines[] = {};
        linkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
        respawnlinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};

        class EventHandlers: EventHandlers {
            init = "";
            class ADDON {
                init = QUOTE(call FUNC(randomizeGear));
            };
        };
    };

    class GVAR(soldier_i_african): GVAR(soldier_i) {
        displayName = CSTRING(Insurgent_African);
        identityTypes[] = {"LanguageFRE_F", "Head_Tanoan"};
        genericNames = "TanoanMen";
    };

    class GVAR(soldier_o): GVAR(soldier_i) {
        side = 0;
        faction = "OPF_G_F";
    };

    class GVAR(soldier_o_eastern): GVAR(soldier_o) {
        displayName = CSTRING(Insurgent_Eastern);
        identityTypes[] = {"LanguagePER_F", "Head_TK"};
        genericNames = "TakistaniMen";
    };

    class GVAR(soldier_b): GVAR(soldier_i) {
        side = 1;
        faction = "BLU_G_F";
    };

};
