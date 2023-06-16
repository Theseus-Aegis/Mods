#define MACRO_RADIO_ACTIONS \
    class GVAR(RadioStop) { \
        displayName = CSTRING(StopRadio); \
        condition = QUOTE(_this call FUNC(canStopRadio)); \
        statement = QUOTE(_this call FUNC(stopRadio)); \
        icon = QPATHTOF(ui\musicStop_ca.paa); \
    }; \
    class GVAR(RadioPlay) { \
        displayName = CSTRING(PlayRadio); \
        condition = QUOTE(_this call FUNC(canPlayRadio)); \
        statement = "true"; \
        insertChildren = QUOTE(_this call FUNC(addRadioTrackActions)); \
        icon = QPATHTOF(ui\musicStart_ca.paa); \
    };

class CBA_Extended_EventHandlers;

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

    class Items_base_F;
    class Land_SurvivalRadio_F: Items_base_F {
        GVAR(isRadio) = 1;
        class ACE_Actions {
            class ACE_MainActions {
                selection = "";
                distance = 5;
                condition = "true";
                MACRO_RADIO_ACTIONS
            };
        };
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
    class Land_FMradio_F: Items_base_F {
        GVAR(isRadio) = 1;
        class ACE_Actions {
            class ACE_MainActions {
                selection = "";
                distance = 5;
                condition = "true";
                MACRO_RADIO_ACTIONS
            };
        };
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
};
