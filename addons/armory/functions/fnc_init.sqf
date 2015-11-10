/*
 * Author: Jonpas
 * Adds the Armory action to an Object and handles the GUI initialization.
 *
 * Arguments:
 * Object <OBJECT/ARRAY> (Optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [box] call tac_armory_fnc_init
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_object", this]];

// Check if object has inventory
local _config = configFile >> "CfgVehicles" >> typeOf _object;

if (getNumber (_config >> "transportMaxBackpacks") isEqualTo 0 ||
    {getNumber (_config >> "transportMaxMagazines") isEqualTo 0} ||
    {getNumber (_config >> "transportMaxWeapons") isEqualTo 0}
) exitWith {
    ACE_LOGWARNING_1("Aborted adding Armory to an object without inventory. Object classname: %1",typeOf _object);
};

// Add action
local _armoryAction = [
    QGVAR(OpenAction),
    localize LSTRING(Open),
    "",
    {
        GVAR(box) = _this select 2; // Set global variable for later reference
        createDialog QGVAR(Display);
        ["main"] call FUNC(dialogControl);
    },
    {true},
    {},
    _object
] call ACE_Interact_Menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _armoryAction] call ACE_Interact_Menu_fnc_addActionToObject;
