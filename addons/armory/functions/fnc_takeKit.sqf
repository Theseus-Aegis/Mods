#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Takes the selected kit from the locker into the box (Apollo / Chronos): of each item as many as the locker has.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_armory_fnc_takeKit
 *
 * Public: No
 */

private _kit = GVAR(kits) param [lbCurSel DROPDOWN, []];
_kit params [["_kitID", -1], ["_name", ""], "", ["_items", []]];
private _object = ACE_player getVariable [QGVAR(object), objNull];

if (_kitID isEqualTo -1 || {_items isEqualTo []}) exitWith {};
if (isNull _object) exitWith {
    ERROR("Object is nil");
};

// What the locker lacks (taken anyway: whatever it has)
private _missing = [];
{
    _x params ["_className", "_quantity", "_inLocker"];
    if (_inLocker < _quantity) then {
        private _displayName = getText ((_className call CBA_fnc_getItemConfig) >> "displayName");
        if (_displayName == "") then { _displayName = getText ((_className call CBA_fnc_getObjectConfig) >> "displayName"); };
        if (_displayName == "") then { _displayName = _className; };
        _missing pushBack format ["%1x %2", _quantity - _inLocker, _displayName];
    };
} forEach _items;

TRACE_3("Take kit",_kitID,_name,_missing);
[QEGVAR(apollo,lockerTakeKit), [player, _object, str _kitID]] call CBA_fnc_serverEvent;

{
    ctrlShow [_x, false];
} forEach [TAKESTASHFRAME, TAKESTASHBTN]; // until the kits are refreshed (lockerKitTaken)

if (_missing isEqualTo []) then {
    [format [LLSTRING(KitTaking), _name], 2.5] call ACEFUNC(common,displayTextStructured);
} else {
    [LLSTRING(MsgKitIncomplete), [format [LLSTRING(MsgKitIncompleteText), _name]] + _missing, true, "kits"] call FUNC(showMessage);
};
