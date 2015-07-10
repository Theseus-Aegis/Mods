/*
 * Author: Jonpas
 * Gets data from Apollo (Chronos) or uses hard-coded.
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

PARAMS_1(_selectedCategory);

private ["_subCategories", "_armoryData"];

_subCategories = [];
_armoryData = [];

//ChronosLoaded = "true";//debug Chronos

// Get data from Chronos if available, otherwise set hard-coded data
if (!isNil "ChronosLoaded" && {ChronosLoaded == "true"}) then {
    hintSilent "Retrieving Armory, please stand by ...";

    // Call Chronos for Data
    _armoryData = [player, _selectedCategory] call usec_fnc_fetchArmory;
    TRACE_1("Armory data Apollo",_armoryData);
} else {
    // Rifles
    if (_selectedCategory == "rifle") then {
        _armoryData = [
            // Classname, Subcategory, Description, Quantity
            ["arifle_MX_F", "Assault Rifle", "Blabla, this item, blabla", "5"],
            ["arifle_MX_F", "Assault Rifle", "Blabla, this item, blabla", "5"],
            ["arifle_MX_F", "Assault Rifle", "Blabla, this item, blabla", "5"],
            ["arifle_MX_F", "Assault Rifle", "Blabla, this item, blabla", "5"],
            ["arifle_MX_F", "Shotgun", "Blabla, this item, blabla", "5"],
            ["arifle_MX_F", "Shotgun", "Blabla, this item, blabla", "5"],
            ["arifle_MX_F", "Shotgun", "Blabla, this item, blabla", "5"],
            ["arifle_MX_F", "Shotgun", "Blabla, this item, blabla", "5"],
            ["arifle_MX_F", "Shotgun", "Blabla, this item, blabla", "5"]
        ];
    };

    if (_selectedCategory == "ammo") then {
        _armoryData = [
            // Classname, Subcategory, Description, Quantity
            ["30Rnd_65x39_caseless_mag", "Magazine", "Blabla, this item, blabla", "5"],
            ["30Rnd_65x39_caseless_mag", "Magazine", "Blabla, this item, blabla", "5"],
            ["30Rnd_65x39_caseless_mag", "Magazine", "Blabla, this item, blabla", "5"],
            ["100Rnd_65x39_caseless_mag", "Magazine", "Blabla, this item, blabla", "5"],
            ["100Rnd_65x39_caseless_mag", "Magazine", "Blabla, this item, blabla", "5"],
            ["NLAW_F", "Missile", "Blabla, this item, blabla", "5"],
            ["NLAW_F", "Missile", "Blabla, this item, blabla", "5"],
            ["rhsusf_5Rnd_00Buck", "Buck", "Blabla, this item, blabla", "5"],
            ["rhsusf_5Rnd_00Buck", "Buck", "Blabla, this item, blabla", "5"]
        ];
    };
};

_armoryData
