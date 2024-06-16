class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};
class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
    };
};

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayInterrupt {
        GVAR(init) = QUOTE(call (uiNamespace getVariable 'FUNC(initDebugConsole)'));
    };
    class RscDisplayMPInterrupt {
        GVAR(init) = QUOTE(call (uiNamespace getVariable 'FUNC(initDebugConsole)'));
    };
};
