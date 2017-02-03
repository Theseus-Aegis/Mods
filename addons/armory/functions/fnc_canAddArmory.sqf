/*
 * Author: Jonpas
 * Checks if armory can be added to the object (object has inventory).
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Can Add Armory <BOOL>
 *
 * Example:
 * [object] call tac_armory_fnc_canAddArmory
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

private _objectClass = typeOf _object;
private _config = configFile >> "CfgVehicles" >> _objectClass;

if (getNumber (_config >> "transportMaxBackpacks") == 0 ||
    {getNumber (_config >> "transportMaxMagazines") == 0} ||
    {getNumber (_config >> "transportMaxWeapons") == 0}
) exitWith {
    WARNING_1("Armory cannot be added to an object without inventory. Object classname: %1",_objectClass);
};

if (isClass (_config >> "ACE_Actions" >> "ACE_MainActions" >> QGVAR(Open))) then {
    _object setVariable [QGVAR(enabled), true];
};

!(_object getVariable [QGVAR(enabled), false])
