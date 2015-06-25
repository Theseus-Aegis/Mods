#define ICON_SECURE QUOTE(PATHTOF(UI\secure_ca.paa))
#define ICON_UNSECURE QUOTE(PATHTOF(UI\unsecure_ca.paa))

#define MACRO_SECURITY \
    class ACE_Actions { \
        class ACE_MainActions { \
            class GVAR(Secure) { \
                displayName = CSTRING(Secure); \
                condition = QUOTE(_this call FUNC(canSecure)); \
                statement = QUOTE(_this call FUNC(setSecurity)); \
                showDisabled = 0; \
                priority = -5.0; \
                icon = ICON_SECURE; \
            }; \
            class GVAR(Unsecure) { \
                displayName = CSTRING(Unsecure); \
                condition = QUOTE(_this call FUNC(canUnsecure)); \
                statement = QUOTE(_this call FUNC(setSecurity)); \
                showDisabled = 0; \
                priority = -5.0; \
                icon = ICON_UNSECURE; \
            }; \
        }; \
    }; \
    class ACE_SelfActions { \
        class GVAR(Secure) { \
            displayName = CSTRING(Secure); \
            condition = QUOTE(_this call FUNC(canSecure)); \
            statement = QUOTE(_this call FUNC(setSecurity)); \
            showDisabled = 0; \
            priority = -5.0; \
            icon = ICON_SECURE; \
        }; \
        class GVAR(Unsecure) { \
            displayName = CSTRING(Unsecure); \
            condition = QUOTE(_this call FUNC(canUnsecure)); \
            statement = QUOTE(_this call FUNC(setSecurity)); \
            showDisabled = 0; \
            priority = -5.0; \
            icon = ICON_UNSECURE; \
        }; \
    };

class CfgVehicles {
    class Air;
    class Helicopter: Air {
        MACRO_SECURITY
    };
    class Plane: Air {
        MACRO_SECURITY
    };
};
