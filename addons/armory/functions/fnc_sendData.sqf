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

local _selectedItem = lnbData [NLIST, [lnbCurSelRow NLIST, 1]]; // ClassName
local _selectedAmount = lbText [DROPDOWNAMOUNT, lbCurSel CTRL(DROPDOWNAMOUNT)]; // Quantity
local _object = ACE_player getVariable [QGVAR(object), objNull];

TRACE_3("Send data",_type,_selectedItem,_selectedAmount);

// Exit if any variable is not set
if (_selectedItem == "" || _selectedAmount == "") exitWith {
    ACE_LOGERROR_2("Send data called with empty variables! Item: %1, Amount: %2",_selectedItem,_selectedAmount);
};
if (isNull _object) exitWith {
    ACE_LOGERROR("Object is nil");
};

local _exit = false;
// Prevent taking if is weapon with attachments
if (([_selectedItem] call ACE_Common_fnc_getItemType) select 0 == "weapon") then {
    {
        if (_x select 0 == _selectedItem) then {
            for "_i" from 1 to ((count _x) - 1) do {
                if !(_i isEqualTo "") exitWith {
                    hintSilent "Weapon must be without Attachments and Magazines for stashing!";
                    _exit = true;
                };
            };
        };
    } forEach (weaponsItems _object);
};

if (_exit) exitWith {};

// @todo - change to ACE Events (in Apollo as well)
if (GVAR(system) == 1) then {
    lockerAction = [player, _type, _object, _selectedItem, _selectedAmount];
    publicVariableServer "lockerAction";
};

// Update list
[[GVAR(armoryData), _selectedItem, _selectedAmount] call FUNC(subtractData)] call FUNC(dialogControl_populateList);
call FUNC(dialogControl_amountSelection);
call FUNC(dialogControl_takestash);
