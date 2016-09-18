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

class Extended_InitPost_EventHandlers {
    class CAManBase {
        class ADDON {
            clientInit = QUOTE(if (!(['tac_apollo'] call ace_common_fnc_isModLoaded) || {!EGVAR(apollo,enabled)} || {!EGVAR(apollo,enabledPlayers)}) then {_this call FUNC(setInsignia)});
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

class Extended_InventoryOpened_EventHandlers {
    class CAManBase {
        class ADDON {
            clientInventoryOpened = QUOTE(_this call FUNC(getInsignia));
        };
    };
};
