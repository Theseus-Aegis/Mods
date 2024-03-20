[
    QGVAR(headlessMove),
    "CHECKBOX",
    [LSTRING(headlessPosition), LSTRING(headlessPositionDesc)],
    format ["TAC %1", localize LSTRING(DisplayName)],
    true,
    {
        if (!isServer) exitWith {};
        params ["_value"];
        if (_value) then {
            call FUNC(moveHeadless);
        };
    };
] call CBA_fnc_addSetting;
