#include "script_component.hpp"
/*
 * Author: DaC, Jonpas
 * Prepares a marker based on input and executes it on pilot and turrets.
 *
 * Arguments:
 * 0: RATEL Marker Menu <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [control] call tac_ratelmarker_fnc_canUseMarkerMenu;
 *
 * Public: No
 */

disableSerialization;

params ["_ctrl"];

private _ctrlParent = ctrlParent _ctrl;

private _grid = format ["%1%2", ctrlText (_ctrlParent displayCtrl GUI_ID_INPUT_X), ctrlText (_ctrlParent displayCtrl GUI_ID_INPUT_Y)];

// Close marker menu
_ctrlParent closeDisplay 0;

private _pos = [_grid] call ACEFUNC(common,getMapPosFromGrid);
TRACE_2("Grid to Position",_grid,_pos);


private _heli = vehicle ACE_player;

// Feed only occupied turrets
private _seeMarkerUnits = [];
{
    if (!isNull (_heli turretUnit _x) && !local (_heli turretUnit _x)) then {
        _seeMarkerUnits pushBack (_heli turretUnit _x);
    };
} forEach allTurrets _heli; // Get all turret paths in the vehicle (without person turrets)

// Add driver if there is one
if (!isNull (driver _heli) && !local (driver _heli)) then {
    _seeMarkerUnits pushBack (driver _heli);
};

// Create marker locally
[_pos] call FUNC(createMarker);

// Create marker remotely on array of objects
[QGVAR(created), [_pos], _seeMarkerUnits] call CBA_fnc_targetEvent;
