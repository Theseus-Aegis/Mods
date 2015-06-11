#define ICON_SECURE QUOTE(PATHTOF(UI\secure_ca.paa))
#define ICON_UNSECURE QUOTE(PATHTOF(UI\unsecure_ca.paa))
#define ICON_STOPRADIO QUOTE(PATHTOF(UI\musicStop_ca.paa))
#define ICON_PLAYRADIO QUOTE(PATHTOF(UI\musicStart_ca.paa))

class CfgVehicles {
    class Air;
    class Helicopter: Air {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(Secure) {
                    displayName = CSTRING(Secure);
                    condition = QUOTE(_this call FUNC(canSecure));
                    statement = QUOTE(_this call FUNC(setSecurity));
                    showDisabled = 0;
                    priority = -5.0;
                    icon = ICON_SECURE;
                };
                class GVAR(Unsecure) {
                    displayName = CSTRING(Unsecure);
                    condition = QUOTE(_this call FUNC(canUnsecure));
                    statement = QUOTE(_this call FUNC(setSecurity));
                    showDisabled = 0;
                    priority = -5.0;
                    icon = ICON_UNSECURE;
                };
            };
        };
        class ACE_SelfActions {
            class GVAR(Secure) {
                displayName = CSTRING(Secure);
                condition = QUOTE(_this call FUNC(canSecure));
                statement = QUOTE(_this call FUNC(setSecurity));
                showDisabled = 0;
                priority = -5.0;
                icon = ICON_SECURE;
            };
            class GVAR(Unsecure) {
                displayName = CSTRING(Unsecure);
                condition = QUOTE(_this call FUNC(canUnsecure));
                statement = QUOTE(_this call FUNC(setSecurity));
                showDisabled = 0;
                priority = -5.0;
                icon = ICON_UNSECURE;
            };
            class GVAR(RadioStop) {
                displayName = CSTRING(StopRadio);
                condition = QUOTE(_this call FUNC(canStopRadio));
                statement = QUOTE(_this call FUNC(stopRadio));
                showDisabled = 0;
                priority = -5.1;
                icon = ICON_STOPRADIO;
            };
            class GVAR(RadioPlay) {
                displayName = CSTRING(PlayRadio);
                condition = QUOTE(_this call FUNC(canPlayRadio));
                insertChildren = QUOTE(_this call FUNC(addRadioTrackActions));
                showDisabled = 0;
                priority = -5.1;
                icon = ICON_PLAYRADIO;
            };
        };
    };
};
