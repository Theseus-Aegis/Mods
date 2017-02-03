/*
 * Author: Jonpas
 * Open Armory on an object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, player] call tac_armory_fnc_openArmory
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

// Prevent others using the same Armory object
_object setVariable [QGVAR(inUse), true, true];

// Set varaible for later reference
ACE_player setVariable [QGVAR(object), _object, true];

// Create display and load main menu
createDialog QGVAR(Display);
["main"] call FUNC(dialogControl);


#ifdef ADD_DEBUG_ITEMS
if !((_object getVariable [QGVAR(armoryData), []]) isEqualTo []) exitWith {};

private _itemsData = [
    // Rifles
    ["rifle", "arifle_MX_F", "Assault Rifle", "Blabla, this item, blabla", 23],
    ["rifle", "srifle_DMR_01_F", "Marksman Rifle", "Blabla, this item, blabla", 4],
    ["rifle", "srifle_EBR_F", "Marksman Rifle", "Blabla, this item, blabla", 5],
    ["rifle", "arifle_Katiba_GL_F", "Assault Rifle", "Blabla, this item, blabla", 45],
    ["rifle", "arifle_Mk20C_plain_F", "Assault Rifle", "Blabla, this item, blabla", 18],
    ["rifle", "arifle_Mk20C_plain_F", "Assault Rifle", "Blabla, this item, blabla", 20],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    ["rifle", "arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", 33],
    // Ammo
    ["ammo", "30Rnd_65x39_caseless_mag", "Magazine", "Blabla, this item, blabla", 333],
    ["ammo", "100Rnd_65x39_caseless_mag", "Magazine", "Blabla, this item, blabla", 123],
    ["ammo", "NLAW_F", "Missile", "Blabla, this item, blabla", 7],
    ["ammo", "1Rnd_HE_Grenade_shell", "Shell", "Blabla, this item, blabla", 19],
    ["ammo", "SmokeShellBlue", "Shell", "Blabla, this item, blabla", 15],
    // Items
    ["item", "NVGoggles", "Headgear", "Blabla, this item, blabla", 23],
    ["item", "Laserdesignator", "Item", "Blabla, this item, blabla", 7],
    ["item", "ItemGPS", "Item", "Blabla, this item, blabla", 5],
    ["item", "MediKit", "Item", "Blabla, this item, blabla", 2],
    ["item", "ToolKit", "Item", "Blabla, this item, blabla", 18],
    ["item", "B_UavTerminal", "Item", "Blabla, this item, blabla", 20],
    // Attachments
    ["attachment", "optic_Hamr", "Optic", "Blabla, this item, blabla", 4],
    ["attachment", "optic_Aco", "Optic", "Blabla, this item, blabla", 45],
    ["attachment", "optic_DMS", "Optic", "Blabla, this item, blabla", 33],
    ["attachment", "muzzle_snds_93mmg", "Muzzle", "Blabla, this item, blabla", 6],
    ["attachment", "muzzle_snds_H", "Muzzle", "Blabla, this item, blabla", 13],
    ["attachment", "optic_MRD", "Optic", "Blabla, this item, blabla", 1],
    // Wearables
    ["wearable", "G_Bandanna_Shades", "Goggles", "Blabla, this item, blabla", 4]//,
    //["wearable", "Unknown_Class", "Goggles", "Blabla, this item, blabla", 12]
];

{
    _itemsData pushBack ["insignia", configName _x, "Insignia", "This item is an insignia", 1];
} forEach ("true" configClasses (configFile >> "CfgUnitInsignia"));

private _return = [_object, _itemsData] call FUNC(addItems);
TRACE_1("Debug items add",_return);
#endif
