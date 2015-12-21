class CfgVehicles {
    class ACE_Module;
    class GVAR(module): ACE_Module {
        author = ECSTRING(common,Author);
        category = "TAC";
        displayName = CSTRING(Module);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1; // Global
        isTriggerActivated = 0;
        isDisposable = 0;
        //icon = QUOTE(PATHTOF(UI\Icon_Module_ShootingRange_ca.paa));//@todo
        class Arguments {
            class Targets {
                displayName = CSTRING(Targets);
                description = CSTRING(TargetsDesc);
                typeName = "STRING";
                defaultValue = "";
            };
            class Controllers {
                displayName = CSTRING(Controllers);
                description = CSTRING(ControllersDesc);
                typeName = "STRING";
                defaultValue = "";
            };
            class Durations {
                displayName = CSTRING(Durations);
                description = CSTRING(DurationsDesc);
                typeName = "STRING";
                defaultValue = "";
            };
            class PauseDurations {
                displayName = CSTRING(PauseDurations);
                description = CSTRING(PauseDurationsDesc);
                typeName = "STRING";
                defaultValue = "";
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };
};
