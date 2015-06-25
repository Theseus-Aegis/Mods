#define ICON_STOPRADIO QUOTE(PATHTOF(UI\musicStop_ca.paa))
#define ICON_PLAYRADIO QUOTE(PATHTOF(UI\musicStart_ca.paa))

#define MACRO_RADIOS \
    class ACE_SelfActions { \
        class GVAR(RadioStop) { \
            displayName = CSTRING(StopRadio); \
            condition = QUOTE(_this call FUNC(canStopRadio)); \
            statement = QUOTE(_this call FUNC(stopRadio)); \
            icon = ICON_STOPRADIO; \
        }; \
        class GVAR(RadioPlay) { \
            displayName = CSTRING(PlayRadio); \
            condition = QUOTE(_this call FUNC(canPlayRadio)); \
            insertChildren = QUOTE(_this call DFUNC(addRadioTrackActions)); \
            icon = ICON_PLAYRADIO; \
        }; \
    };

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        MACRO_RADIOS
    };
    class Tank: LandVehicle {
        MACRO_RADIOS
    };

    class Air;
    class Helicopter: Air {
        MACRO_RADIOS
    };
    class Plane: Air {
        MACRO_RADIOS
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_RADIOS
    };
};
