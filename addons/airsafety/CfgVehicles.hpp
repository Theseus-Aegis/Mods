class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            // In a frozen aircraft (its pilot left while flying, FUNC(handleDisconnect))
            class GVAR(resume) {
                displayName = CSTRING(Resume);
                condition = QUOTE(call FUNC(canResume));
                statement = QUOTE(call FUNC(resume));
                exceptions[] = {"isNotInside"};
                icon = "\a3\ui_f\data\IGUI\Cfg\Actions\engine_on_ca.paa";
            };
            class GVAR(takePilotSeat) {
                displayName = CSTRING(TakePilotSeat);
                condition = QUOTE(call FUNC(canTakePilotSeat));
                statement = QUOTE(call FUNC(takePilotSeat));
                exceptions[] = {"isNotInside"};
                icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getinpilot_ca.paa";
            };
        };
    };
};
