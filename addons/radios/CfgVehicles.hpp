#define MACRO_RADIO_ACTIONS \
    class GVAR(RadioStop) { \
        displayName = CSTRING(StopRadio); \
        condition = QUOTE(_this call FUNC(canStopRadio)); \
        statement = QUOTE(_this call FUNC(stopRadio)); \
        icon = QUOTE(PATHTOF(UI\musicStop_ca.paa)); \
    }; \
    class GVAR(RadioPlay) { \
        displayName = CSTRING(PlayRadio); \
        condition = QUOTE(_this call FUNC(canPlayRadio)); \
        statement = "true"; \
        icon = QUOTE(PATHTOF(UI\musicStart_ca.paa)); \
        class GVAR(Volume) { \
            displayName = CSTRING(Volume); \
            condition = QUOTE(_this call FUNC(canPlayRadio)); \
            statement = "true"; \
            icon = ""; \
            class GVAR(Volume_Quiet) { \
                displayName = CSTRING(Quiet); \
                condition = "true"; \
                statement = QUOTE([ARR_2(0, _target)] call FUNC(changeVolume)); \
                icon = ""; \
            }; \
            class GVAR(Volume_Normal) { \
                displayName = CSTRING(Normal); \
                condition = "true"; \
                statement = QUOTE([ARR_2(1, _target)] call FUNC(changeVolume)); \
                icon = ""; \
            }; \
            class GVAR(Volume_Loud) { \
                displayName = CSTRING(Loud); \
                condition = "true"; \
                statement = QUOTE([ARR_2(2, _target)] call FUNC(changeVolume)); \
                icon = ""; \
            }; \
        }; \
        class GVAR(Tracks) { \
            displayName = CSTRING(Tracks); \
            condition = "true"; \
            insertChildren = QUOTE(_this call FUNC(addRadioTrackActions)); \
            icon = QUOTE(PATHTOF(UI\musicStart_ca.paa)); \
        }; \
    };

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        class ACE_SelfActions {
            MACRO_RADIO_ACTIONS
        };
    };
    class Tank: LandVehicle {
        class ACE_SelfActions {
            MACRO_RADIO_ACTIONS
        };
    };

    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            MACRO_RADIO_ACTIONS
        };
    };
    class Plane: Air {
        class ACE_SelfActions {
            MACRO_RADIO_ACTIONS
        };
    };

    class Ship;
    class Ship_F: Ship {
        class ACE_SelfActions {
            MACRO_RADIO_ACTIONS
        };
    };
};
