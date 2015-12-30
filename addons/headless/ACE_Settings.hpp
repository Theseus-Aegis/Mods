class ACE_Settings {
    class GVAR(Enabled) {
        value = 0;
        typeName = "BOOL";
        displayName = "$STR_ACE_Common_Enabled";
        description = CSTRING(EnabledDesc);
    };
    class GVAR(Delay) {
        value = DELAY_DEFAULT;
        typeName = "SCALAR";
        displayName = CSTRING(Delay);
        description = CSTRING(DelayDesc);
    };
    class GVAR(Log) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(Log);
        description = CSTRING(LogDesc);
    };
};
