[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Enabled), LSTRING(EnabledDesc)],
    format ["TAC %1", localize "str_a3_rscdisplaywelcome_expa_parc_list6_title"],
    true,
    true,
    {[ACE_player] call FUNC(setInsignia)}
] call CBA_fnc_addSetting;
