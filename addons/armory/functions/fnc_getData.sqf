/*
 * Author: Jonpas
 * Gets preset Armory data.
 *
 * Arguments:
 * 0: Category <STRING>
 *
 * Return Value:
 * Armory Data <ARRAY>
 *
 * Example:
 * ["category"] call tac_armory_fnc_getData
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_selectedCategory"];

local _armoryData = [];

// Rifles
if (_selectedCategory == "rifle") then {
    _armoryData = [
        // Classname, Subcategory, Description, Quantity
        ["arifle_MX_F", "Assault Rifle", "Blabla, this item, blabla", "23"],
        ["srifle_DMR_01_F", "Marksman Rifle", "Blabla, this item, blabla", "4"],
        ["srifle_EBR_F", "Marksman Rifle", "Blabla, this item, blabla", "5"],
        ["arifle_Katiba_GL_F", "Assault Rifle", "Blabla, this item, blabla", "45"],
        ["arifle_Mk20C_plain_F", "Assault Rifle", "Blabla, this item, blabla", "18"],
        ["arifle_Mk20C_plain_F", "Assault Rifle", "Blabla, this item, blabla", "20"],
        ["arifle_MXC_F", "Shotgun", "Blabla, this item, blabla", "33"]
    ];
};
if (_selectedCategory == "ammo") then {
    _armoryData = [
        // Classname, Subcategory, Description, Quantity
        ["30Rnd_65x39_caseless_mag", "Magazine", "Blabla, this item, blabla", "333"],
        ["100Rnd_65x39_caseless_mag", "Magazine", "Blabla, this item, blabla", "123"],
        ["NLAW_F", "Missile", "Blabla, this item, blabla", "7"],
        ["1Rnd_HE_Grenade_shell", "Shell", "Blabla, this item, blabla", "19"],
        ["SmokeShellBlue", "Shell", "Blabla, this item, blabla", "15"]
    ];
};
if (_selectedCategory == "item") then {
    _armoryData = [
        // Classname, Subcategory, Description, Quantity
        ["NVGoggles", "Headgear", "Blabla, this item, blabla", "23"],
        ["Laserdesignator", "Item", "Blabla, this item, blabla", "7"],
        ["ItemGPS", "Item", "Blabla, this item, blabla", "5"],
        ["MediKit", "Item", "Blabla, this item, blabla", "2"],
        ["ToolKit", "Item", "Blabla, this item, blabla", "18"],
        ["B_UavTerminal", "Item", "Blabla, this item, blabla", "20"]
    ];
};
if (_selectedCategory == "attachment") then {
    _armoryData = [
        // Classname, Subcategory, Description, Quantity
        ["optic_Hamr", "Optic", "Blabla, this item, blabla", "4"],
        ["optic_Aco", "Optic", "Blabla, this item, blabla", "45"],
        ["optic_DMS", "Optic", "Blabla, this item, blabla", "33"],
        ["muzzle_snds_93mmg", "Muzzle", "Blabla, this item, blabla", "6"],
        ["muzzle_snds_H", "Muzzle", "Blabla, this item, blabla", "13"],
        ["optic_MRD", "Optic", "Blabla, this item, blabla", "1"]
    ];
};

_armoryData
