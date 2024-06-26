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
 * 2: Remove after use <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [["Static"], [My_Group_One, My_Group_Two]] call MFUNC(reaction)
 * [["Patrol", "Combat"], [My_Group_One]] call MFUNC(reaction)
 */

params [["_types", []], "_groups", ["_removeAfterUse", true]];

if (!is3DENPreview && {hasInterface}) exitWith {};

if (is3DENPreview) then {
    private _typeCheck = _groups findIf {_x isEqualType "OBJECT"};
    if (_typeCheck != -1) then {
        ERROR_MSG_1("Input only allows groups, detected unit at index (%1)",_typeCheck);
    };

    // Typo debug
    {
        if !(toLower _x in ["static", "patrol", "combat"]) then {
            ERROR_MSG_1("Unknown reaction type value: %1",_x);
        };
    } forEach _types;
};

// Backward compatibility
if (_types isEqualType "STRING") then {
    _types = [_types];
};

private _static = _types findIf {_x == "static"} != -1;
private _patrol = _types findIf {_x == "patrol"} != -1;
private _combat = _types findIf {_x == "combat"} != -1;

// Allow optionally not removing the eventhandler.
{_x setVariable [QGVAR(reactionParams), [_removeAfterUse]]} forEach _groups;

// Rapidly increase static units knowledge for faster returned fire
if (_static) then {
    {
        {
            _x addEventHandler ["Suppressed", {
                params ["_unit", "", "_shooter"];
                private _group = group _unit;
                (_group getVariable [QGVAR(reactionParams), 0]) params ["_removeAfterUse"];

                if (_removeAfterUse) then {
                    _unit removeEventHandler [_thisEvent, _thisEventHandler];
                };

                _group reveal [_shooter, 1.5];
            }];
        } forEach (units _x);
    } forEach _groups;
};

// Have mobile units move directly toward enemy contact
if (_patrol) then {
    {
        private _leader = leader _x;
        _leader addEventHandler ["Suppressed", {
            params ["_unit", "", "_shooter"];
            private _group = group _unit;
            (_group getVariable [QGVAR(reactionParams), 0]) params ["_removeAfterUse"];

            if (_removeAfterUse) then {
                _unit removeEventHandler [_thisEvent, _thisEventHandler];
            };

            private _unitGroup = units _group;
            private _enemyPos = getPos _shooter;
            _unitGroup doMove _enemyPos;
        }];
    } forEach _groups;
};

// Allow movement on entering combat, EH is always removed after use.
if (_combat) then {
    {
        _x addEventHandler ["CombatModeChanged", {
            params ["_group", "_newMode"];

            if (_newMode != "COMBAT") exitWith {};

            private _leader = leader _group;
            private _units = units _group;
            private _pathEnabled = _leader checkAIFeature "PATH";
            private _moveEnabled = _leader checkAIFeature "MOVE";

            if !(_pathEnabled) then {
                {_x enableAI "PATH"} forEach _units;
            };
            if !(_moveEnabled) then {
                {_x enableAI "MOVE"} forEach _units;
            };

            _group removeEventHandler [_thisEvent, _thisEventHandler];
        }];
    } forEach _groups;
};

