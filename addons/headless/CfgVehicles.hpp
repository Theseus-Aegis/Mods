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
        icon = QUOTE(PATHTOF(UI\Icon_Module_Headless_ca.paa));
        class Arguments {
            class Enabled {
                displayName = "$STR_ACE_Common_Enabled";
                description = CSTRING(EnabledDesc);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class Delay {
                displayName = CSTRING(Delay);
                description = CSTRING(DelayDesc);
                typeName = "NUMBER";
                defaultValue = DELAY_DEFAULT;
            };
            class Log {
                displayName = CSTRING(Log);
                description = CSTRING(LogDesc);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };
};
