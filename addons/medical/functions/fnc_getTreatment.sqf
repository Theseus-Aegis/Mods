#include "..\script_component.hpp"
/*
 * Author: Mike
 * Returns a number for treatment type
 *
 * Arguments
 * 0: Classname <STRING>
 *
 * Return Value:
 * 0: Treatment Type <NUMBER>
 *
 * Example:
 * [] call tac_medical_fnc_getTreatment
*/

params ["_classname"];

if (_classname in MACRO_BANDAGES) exitWith {0};
if (_classname == "CheckPulse") exitWith {1};
if (_classname in MACRO_IVS) exitWith {2};
if (_classname == "SurgicalKit") exitWith {3};
if (_classname == "CheckBloodPressure") exitWith {4};
if (_classname == "Splint") exitWith {5};
if (_classname == "ApplyTourniquet") exitWith {6};
if (_classname == "RemoveTourniquet") exitWith {7};
if (_classname == "Painkillers") exitWith {8};
if (_classname == "CPR") exitWith {9};
if (_classname in MACRO_INJECTORS) exitWith {10};

11
