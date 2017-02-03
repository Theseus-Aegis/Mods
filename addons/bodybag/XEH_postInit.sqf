#include "script_component.hpp"

// Exit on clients and non-hosts
if (!isServer) exitWith {};

["ace_placedInBodyBag", {
    // Move all inventory from body to bodybag
    _this call FUNC(moveInventory);
}] call CBA_fnc_addEventHandler;
