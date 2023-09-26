#include "..\script_component.hpp"
/*
 * Author: Kresky, Jonpas
 * Adds the ability to "pick up" objects, and add an intel entry in the briefing tab.
 * Call from initPlayerLocal.sqf
 * Check for validity of object when using delete on collection (isNil)!
 *
 * Arguments:
 * 0: Object name (The object you want to "pick up") <OBJECT>
 * 1: ACE Interact text <STRING>
 * 2: Hint message <STRING>
 * 3: Diary/briefing entry tab name <STRING>
 * 4: Description/text the intel contains <STRING>
 * 5: Delete on collect <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * if (!isNil "intel01") then {
 *     [intel01, "Collect Document", "Document picked up", "Intel", "Documents describing some stuff", true] call MFUNC(collectIntel);
 * };
 */

params ["_controller", "_interactText", "_hintText", "_intelEntry", "_intelDescription", ["_deleteOnCollect", true]];

// Add action
private _actionPath = format [QGVAR(collectIntel_%1), _controller];
private _actionCollectIntel = [
    _actionPath,
    _interactText,
    "",
    {
        (_this select 2) params ["_actionPath", "_hintText", "_intelEntry", "_intelDescription", "_deleteOnCollect"];

        _player playMoveNow "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";

        [_hintText] call ACEFUNC(common,displayTextStructured);
        [QGVAR(collectIntel_collect), [side group _player, ["Diary", [_intelEntry, _intelDescription]]]] call CBA_fnc_serverEvent;

        ["ocap_customEvent", ["generalEvent", "Intel was collected!"]] call CBA_fnc_serverEvent;

        if (_deleteOnCollect) then {
            deleteVehicle _target;
        } else {
            _target setVariable [QGVAR(collectIntel_collected), true, true];
        };
    },
    {!(_target getVariable [QGVAR(collectIntel_collected), false])},
    {},
    [_actionPath, _hintText, _intelEntry, _intelDescription, _deleteOnCollect]
] call ACEFUNC(interact_menu,createAction);

[_controller, 0, ["ACE_MainActions"], _actionCollectIntel] call ACEFUNC(interact_menu,addActionToObject);
