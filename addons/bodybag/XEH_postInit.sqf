#include "script_component.hpp"

// "Return to owner" on bodybags at base: sent to the website (Apollo), where the owner claims the items
if (hasInterface) then {
    private _action = [
        QGVAR(returnToOwner),
        localize LSTRING(ReturnToOwner),
        "",
        {[QUOTE(tac_apollo_bodybagReturn), [_target, _player]] call CBA_fnc_serverEvent},
        {[_target] call FUNC(canReturnToOwner)},
        {},
        [],
        [0, 0, 0],
        3,
        [false, false, false, false, false],
        {
            params ["_target", "", "", "_actionData"];
            _actionData set [1, format [localize LSTRING(ReturnToOwnerName), _target getVariable [QGVAR(ownerName), ""]]];
        }
    ] call ACEFUNC(interact_menu,createAction);
    ["ACE_bodyBagObject", 0, ["ACE_MainActions"], _action, true] call ACEFUNC(interact_menu,addActionToClass);
};

// Exit on clients and non-hosts
if (!isServer) exitWith {};

["ace_placedInBodyBag", {
    // Move all inventory from body to bodybag
    _this call FUNC(moveInventory);
}] call CBA_fnc_addEventHandler;
