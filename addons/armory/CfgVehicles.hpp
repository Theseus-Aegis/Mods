class CfgVehicles {
    class ThingX;
    class ReammoBox_F: ThingX {
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    class B_supplyCrate_F: ReammoBox_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {};
        };
    };
    class GVAR(Locker): B_supplyCrate_F {
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(main,Author);
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\tacs_locker_co.paa)
        };
        displayName = CSTRING(Locker);
        ACEGVAR(cargo,canLoad) = 0;

        // Empty inventory
        class TransportBackpacks {};
        class TransportItems {};
        class TransportMagazines {};
        class TransportWeapons {};

        // Open Armory Action
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(Open) {
                    displayName = CSTRING(Open);
                    condition = QUOTE(_target call FUNC(canOpenArmory));
                    statement = QUOTE(_this call FUNC(openArmory));
                };
            };
        };
    };
};
