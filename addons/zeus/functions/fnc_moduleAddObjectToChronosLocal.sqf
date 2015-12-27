/*
 * Author: Jonpas
 * Adds an object to Chronos persistence (local - executed before server).
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY> (Unused)
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "", "_activated"];

if !(_activated && local _logic) exitWith {};

(missionNamespace getVariable ["bis_fnc_curatorObjectPlaced_mouseOver", [""]]) params ["_mouseOverType", "_mouseOverUnit"];

if !(ChronosLoaded isEqualTo "true") then {
    [LSTRING(ChronosNotEnabled)] call ACE_Common_fnc_displayTextStructured;
} else {
    if (_mouseOverType != "OBJECT") then {
        ["STR_ACE_Zeus_NothingSelected"] call ACE_Common_fnc_displayTextStructured;
    } else {
        if !(_mouseOverUnit getVariable ["vehicleChronosID", "None"] isEqualTo "None") then {
            [LSTRING(AlreadyChronosPersistent)] call ACE_Common_fnc_displayTextStructured;
        } else {
            [_mouseOverUnit] call FUNC(moduleAddObjectToChronosServer);
        };
    };
};

deleteVehicle _logic;
