#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Sends a bodybag at base to the website, where its owner chooses what goes back into their locker
 * ("Return to owner"). What's in the bag is capped by what went into it (tac_bodybag_contents); the
 * website caps it by the loadout at death. Deletes the bag once sent and tells the returner (and the
 * owner, if on the server) what can be claimed.
 *
 * Arguments:
 * 0: Bodybag <OBJECT>
 * 1: Returner <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call tac_apollo_fnc_bodybagReturn
 *
 * Public: No
 */

params ["_bodybag", "_returner"];

if (isNull _bodybag || {_bodybag getVariable ["tac_bodybag_busy", false]}) exitWith {};
_bodybag setVariable ["tac_bodybag_busy", true, true];

private _ownerUID = _bodybag getVariable ["tac_bodybag_ownerUID", ""];
private _ownerName = _bodybag getVariable ["tac_bodybag_ownerName", ""];
private _deathKey = _bodybag getVariable ["tac_bodybag_deathKey", ""];
private _record = _bodybag getVariable ["tac_bodybag_contents", createHashMap];

// Count the bag, containers in it included
private _counts = createHashMap;
private _fnc_add = {
    params ["_cargo"];
    _cargo params ["_classes", "_amounts"];
    {
        private _class = toLowerANSI _x;
        _counts set [_class, (_counts getOrDefault [_class, 0]) + (_amounts select _forEachIndex)];
    } forEach _classes;
};
{
    [getItemCargo _x] call _fnc_add;
    [getWeaponCargo _x] call _fnc_add;
    [getMagazineCargo _x] call _fnc_add;
    [getBackpackCargo _x] call _fnc_add;
} forEach ([_bodybag] + ((everyContainer _bodybag) apply {_x select 1}));

// Only what went into the bag (items stuffed in on the way are deleted with it)
private _contents = [];
{
    private _count = _y min (_record getOrDefault [_x, 0]);
    if (_count > 0) then {
        _contents pushBack [_x, _count];
    };
} forEach _counts;

private _reply = ["bodybagReturn", _ownerUID, _deathKey, getPlayerUID _returner, _contents] call FUNC(callServerExt);
private _parsed = parseSimpleArray ([_reply, "[]"] select (_reply == "error"));
_parsed params [["_result", "error"], ["_name", _ownerName], ["_returnable", 0], ["_lost", []]];
TRACE_2("Bodybag Return",_ownerUID,_reply);

private _owner = (allPlayers select {getPlayerUID _x == _ownerUID}) param [0, objNull];
private _text = switch (_result) do {
    case "ok": {
        private _lostText = (_lost apply {format ["%1x %2 (%3)", _x select 1, _x select 0, _x select 2]}) joinString ", ";
        format [localize LSTRING(BodybagSent), _name, _returnable, [_lostText, "-"] select (_lostText == "")]
    };
    case "already": {format [localize LSTRING(BodybagAlready), _name]};
    case "gone": {format [localize LSTRING(BodybagGone), _name]};
    case "error": {
        _bodybag setVariable ["tac_bodybag_busy", false, true];
        localize ([LSTRING(BodybagFailed), LSTRING(BodybagRespawn)] select ((_parsed param [1, ""]) == "respawn"))
    };
};

if (_result != "error") then {
    deleteVehicle _bodybag;
    if (!isNull _owner && {_owner != _returner}) then {
        _text remoteExecCall ["hint", _owner];
    };
};
_text remoteExecCall ["hint", _returner];
