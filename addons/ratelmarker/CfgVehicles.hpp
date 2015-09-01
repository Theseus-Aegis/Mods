class CfgVehicles {
    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            class GVAR(RatelMarker) {
                displayName = CSTRING(DisplayName);
                condition = QUOTE(_this call FUNC(canUseMarkerMenu));
                statement = QUOTE(call FUNC(createMarkerMenu)); // createDisplay requires spawn for not-yet-known reasons
                showDisabled = 0;
                priority = 0;
                icon = QUOTE(PATHTOF(UI\ratelMarker_ca.paa));
            };
        };
    };
};
