[
    QGVAR(lowerAPCSkill),
    "CHECKBOX",
    [LSTRING(LowerSkill), LSTRING(LowerSkillDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    true,
    true,
    {call FUNC(apcSkill)}
] call CBA_fnc_addSetting;
