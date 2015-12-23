class CfgVehicles {
    class ACE_Module;
    class GVAR(module): ACE_Module {
        author = ECSTRING(common,Author);
        category = "TAC";
        displayName = CSTRING(ModuleStatic);
        function = QFUNC(moduleStaticInit);
        scope = 2;
        isGlobal = 1; // Global
        isTriggerActivated = 0;
        isDisposable = 0;
        //icon = QUOTE(PATHTOF(UI\Icon_Module_ShootingRange_ca.paa));//@todo
        class Arguments {
            class Name {
                displayName = CSTRING(Name);
                description = CSTRING(NameDesc);
                typeName = "STRING";
                defaultValue = "";
            };
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
            class DefaultDuration {
                displayName = CSTRING(DefaultDuration);
                description = CSTRING(DefaultDurationDesc);
                typeName = "NUMBER";
                defaultValue = DURATION_DEFAULT;
            };
            class PauseDuration {
                displayName = CSTRING(PauseDurations);
                description = CSTRING(PauseDurationsDesc);
                typeName = "STRING";
                defaultValue = "";
            };
            class DefaultPauseDuration {
                displayName = CSTRING(DefaultPauseDuration);
                description = CSTRING(DefaultPauseDurationDesc);
                typeName = "NUMBER";
                defaultValue = PAUSEDURATION_DEFAULT;
            };
            class CountdownTime {
                displayName = CSTRING(CountdownTime);
                description = CSTRING(CountdownTimeDesc);
                typeName = "NUMBER";
                defaultValue = COUNTDOWNTIME_DEFAULT;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleStaticDesc);
        };
    };
};
