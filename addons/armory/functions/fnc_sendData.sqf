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
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_type"];

private ["_selectedItem", "_selectedAmount"];
_selectedItem = lnbData [NLIST, [lnbCurSelRow NLIST, 1]]; // ClassName
_selectedAmount = lbText [DROPDOWNAMOUNT, lbCurSel CTRL(DROPDOWNAMOUNT)]; // Quantity

TRACE_2("Send data",_selectedItem,_selectedAmount);

// Exit if any variable is not set
if (_selectedItem == "" || _selectedAmount == "") exitWith {diag_log "[ERROR] Armory: Send data called with empty variables"};

// @todo - change to ACE Events (in Apollo as well)
lockerAction = [player, _type, GVAR(box), _selectedItem, _selectedAmount];
publicVariableServer "lockerAction";

// Update list
[[GVAR(armoryData), _selectedItem, _selectedAmount] call FUNC(subtractData)] call FUNC(dialogControl_populateList);
call FUNC(dialogControl_amountSelection);
call FUNC(dialogControl_takestash);
