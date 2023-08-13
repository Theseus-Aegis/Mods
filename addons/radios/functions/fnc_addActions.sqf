#include "script_component.hpp"
/*
 * Author: JoramD
 * Adds base radio interactions.
 *
 * Arguments:
 * 0: Internal Classes <ARRAY>
 * 1: Extermal Classes <ARRAY>
 *
 * Example:
 * [["Car", "Tank"], ["Land_SurvivalRadio_F"]] call tac_radios_fnc_addActions;
 *
 * Public: No
 */

params ["_internalRadioClasses", "_externalRadioClasses"];

diag_log _internalRadioClasses;
diag_log _externalRadioClasses;

private _radioPlay = [
    QGVAR(RadioPlay),
    LLSTRING(PlayRadio),
    QPATHTOF(ui\musicStart_ca.paa),
    {true},
    {(_this select 0) call FUNC(canPlayRadio)},
    {(_this select 0) call FUNC(addRadioTrackActions)}
] call ACEFUNC(interact_menu,createAction);

private _radioStop = [
    QGVAR(RadioStop),
    LLSTRING(StopRadio),
    QPATHTOF(ui\musicStop_ca.paa),
    {(_this select 0) call FUNC(stopRadio)},
    {(_this select 0) call FUNC(canStopRadio)}
] call ACEFUNC(interact_menu,createAction);

{
    [(_x select 0), 0, ["ACE_SelfActions"], _radioPlay, true] call ACEFUNC(interact_menu,addActionToClass);
    [(_x select 0), 0, ["ACE_SelfActions"], _radioStop, true] call ACEFUNC(interact_menu,addActionToClass);
    [(_x select 1), 0, ["ACE_MainActions"], _radioPlay, true] call ACEFUNC(interact_menu,addActionToClass);
    [(_x select 1), 0, ["ACE_MainActions"], _radioStop, true] call ACEFUNC(interact_menu,addActionToClass);
} forEach [_internalRadioClasses, _externalRadioClasses];
