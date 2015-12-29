class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        serverInit = QUOTE(call COMPILE_FILE(XEH_postInitServer));
    };
};

class Extended_InitPost_EventHandlers {
    class HeadlessClient_F {
        class ADDON {
            serverInit = QUOTE([_this select 0] call FUNC(registerHeadless));
        };
    };
};
