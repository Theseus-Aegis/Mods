class CfgVehicles {
    class ACE_Module;
    class GVAR(module): ACE_Module {
        author = ECSTRING(main,Author);
        category = "TAC";
        displayName = CSTRING(Module);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1; // Global
        isTriggerActivated = 0;
        isDisposable = 0;
        icon = QPATHTOF(UI\Icon_Module_Armory_ca.paa);
        class Arguments {
            class Objects {
                displayName = CSTRING(Objects);
                description = CSTRING(ObjectsDesc);
                typeName = "STRING";
                defaultValue = "";
            };
            class System {
                displayName = CSTRING(System);
                description = CSTRING(SystemDesc);
                typeName = "NUMBER";
                class values {
                    class Vanilla {
                        name = CSTRING(System_Vanilla);
                        value = 0;
                        default = 1;
                    };
                    class Chronos {
                        name = CSTRING(System_Chronos);
                        value = 1;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };


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
        displayName = CSTRING(Locker);
        ace_cargo_canLoad = 0;
        GVAR(enabled) = 1;

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
