#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Sets up the Kits view: the player's kits (prepared on the website) in the dropdown, the selected kit's items in the list.
 *
 * Arguments:
 * 0: Kit index to select <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_armory_fnc_dialogControl_kits
 *
 * Public: No
 */

params [["_select", 0]];
GVAR(selectedCategory) = "kits";
call FUNC(hideMessage);

{
    ctrlShow [_x, true];
} forEach [DROPDOWN, NLIST];
{
    ctrlShow [_x, false];
} forEach [AMOUNT, DROPDOWNAMOUNT, TAKESTASHFRAME, TAKESTASHBTN, STASHALLFRAME, STASHALLBTN];

GVAR(kits) = [];
if (GVAR(system) == 1) then {
    if !(["tac_apollo"] call ACEFUNC(common,isModLoaded)) exitWith {
        ERROR_MSG("Apollo is not loaded! Chronos data cannot be retrieved.");
    };
    private _result = ["loadKits", [getPlayerUID player, EGVAR(apollo,liveApi)]] call EFUNC(apollo,callExt);
    if (isNil "_result") exitWith {
        ERROR("Kits failed to load!");
        GVAR(kits) = nil;
    };
    TRACE_1("Kits",_result);
    GVAR(kits) = _result;
};

lbClear DROPDOWN;
lnbClear NLIST;
if (isNil QGVAR(kits)) exitWith {
    GVAR(kits) = [];
    ctrlShow [DROPDOWN, false];
    [LLSTRING(MsgOffline), [LLSTRING(MsgOfflineText), LLSTRING(MsgOfflineHelp), LLSTRING(MsgContactStaff)]] call FUNC(showMessage);
};
if (GVAR(kits) isEqualTo []) exitWith {
    ctrlShow [DROPDOWN, false];
    [LLSTRING(MsgNoKits), [LLSTRING(MsgNoKitsText), LLSTRING(MsgNoKitsWhere)]] call FUNC(showMessage);
};

{
    _x params ["", "_name", "_ready", "_items"];
    private _missing = 0;
    {
        _x params ["", "_quantity", "_inLocker"];
        _missing = _missing + ((_quantity - _inLocker) max 0);
    } forEach _items;
    private _status = [format [LLSTRING(KitMissing), _missing], LLSTRING(KitReady)] select _ready;
    lbAdd [DROPDOWN, format ["%1 (%2)", _name, _status]];
    lbSetTooltip [DROPDOWN, _forEachIndex, _name];
} forEach GVAR(kits);

lbSetCurSel [DROPDOWN, (_select min (count GVAR(kits) - 1)) max 0]; // will not fire onLBSelChanged
call FUNC(dialogControl_kitItems);
