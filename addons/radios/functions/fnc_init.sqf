#include "script_component.hpp"
/*
 * Author: JoramD
 * Adds base radio interactions.
 *
 * Arguments:
 * 0: Vehicle Class <STRING>
 *
 * Example:
 * ["Car"] call tac_radios_fnc_init
 *
 * Public: No
 */

params ["_class"];

private _play = [
    QGVAR(Play),
    LLSTRING(Play),
    QPATHTOF(ui\musicStart_ca.paa),
    {true},
    {GVAR(enabled) && isNull (_target getVariable [QGVAR(source), objNull])},
    {
        private _actions = [];
        {
            private _action = [
                format [QGVAR(Play_%1), _forEachIndex],
                getText (configFile >> "CfgSounds" >> _x >> "name") splitString "_" joinString " ",
                "",
                {(_this select 2) call FUNC(play)},
                {true},
                {},
                [_target, _x]
            ] call ACEFUNC(interact_menu,createAction),
            _actions pushBack [_action, [], _target];
        } forEach (uiNamespace getVariable [QGVAR(tracks), []]);
        _actions
    }
] call ACEFUNC(interact_menu,createAction);

private _stop = [
    QGVAR(Stop),
    LLSTRING(Stop),
    QPATHTOF(ui\musicStop_ca.paa),
    {(_this select 0) call FUNC(stop)},
    {!isNull (_target getVariable [QGVAR(source), objNull])}
] call ACEFUNC(interact_menu,createAction);


if (_class isKindOf "AllVehicles") then {
    [_class, 1, ["ACE_SelfActions"], _play, true] call ACEFUNC(interact_menu,addActionToClass);
    [_class, 1, ["ACE_SelfActions"], _stop, true] call ACEFUNC(interact_menu,addActionToClass);
} else {
    [_class, 0, ["ACE_MainActions"], _play, true] call ACEFUNC(interact_menu,addActionToClass);
    [_class, 0, ["ACE_MainActions"], _stop, true] call ACEFUNC(interact_menu,addActionToClass);
};

// Handle destruction
[_class, "killed", FUNC(stop), true] call CBA_fnc_addClassEventHandler;
