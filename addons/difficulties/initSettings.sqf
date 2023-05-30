[
    QGVAR(lowerAPCSkill),
    "CHECKBOX",
    [LSTRING(LowerSkillDisplayName), LSTRING(LowerSkillDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    true,
    true,
    FUNC(apcSkill)
] call CBA_fnc_addSetting;

[
    QGVAR(skillFactor),
    "SLIDER",
    [LSTRING(skillFactorDisplayName), LSTRING(skillFactorDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    [0, 1, 0.5, 2],
    true
] call CBA_fnc_addSetting;
