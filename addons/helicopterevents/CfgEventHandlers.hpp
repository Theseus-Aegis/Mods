class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

// Stop playing radio when destroyed
class Extended_Killed_EventHandlers {
    class Helicopter {
        class ADDON {
            killed = QUOTE(_this call FUNC(stopRadio));
        };
    };
};
