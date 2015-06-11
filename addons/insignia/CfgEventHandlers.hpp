class Extended_InitPost_EventHandlers {
    class CAManBase {
        class ADDON {
            onRespawn = true;
            clientInit = QUOTE([ARR_2(_this select 0, QUOTE(QGVAR(logoStitch)))] call BIS_fnc_setUnitInsignia);
        };
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        class ADDON {
            clientTake = QUOTE([ARR_2(_this select 0, QUOTE(QGVAR(logoStitch)))] call BIS_fnc_setUnitInsignia);
        };
    };
};
