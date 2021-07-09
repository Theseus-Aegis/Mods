#include "script_component.hpp"
/*
 * Author: JoramD
 * Add interactions for traits.
 * Currently supports types "Medic" and "Engineer".
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
    format [QGVAR(%1_Trait), _type],
    format [LLSTRING(TraitInteraction), _type],
    "",
    {
        params ["", "_player"];
        (_this select 2) params ["_type"];

        [QGVAR(storeTraits), [getPlayerUID _player, _type]] call CBA_fnc_serverEvent;

        private _traits = [_type];
        if (_type isEqualTo "Engineer") then {
            _traits = ["Engineer", "ExplosiveSpecialist", "UavHacker"]
        };
        {_player setUnitTrait [_x, true]} forEach _traits;
        [QGVAR(storeTraits), [getPlayerUID _player, _type]] call CBA_fnc_serverEvent;
    },
    {
        params ["", "_player"];
        (_this select 2) params ["_type"];

        private _trainings = [
            ["getTrainingIdentifiers", _player],
            EFUNC(apollo,getPlayerInfo),
            _player,
            QGVAR(tac_trainingIdentifiers),
            60
        ] call ACEFUNC(common,cachedCall);

        if (_type isEqualTo "Engineer") then {
            _type = "demolitions";
        };
        EGVAR(apollo,enabled) && {!(_player getUnitTrait "Medic" || {_player getUnitTrait "Engineer"})} && {toLower _type in _trainings} && {!(typeOf _player in GVAR(traitsBlacklist))};
    },
    {},
    _type
] call ACEFUNC(interact_menu,createAction);

[_object, 0, ["ACE_MainActions"], _traitAction] call ACEFUNC(interact_menu,addActionToObject);
