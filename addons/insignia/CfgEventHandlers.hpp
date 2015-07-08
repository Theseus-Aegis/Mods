class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_InitPost_EventHandlers {
    class CAManBase {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(setInsignia));
        };
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        class ADDON {
            clientTake = QUOTE(_this call FUNC(setInsignia));
        };
    };
};
