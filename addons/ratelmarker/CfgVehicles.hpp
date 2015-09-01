class CfgVehicles {
    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            class GVAR(RatelMarker) {
                displayName = CSTRING(DisplayName);
                condition = QUOTE(_this call FUNC(canUseMarkerMenu));
                // Wait a frame for interaction menu to disappear to allow new display creation
                statement = QUOTE([ARR_2({call FUNC(createMarkerMenu)}, [])] call ACE_Common_fnc_execNextFrame);
                showDisabled = 0;
                priority = 0;
                icon = QUOTE(PATHTOF(UI\ratelMarker_ca.paa));
            };
        };
    };
};
