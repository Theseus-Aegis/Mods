#include "script_component.hpp"
/*
 * Author: JoramD
 * Add medical arsenal to object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call tac_supplies_fnc_medicalArsenal
 *
 * Public: No
 */

params ["_object"];

if (local _object) exitWith {};

private _medicalItems = [
    "ACE_packingBandage",
    "ACE_elasticBandage",
    "ACE_fieldDressing",
    "ACE_bloodIV",
    "ACE_bloodIV_250",
    "ACE_bloodIV_500",
    "ACE_bodyBag",
    "ACE_epinephrine",
    "ACE_morphine",
    "tac_medical_painkillers",
    "ACE_plasmaIV",
    "ACE_plasmaIV_250",
    "ACE_plasmaIV_500",
    "ACE_salineIV",
    "ACE_salineIV_250",
    "ACE_salineIV_500",
    "ACE_splint",
    "ACE_surgicalKit",
    "ACE_tourniquet",
    "ACE_adenosine",
    "ACE_quikclot"
];

[_object, _medicalItems, true] call ace_arsenal_fnc_initBox;
