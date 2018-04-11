/*
 * Author: Corello
 * Initialises the Event Handler for periodically checking equipment against the civilian gear list.
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(addDisguiseHandler);
 */
#include "script_component.hpp"

params ["_playerObject"];

[FUNC(disguisePFH), 1, [_playerObject]] call CBA_fnc_addPerFrameHandler;