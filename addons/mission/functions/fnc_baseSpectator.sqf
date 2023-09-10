#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Adds dynamic spectator availability through CBA Chat Commands and ACE3 Interaction Menu.
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Spectator Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, spectatorObject] call MFUNC(baseSpectator)
 * [player, spectatorObject2] call MFUNC(baseSpectator)
 */

#define NOTIFY_RANGE 50

params ["_player", "_object"];

// Verify object exists (getVariable work-around as we get object, which likes to return <any>)
if (isNull (missionNamespace getVariable [str _object, objNull])) exitWith {
    ERROR_MSG_1("Spectator screen not found! Expected '%1' object",str _object);
};

// Event for closing spectator from other machines
[QGVAR(baseSpectatorProhibit), {
    [false] call ACEFUNC(spectator,setSpectator);
}, _player] call CBA_fnc_addEventHandlerArgs;

// Player open spectator on specified object
private _actionOpen = [
    QGVAR(baseSpectatorOpen),
    "Open Spectator",
    "\a3\3den\data\cfg3den\camera\cameratexture_ca.paa",
    {[true, false] call ACEFUNC(spectator,setSpectator)}, // Forced by default (second parameter), non-forced allows user to exit
    {GVAR(baseSpectatorAllowed)},
    {},
    _object
] call ACEFUNC(interact_menu,createAction);

[_object, 0, ["ACE_MainActions"], _actionOpen] call ACEFUNC(interact_menu,addActionToObject);

// First call only
if (isNil QGVAR(baseSpectatorAllowed)) then {
    GVAR(baseSpectatorAllowed) = true;
    GVAR(baseSpectatorScreens) = [_object];

    // Admin chat command to toggle spectator availability
    ["tac-spec", {
        private _nearbyPlayersAll = [ACE_player];
        {
            private _nearbyPlayers = _x nearObjects ["CAManBase", NOTIFY_RANGE];
            _nearbyPlayersAll append _nearbyPlayers;
        } forEach GVAR(baseSpectatorScreens);
        _nearbyPlayersAll = _nearbyPlayersAll arrayIntersect _nearbyPlayersAll; // unique

        if (GVAR(baseSpectatorAllowed)) then {
            [QGVAR(baseSpectatorProhibit), nil, call CBA_fnc_players] call CBA_fnc_targetEvent;
            GVAR(baseSpectatorAllowed) = false;
            publicVariable QGVAR(baseSpectatorAllowed);
            ["ace_common_systemChatGlobal", "[TAC] Spectator Prohibited", _nearbyPlayersAll] call CBA_fnc_targetEvent;
        } else {
            GVAR(baseSpectatorAllowed) = true;
            publicVariable QGVAR(baseSpectatorAllowed);
            ["ace_common_systemChatGlobal", "[TAC] Spectator Allowed", _nearbyPlayersAll] call CBA_fnc_targetEvent;
        };
    }, "admin"] call CBA_fnc_registerChatCommand;
} else {
    GVAR(baseSpectatorScreens) pushBackUnique _object;
};
