#include "..\script_component.hpp"
/*
 * Author: Mike
 * Adds reaction EventHandlers to AI for Patrols or Static Units
 * Types are: "Patrol", "Static" or "All"
 * Static will increase AI knowledge of shooter immediately to full for quicker return fire.
 * Patrol will have any AI moving give up their waypoints and move to engage the shooter.
 * All does both of the above.
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Type <STRING>
 * 1: Groups <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Static", [My_Group_One, My_Group_Two]] call MFUNC(reaction)
 * ["Patrol", [My_Group_One]] call MFUNC(reaction)
 * ["All", [My_Group_One]] call MFUNC(reaction)
 */

params ["_type", "_groups"];

if ((_groups select 0) isEqualType "OBJECT") exitWith {
    ERROR_MSG("Input only allows groups, detected unit.");
};

private _type = toLower _type;

// Debug for typos
if !(_type in ["static", "patrol", "all"]) then {
    ERROR_MSG_1("Unknown reaction type value: %1",_type);
};

if (_type in ["static", "all"]) then {
    {
        {
            _x addEventHandler ["Suppressed", {
                params ["_unit", "", "_shooter"];

                _unit removeEventHandler [_thisEvent, _thisEventHandler];

                private _unitGroup = group _unit;
                _unitGroup reveal [_shooter, 1.5];
            }];
        } forEach (units _x);
    } forEach _groups;
};

if (_type in ["patrol", "all"]) then {
    {
        private _leader = leader _x;
        _leader addEventHandler ["Suppressed", {
            params ["_unit", "", "_shooter"];

            _unit removeEventHandler [_thisEvent, _thisEventHandler];

            private _unitGroup = units (group _unit);
            private _enemyPos = getPos _shooter;
            _unitGroup doMove _enemyPos;
        }];
    } forEach _groups;
};
