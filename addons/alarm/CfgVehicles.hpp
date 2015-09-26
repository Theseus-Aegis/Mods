class CfgVehicles {
    class ACE_Module;
    class GVAR(module): ACE_Module {
        author = ECSTRING(common,Author);
        category = "TAC";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1;
        //icon = PATHTOF(UI\Icon_Module_Alarm_ca.paa); @todo
        class Arguments {
            class Alarms {
                displayName = CSTRING(Alarms_DisplayName);
                description = CSTRING(Alarms_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Buttons {
                displayName = CSTRING(Buttons_DisplayName);
                description = CSTRING(Buttons_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Sounds {
                displayName = CSTRING(Sounds_DisplayName);
                description = CSTRING(Sounds_Description);
                typeName = "STRING"; //@todo
                defaultValue = ""; //@todo
            };
            class SoundNames {
                displayName = CSTRING(SoundNames_DisplayName);
                description = CSTRING(SoundNames_Description);
                typeName = "STRING"; //@todo
                defaultValue = ""; //@todo
            };
            class Duration {
                displayName = CSTRING(Duration_DisplayName);
                description = CSTRING(Duration_Description);
                typeName = "NUMBER";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
