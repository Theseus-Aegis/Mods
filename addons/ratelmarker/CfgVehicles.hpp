class CfgVehicles {
    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            class GVAR(RatelMarker) {
                displayName = CSTRING(DisplayName);
                condition = QUOTE(_this call FUNC(canUseMarkerMenu));
                statement = QUOTE([] spawn FUNC(createMarkerMenu)); // createDisplay requires spawn
                showDisabled = 0;
                priority = 0;
                //icon = QUOTE(PATHTOF(UI\ratelMarker_ca.paa));
            };
        };
    };
};
