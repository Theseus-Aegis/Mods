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

[_object, _medicalItems, true] call ACEFUNC(arsenal,addVirtualItems);

private _action = [
    QGVAR(medicalArsenal),
    LLSTRING(MedicalArsenal)
    "",
    {
        params ["_target", "_player"];

        [_target, _player, false] call ACEFUNC(arsenal,openBox);
    },
    {
        params ["_target", "_player"];

        if ("NCO" in (typeOf _target)) then {
            _player getUnitTrait "Medic"
        } else {
            private _trainings = [
                ["getTrainingIdentifiers", _player],
                EFUNC(apollo,getPlayerInfo),
                _player,
                "tac_trainingIdentifiers",
                60
            ] call ACEFUNC(common,cachedCall);

            // Has required training
            "medic" in _trainings
        };
    }
] call ACEFUNC(interact_menu,createAction);

[_object, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
