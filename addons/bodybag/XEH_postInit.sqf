#include "script_component.hpp"

// Exit on clients and non-hosts
if (!isServer) exitWith {};

["placedInBodyBag", {
    // Move all inventory from body to bodybag
    _this call FUNC(moveInventory);

    // Replace dropped primary weapon and launcher
    _this call FUNC(placeDroppedWeapons);
}] call ACE_Common_fnc_addEventHandler;
