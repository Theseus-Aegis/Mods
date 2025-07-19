#include "..\script_component.hpp"
/*
 * Author: JoramD
 * Load traits based on trainings on the website via Chronos.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call tac_supplies_fnc_loadTraits
 *
 * Public: No
 */

params ["_player"];

if (!EGVAR(apollo,enabled)) exitWith {};

private _trainings = ["getTrainingIdentifiers", _player] call EFUNC(apollo,getPlayerInfo);

// Disabled due to new medical setup.
/*
if ("medic" in _trainings) then {
    _player setUnitTrait ["Medic", true];
};
*/

if ("engineer" in _trainings) then {
    {
        _player setUnitTrait [_x, true];
    } forEach ["Engineer", "ExplosiveSpecialist", "UavHacker"];
};
