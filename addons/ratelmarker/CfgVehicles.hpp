// statement - Wait a frame for interaction menu to disappear to allow new display creation
#define MACRO_RATELMARKER \
    class ACE_SelfActions { \
        class GVAR(RatelMarker) { \
            displayName = CSTRING(DisplayName); \
            condition = QUOTE(_this call FUNC(canUseMarkerMenu)); \
            statement = QUOTE([ARR_2({call FUNC(createMarkerMenu)}, [])] call CBA_fnc_execNextFrame); \
            showDisabled = 0; \
            priority = 0; \
            icon = QPATHTOF(UI\ratelMarker_ca.paa); \
        }; \
    };

class CfgVehicles {
    class Air;
    class Helicopter: Air {
        MACRO_RATELMARKER
    };
    class Plane: Air {
        MACRO_RATELMARKER
    };
};
