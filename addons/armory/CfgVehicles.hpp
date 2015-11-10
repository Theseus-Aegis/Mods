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
        author = ECSTRING(common,Author);
        displayName = CSTRING(Locker);
        vehicleClass = "TAC";

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
                    condition = QUOTE(_target call FUNC(canAddArmory));
                    statement = QUOTE(_target call FUNC(openArmory));
                };
            };
        };
    };
};
