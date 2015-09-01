class CfgVehicles {
    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            class GVAR(RadioStop) {
                displayName = CSTRING(StopRadio);
                condition = QUOTE(_this call FUNC(canStopRadio));
                statement = QUOTE(_this call FUNC(stopRadio));
                icon = QUOTE(PATHTOF(UI\musicStop_ca.paa));
            };
            class GVAR(RadioPlay) {
                displayName = CSTRING(PlayRadio);
                condition = QUOTE(_this call FUNC(canPlayRadio));
                insertChildren = QUOTE(_this call FUNC(addRadioTrackActions));
                icon = QUOTE(PATHTOF(UI\musicStart_ca.paa));
            };
        };
    };
};
