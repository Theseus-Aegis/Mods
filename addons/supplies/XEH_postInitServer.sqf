#include "script_component.hpp"

GVAR(playerTraits) = createHashMap;

[QGVAR(storeTraits), {
    params ["_uid", "_trait"];
    GVAR(playerTraits) set [_uid, _trait];
}] call CBA_fnc_addEventHandler;

[QGVAR(loadTraits), {
    params ["_player"];

    private _type = GVAR(playerTraits) getOrDefault [getPlayerUID _player, ""];
    if (_type isEqualTo "") exitWith {};
    if (toLower (typeOf _player) in (GVAR(traitsBlacklist) apply {toLower _x})) exitWith {};

    INFO_2("Restoring trait '%1' for '%2'",_type,name _player);
    private _traits = [_type];
    if (_type isEqualTo "Engineer") then {
        _traits = ["Engineer", "ExplosiveSpecialist", "UavHacker"];
    };
    {
        [QGVAR(setTraits), [_player, _x], _player] call CBA_fnc_targetEvent;
    } forEach _traits;
}] call CBA_fnc_addEventHandler;
