#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Adds an object to Chronos persistence (executed locally on client who placed the module).
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY> (unused)
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_logic", "", "_activated"];

if !(_activated && {local _logic}) exitWith {};

(missionNamespace getVariable ["bis_fnc_curatorObjectPlaced_mouseOver", [""]]) params ["_mouseOverType", "_mouseOverUnit"];

if (!(["tac_apollo"] call ACEFUNC(common,isModLoaded))) then {
    [LSTRING(EnableChronos)] call ACEFUNC(common,displayTextStructured);
} else {
    if (_mouseOverType != "OBJECT" || {_mouseOverUnit isKindOf "CAManBase"}) then {
        [LSTRING(PlaceOnObject)] call ACEFUNC(common,displayTextStructured);
    } else {
        if !((_mouseOverUnit getVariable [QEGVAR(apollo,vehicleID), "None"]) isEqualTo "None") then {
            [LSTRING(AlreadyInChronos)] call ACEFUNC(common,displayTextStructured);
        } else {
            [QGVAR(addObjectToChronos), [_mouseOverUnit, ace_player]] call CBA_fnc_serverEvent;
        };
    };
};

deleteVehicle _logic;
