// Included from initPlayerLocal.sqf from mission template.

// Disables ambient animals and ambient sounds
[{time > 0}, {enableEnvironment [false, true];}] call CBA_fnc_waitUntilAndExecute;

[_player, specScreen] call MFUNC(baseSpectator);
[_player] call FUNC(briefing);
[_player] call MFUNC(godMode);
[_player] call MFUNC(unconscious);

// Disable CUP street lights based on lighting levels (bad performance script)
CUP_stopLampCheck = true;

// Mission name event
[QGVAR(missionName), {
    [
        [
            [getMissionConfigValue ["onLoadName", ""], "<t size = '1.5' underline = '1'>%1</t><br/>"],
            ["Theseus Incorporated"],
            [getText (configFile >> "CfgWorlds" >> worldName >> "description"), "<t size = '1' font='puristaSemiBold'>%1</t>", 70]
        ]
    ] spawn BIS_fnc_typeText;
}] call CBA_fnc_addEventHandler;

// Chat Commands
["tac-aar", {
    [QGVAR(manualAAR), _thisArgs] call CBA_fnc_serverEvent;
}, "admin", [_player]] call CBA_fnc_registerChatCommand;
