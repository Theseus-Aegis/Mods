class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
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
