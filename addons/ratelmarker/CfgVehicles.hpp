class CfgVehicles {
    class Air;
    class Helicopter: Air {
        class ACE_SelfActions {
            class GVAR(RatelMarker) {
                displayName = CSTRING(DisplayName);
                condition = QUOTE(_this call FUNC(canUseMarkerMenu));
                statement = QUOTE([ARR_2({call FUNC(createMarkerMenu)}, [])] call CBA_fnc_execNextFrame); // Wait a frame for interaction menu to disappear to allow new display creation
                showDisabled = 0;
                priority = 0;
                icon = QPATHTOF(UI\ratelMarker_ca.paa);
            };
        };
    };
};
