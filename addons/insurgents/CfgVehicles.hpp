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

    class GVAR(soldier_o): GVAR(soldier_i) {
        side = 0;
        faction = "OPF_G_F";
        modelSides[] = {0,3};
    };

    class GVAR(soldier_b): GVAR(soldier_i) {
        side = 1;
        faction = "BLU_G_F";
        modelSides[] = {1,3};
    };

};
