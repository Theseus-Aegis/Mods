[
    QGVAR(destroyChance),
    "SLIDER",
    [LSTRING(DestroyChance), LSTRING(DestroyChanceDesc)],
    format ["TAC %1", localize "str_a3_rscdisplaywelcome_expa_parc_list6_title"],
    [0, 100, DESTROY_CHANCE_DEFAULT, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(returnDistance),
    "SLIDER",
    [LSTRING(ReturnDistance), LSTRING(ReturnDistanceDesc)],
    format ["TAC %1", localize "str_a3_rscdisplaywelcome_expa_parc_list6_title"],
    [5, 200, 30, 0],
    true
] call CBA_fnc_addSetting;
