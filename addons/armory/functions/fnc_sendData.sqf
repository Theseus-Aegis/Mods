/*
 * Author: Jonpas
 * Prepares and sends data back to Apollo (Chronos).
 *
 * Arguments:
 * 0: Take/Stash <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["type"] call tac_armory_fnc_sendData
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_type"];

// Because David likes different variables (stash == put == stash/put into locker from box, remove == take == take/remove from locker to box)
_type = if (_type == "stash") then {"put"} else {"remove"};

private _selectedItem = lnbData [NLIST, [lnbCurSelRow NLIST, 1]]; // ClassName
private _selectedAmount = lbText [DROPDOWNAMOUNT, lbCurSel CTRL(DROPDOWNAMOUNT)]; // Quantity

TRACE_3("Send data",_type,_selectedItem,_selectedAmount);

// Exit if any variable is not set
if (_selectedItem == "" || _selectedAmount == "") exitWith {
    ACE_LOGERROR_2("Send data called with empty variables! Item: %1, Amount: %2",_selectedItem,_selectedAmount);
};

// @todo - change to ACE Events (in Apollo as well)
if ((!isNil "ChronosLoaded" && {ChronosLoaded == "true"}) || {CHRONOS_DEBUG}) then {
    lockerAction = [player, _type, GVAR(box), _selectedItem, _selectedAmount];
    publicVariableServer "lockerAction";
};

// Update list
[[GVAR(armoryData), _selectedItem, _selectedAmount] call FUNC(subtractData)] call FUNC(dialogControl_populateList);
call FUNC(dialogControl_amountSelection);
call FUNC(dialogControl_takestash);
