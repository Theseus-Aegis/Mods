#include "..\script_component.hpp"
/*
 * Author: Cyruz, Mike
 * Displays an on-screen message when receiving treatment.
 *
 * Called locally per player via target event.
 *
 * Arguments
 * 0: Medic <OBJECT>
 * 1: Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_medical_fnc_medicalMessage
*/

params ["_medic", "_classname"];

if !(GVAR(enableMedicalMessages)) exitWith {};

private _name = [_medic] call ACEFUNC(common,getName);
private _text = "";

private _treatmentType = [_classname] call FUNC(getTreatment);

switch (_treatmentType) do {
    case 0: {
        _text = format ["%1 is bandaging you.", _name];
    };
    case 1: {
        _text = format ["%1 checked your pulse.", _name];
    };
    case 2: {
        _text = format ["%1 gave you an IV.", _name];
    };
    case 3: {
        _text = format ["You are being stitched by %1.", _name];
    };
    case 4: {
        _text = format ["%1 checked your blood pressure.", _name];
    };
    case 5: {
        _text = format ["%1 applied a splint.", _name];
    };
    case 6: {
        _text = format ["%1 applied a tourniquet.", _name];
    };
    case 7: {
        _text = format ["%1 removed a tourniquet.", _name];
    };
    case 8: {
        _text = format ["%1 force-fed you painkillers.", _name];
    };
    case 9: {
        _text = format ["%1 performed CPR.", _name];
    };
    case 10: {
        _text = format ["%1 gave you an injection.", _name];
    };
    case 11: {
        _text = "This should not be here, or happening."};
};

cutText [format ["<br/><br/><br/><br/><br/><br/><t color = '#FFFFFF' size = '1.5'>%1</t>", _text], "PLAIN", 1, true, true];
