#include "..\script_component.hpp"
/*
 * Author: Mike
 * Creates a battlefield memorial with chosen helmet and weapon. Redone with global commands as BI didn't bother.
 * Position can be an object or a position array (posATL)
 * Helmet and Weapon should be classnames as strings.
 *
 * Call on the server only.
 *
 * Arguments
 * 0: Position <OBJECT / ARRAY>
 * 1: Direction <NUMBER>
 * 2: Helmet <STRING>
 * 3: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call MFUNC(battlefieldMemorial)
*/

params ["_position", "_direction", "_helmet", "_weapon"];

if (!isServer) exitWith {};

// Handle Object or Array for position.
if (_position isEqualType "OBJECT") then {
    _position = getPosATL _position;
};

// Error checking
if (!_helmet isEqualType "STRING") exitWith {
    ERROR_MSG_1("Invalid input (%1) expected classname as string.",_helmet)
};
if (!_weapon isEqualType "STRING") exitWith {
    ERROR_MSG_1("Invalid input (%1) expected classname as string.",_weapon)
};

private _memorial = createVehicle ["Land_BattlefieldCross_01_NATO_F", _position, [], 0, "CAN_COLLIDE"];
_memorial setDir _direction;

clearItemCargoGlobal _memorial;
clearWeaponCargoGlobal _memorial;

// Disable Actions globally
_memorial setVariable ["bin_battlefieldCross_disableAction", true, true];

// Add Objects
_memorial addItemCargoGlobal [_helmet, 1];
_memorial addWeaponCargoGlobal [_weapon, 1];
