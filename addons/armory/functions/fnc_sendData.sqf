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
private _typeChronos = if (_type == "stash") then {"put"} else {"remove"};

private _selectedItem = lnbData [NLIST, [lnbCurSelRow NLIST, 1]]; // ClassName
private _selectedAmount = lbText [DROPDOWNAMOUNT, lbCurSel CTRL(DROPDOWNAMOUNT)]; // Quantity
private _object = ACE_player getVariable [QGVAR(object), objNull];

TRACE_3("Send data",_type,_selectedItem,_selectedAmount);

// Exit if any variable is not set
if (_selectedItem == "" || _selectedAmount == "") exitWith {
    ACE_LOGERROR_2("Send data called with empty variables! Item: %1, Amount: %2",_selectedItem,_selectedAmount);
};
if (isNull _object) exitWith {
    ACE_LOGERROR("Object is nil");
};

// Prevent stashing weapons with attachments or magazines and uniforms/vests/backpacks with contents
if (_type == "stash") then {
    if ([_selectedItem] call FUNC(containsItems)) exitWith {};
};

// Prevent taking if container is full
if (_type == "take" && {!(_object canAdd _selectedItem)}) exitWith {
    hintSilent localize LSTRING(Notification_ContainerFull);
};

// @todo - change to ACE Events (in Apollo as well)
if (GVAR(system) == 1) then {
    lockerAction = [player, _typeChronos, _object, _selectedItem, _selectedAmount];
    publicVariableServer "lockerAction";
};

// Update list
[[GVAR(armoryData), _selectedItem, _selectedAmount] call FUNC(subtractData)] call FUNC(dialogControl_populateList);
call FUNC(dialogControl_amountSelection);
call FUNC(dialogControl_takestash);
