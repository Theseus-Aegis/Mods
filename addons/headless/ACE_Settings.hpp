class ACE_Settings {
    class GVAR(Enabled) {
        value = 0;
        typeName = "BOOL";
        displayName = "STR_ACE_Common_Enabled";
        description = CSTRING(EnabledDesc);
    };
    class GVAR(HeadlessClients) {
        value = "";
        typeName = "STRING";
        displayName = CSTRING(ModuleHeadless);
        description = CSTRING(HeadlessClientsDesc);
    };
    class GVAR(Delay) {
        value = 60;
        typeName = "SCALAR";
        displayName = CSTRING(Delay);
        description = CSTRING(DelayDesc);
    };
};
