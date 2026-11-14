#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Lists the selected kit's items: name and "in locker / in kit" (short ones in red).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_armory_fnc_dialogControl_kitItems
 *
 * Public: No
 */

lnbClear NLIST;
private _kit = GVAR(kits) param [lbCurSel DROPDOWN, []];
_kit params [["_kitID", -1], "", "", ["_items", []]];

{
    _x params ["_className", "_quantity", "_inLocker"];

    private _configCfg = configName (configHierarchy (_className call CBA_fnc_getItemConfig) param [1, configNull]);
    if (_configCfg == "") then {
        _configCfg = configName (configHierarchy (_className call CBA_fnc_getObjectConfig) param [1, configNull]);
    };

    private _displayName = _className;
    private _picture = "";
    if (_configCfg != "") then {
        _displayName = getText (configFile >> _configCfg >> _className >> "displayName");
        _picture = getText (configFile >> _configCfg >> _className >> "picture");
    };
    private _tooltip = _displayName;
    if (count _displayName > DISPLAYNAME_LENGTH + 3) then {
        _displayName = [[_displayName, 0, DISPLAYNAME_LENGTH] call CBA_fnc_substr] call CBA_fnc_rightTrim;
        _displayName = [_displayName, "..."] joinString "";
    };

    private _row = lnbAddRow [NLIST, ["", _displayName, format ["%1/%2", _inLocker min _quantity, _quantity]]];
    lbSetTooltip [NLIST, _row * 3, _tooltip];
    lnbSetData [NLIST, [_row, 1], _className];
    lnbSetPicture [NLIST, [_row, 0], _picture];
    if (_inLocker < _quantity) then {
        lnbSetColor [NLIST, [_row, 2], [1, 0.35, 0.35, 1]];
    };
} forEach _items;

call FUNC(dialogControl_takestash);
