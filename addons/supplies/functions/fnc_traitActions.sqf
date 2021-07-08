#include "script_component.hpp"
/*
 * Author: JoramD
 * Add interactions for traits.
 * Currently supports types "medic" and "engineer".
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, "type"] call tac_supplies_fnc_traitActions
 *
 * Public: No
 */

params ["_object", "_type"];

private _removeTraitsAction = [
    QGVAR(removeTraits),
    LLSTRING(RemoveTraits),
    "",
    {
        params ["", "_player"];

        {
            _player setUnitTrait [_x, false];
            [QGVAR(storeTraits), [getPlayerUID _player, nil]] call CBA_fnc_serverEvent;
        } forEach ["Medic", "Engineer", "ExplosiveSpecialist", "UavHacker"];
    },
    {
        params ["", "_player"];

        (_player getUnitTrait "Medic") || {_player getUnitTrait "Engineer"};
    }
] call ACEFUNC(interact_menu,createAction);

[_object, 0, ["ACE_MainActions"], _removeTraitsAction] call ACEFUNC(interact_menu,addActionToObject);

private _traitAction = [
    format [QGVAR(%1_Trait), _x],
    format [LLSTRING(TraitInteraction), _x],
    "",
    {
        params ["", "_player"];
        (_this select 2) params ["_type"];

        [QGVAR(storeTraits), [getPlayerUID _player, _type]] call CBA_fnc_serverEvent;

        private _traits = [_type];
        if (_type isEqualTo "engineer") then {
            traits = ["Engineer", "ExplosiveSpecialist", "UavHacker"]
        };
        {_player setUnitTrait _x} forEach _traits;
    },
    {
        params ["", "_player"];
        (_this select 2) params ["_type"];

        private _trainings = [
            ["getTrainingIdentifiers", _player],
            EFUNC(apollo,getPlayerInfo),
            _player,
            "tac_trainingIdentifiers",
            60
        ] call ACEFUNC(common,cachedCall);

        if (_type isEqualTo "engineer") then {
            _type = "demolitions";
        };
        toLower (typeOf _this) in GVAR(traitsBlacklist) && {!EGVAR(apollo,enabled)} && {_type in _trainings};
    },
    {},
    _type
] call ACEFUNC(interact_menu,createAction);

[_object, 0, ["ACE_MainActions"], _traitAction] call ACEFUNC(interact_menu,addActionToObject);
