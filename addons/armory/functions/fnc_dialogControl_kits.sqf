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

{
    ctrlShow [_x, true];
} forEach [DROPDOWN, NLIST];
{
    ctrlShow [_x, false];
} forEach [AMOUNT, DROPDOWNAMOUNT, TAKESTASHPIC, TAKESTASHBTN];

GVAR(kits) = [];
if (GVAR(system) == 1) then {
    if !(["tac_apollo"] call ACEFUNC(common,isModLoaded)) exitWith {
        ERROR_MSG("Apollo is not loaded! Chronos data cannot be retrieved.");
    };
    private _result = ["loadKits", [getPlayerUID player, EGVAR(apollo,liveApi)]] call EFUNC(apollo,callExt);
    if (isNil "_result") exitWith {
        ERROR("Kits failed to load!");
        [LSTRING(ChronosError), 2.5] call ACEFUNC(common,displayTextStructured);
    };
    TRACE_1("Kits",_result);
    GVAR(kits) = _result;
};

lbClear DROPDOWN;
{
    _x params ["", "_name", "_ready", "_items"];
    private _missing = 0;
    {
        _x params ["", "_quantity", "_inLocker"];
        _missing = _missing + ((_quantity - _inLocker) max 0);
    } forEach _items;
    private _status = [format [localize LSTRING(KitMissing), _missing], localize LSTRING(KitReady)] select _ready;
    lbAdd [DROPDOWN, format ["%1 (%2)", _name, _status]];
    lbSetTooltip [DROPDOWN, _forEachIndex, _name];
} forEach GVAR(kits);

if (GVAR(kits) isEqualTo []) then {
    lbAdd [DROPDOWN, localize LSTRING(NoKits)];
};

lbSetCurSel [DROPDOWN, (_select min (count GVAR(kits) - 1)) max 0]; // will not fire onLBSelChanged
call FUNC(dialogControl_kitItems);
