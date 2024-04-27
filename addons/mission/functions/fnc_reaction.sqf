#include "..\script_component.hpp"
/*
 * Author: Mike
 * Adds reaction EventHandlers to AI for Patrols, Static Units or Enabling movement in combat.
 * Types are: "Patrol", "Static" or "Combat"
 * Static will increase AI knowledge of shooter immediately to full for quicker return fire.
 * Patrol will have any AI moving give up their waypoints and move to engage the shooter.
 * Combat will enable AI to move when entering combat mode.
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Types <ARRAY> (default: [])
 * 1: Groups <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["Static"], [My_Group_One, My_Group_Two]] call MFUNC(reaction)
 * [["Patrol", "Combat"], [My_Group_One]] call MFUNC(reaction)
 */

params [["_types", []], "_groups"];

if ((_groups select 0) isEqualType "OBJECT") exitWith {
    ERROR_MSG("Input only allows groups, detected unit.");
};

private _types = toLower _types;

// Backward compatibility
if (_types isEqualType "STRING") then {
    _types = [_types];
};

// Typo debug
{
    if !(_x in ["static", "patrol", "combat"]) then {
        ERROR_MSG_1("Unknown reaction type value: %1",_x);
    };
} forEach _types;

// Rapidly increase static units knowledge for faster returned fire
if ("static" in _types) then {
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

// Have mobile units move directly toward enemy contact
if ("patrol" in _types) then {
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

// Re-enable PATH or MOVE ai types when entering combat
if ("combat" in _types) then {
    {
        _x addEventHandler ["CombatModeChanged", {
            params ["_group", "_newMode"];

            if (_newMode != "COMBAT") exitWith {};

            private _leader = leader _group;
            private _pathEnabled = _leader checkAIFeature "PATH";
            private _moveEnabled = _leader checkAIFeature "MOVE";

            if !(_pathEnabled) then {
                {
                    _x enableAI "PATH";
                } forEach (units _group);
            };
            if !(_moveEnabled) then {
                {
                    _x enableAI "MOVE";
                } forEach (units _group);
            };

            _group removeEventHandler [_thisEvent, _thisEventHandler];
        }];
    } forEach _groups;
};

