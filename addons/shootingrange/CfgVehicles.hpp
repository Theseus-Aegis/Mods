class CfgVehicles {
    class ACE_Module;
    class GVAR(Module): ACE_Module {
        author = ECSTRING(main,Author);
        category = "TAC";
        displayName = CSTRING(Range);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1; // Global
        isTriggerActivated = 0;
        isDisposable = 0;
        icon = QPATHTOF(UI\Icon_Module_ShootingRange_ca.paa);
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
            class Hits {
                displayName = CSTRING(Hits);
                description = CSTRING(HitsDesc);
                typeName = "STRING";
                defaultValue = "";
            };
            class TargetsInvalid {
                displayName = CSTRING(TargetsInvalid);
                description = CSTRING(TargetsInvalidDesc);
                typeName = "STRING";
                defaultValue = "";
            };
            class Controllers {
                displayName = CSTRING(Controllers);
                description = CSTRING(ControllersDesc);
                typeName = "STRING";
                defaultValue = "";
            };
            class SoundSources {
                displayName = CSTRING(SoundSources);
                description = CSTRING(SoundSourcesDesc);
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
                        name = CSTRING(HitTimeLimit);
                        value = 2;
                    };
                    class HitTargetLimited {
                        name = CSTRING(HitTargetLimit);
                        value = 3;
                    };
                    class Trigger {
                        name = CSTRING(Trigger);
                        value = 4;
                    };
                    class Rampage {
                        name = CSTRING(Rampage);
                        value = 5;
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
            class TargetAmounts {
                displayName = CSTRING(TargetAmounts);
                description = CSTRING(TargetAmountsDesc);
                typeName = "STRING";
                defaultValue = "";
            };
            class DefaultTargetAmount {
                displayName = CSTRING(DefaultTargetAmount);
                description = CSTRING(DefaultTargetAmountDesc);
                typeName = "NUMBER";
                defaultValue = TARGETAMOUNT_DEFAULT;
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
            class PopOnTriggerExit {
                displayName = CSTRING(PopOnTriggerExit);
                description = CSTRING(PopOnTriggerExitDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class ShowHits {
                displayName = CSTRING(ShowHits);
                description = CSTRING(ShowHitsDesc);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };


    class TargetBase;
    class TargetP_Inf_F: TargetBase {
        class AnimationSources {
            class Terc {
                sound = QGVAR(TargetLargeSound);
            };
        };
        class EventHandlers {
            hitPart = QUOTE((_this select 0) call FUNC(handleHitPart)); // Replace vanilla script handler
        };
    };

    class Land_Target_Oval_F: TargetBase {
        class AnimationSources {
            class Left_Rotate {
                sound = QGVAR(TargetSmallSound);
            };
        };
        class EventHandlers {
            hitPart = QUOTE((_this select 0) call FUNC(handleHitPart)); // Replace vanilla script handler
        };
    };
};
