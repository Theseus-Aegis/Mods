[
    QGVAR(moveHeadless),
    "CHECKBOX",
    [LSTRING(moveHeadless), LSTRING(moveHeadlessDesc)],
    format ["TAC %1", localize "str_a3_rscdisplaywelcome_expa_parc_list6_title"],
    true,
    {
        if (isServer) then {
            params ["_enabled"];
            if (_enabled && {!GVAR(moveHeadlessThread)) then {
                GVAR(moveHeadlessThread) = true;
                [FUNC(moveHeadless), [], 1] call CBA_fnc_waitAndExecute;
            };
        };
    }
] call CBA_fnc_addSetting;
