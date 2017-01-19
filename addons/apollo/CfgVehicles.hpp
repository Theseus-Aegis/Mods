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
        icon = QPATHTOF(UI\Icon_Module_Apollo_ca.paa);
        class Arguments {
            class enabled {
                displayName = ACECSTRING(Common,Enabled);
                description = CSTRING(EnabledDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class enabledPlayers {
                displayName = CSTRING(EnabledPlayers);
                description = CSTRING(EnabledPlayersDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class enabledVehicles {
                displayName = CSTRING(EnabledVehicles);
                description = CSTRING(EnabledVehiclesDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };
};
