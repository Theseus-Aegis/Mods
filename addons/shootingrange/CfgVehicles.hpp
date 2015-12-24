class CfgVehicles {
    class ACE_Module;
    class GVAR(Module): ACE_Module {
        author = ECSTRING(common,Author);
        category = "TAC";
        displayName = CSTRING(Range);
        function = QFUNC(moduleInit);
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
            class Mode {
                displayName = CSTRING(Mode);
                description = CSTRING(ModeDesc);
                typeName = "NUMBER";
                class values {
                    class Time {
                        name = CSTRING(Timed);
                        value = 1;
                        default = 1;
                    };
                    class HitTimeLimited {
                        name = CSTRING(HitTimeLimited);
                        value = 2;
                    };
                    /*class HitTargetLimited {
                        name = CSTRING(HitTargetLimited);
                        value = 2;
                    };*/
                    class Trigger {
                        name = CSTRING(Trigger);
                        value = 3;
                    };
                };
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
            class CountdownTimes {
                displayName = CSTRING(CountdownTimes);
                description = CSTRING(CountdownTimesDesc);
                typeName = "STRING";
                defaultValue = "";
            };
            class DefaultCountdownTime {
                displayName = CSTRING(DefaultCountdownTime);
                description = CSTRING(DefaultCountdownTimeDesc);
                typeName = "NUMBER";
                defaultValue = COUNTDOWNTIME_DEFAULT;
            };
            class TriggerMarkers {
                displayName = CSTRING(TriggerMarkers);
                description = CSTRING(TriggerMarkersDesc);
                typeName = "STRING";
                defaultValue = "";
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };
};
