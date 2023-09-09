#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Assigns AI first found NVG in their inventory during night time and unassigns it during day time.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call tac_mission_fnc_assignNVG
 *
 * Public: No
 */

params ["_unit"];

if (alive _unit && !isPlayer _unit) then {
    private _nvg = hmd _unit;

    if (GVAR(assignNVGstate)) then {
        if (_nvg == "") then {
            private _items = [_unit, false, true, true, true, false, false] call CBA_fnc_uniqueUnitItems; // backpack, vest, uniform
            {
                if (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "NVGoggles") exitWith {
                    _unit assignItem _x;
                };
            } forEach _items;
        };
    } else {
        if (_nvg != "" && {currentVisionMode _unit == 0} && {_unit canAdd _nvg}) then {
            _unit unassignItem _nvg;
        };
    };
};
