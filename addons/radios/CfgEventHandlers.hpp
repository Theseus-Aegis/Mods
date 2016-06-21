class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_postInitClient));
    };
};

// Stop playing radio when destroyed
class Extended_Killed_EventHandlers {
    class Car {
        class ADDON {
            killed = QUOTE(_this call FUNC(stopRadio));
        };
    };
    class Tank {
        class ADDON {
            killed = QUOTE(_this call FUNC(stopRadio));
        };
    };
    class Helicopter {
        class ADDON {
            killed = QUOTE(_this call FUNC(stopRadio));
        };
    };
    class Plane {
        class ADDON {
            killed = QUOTE(_this call FUNC(stopRadio));
        };
    };
    class Ship_F {
        class ADDON {
            killed = QUOTE(_this call FUNC(stopRadio));
        };
    };
};
