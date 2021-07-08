#include "script_component.hpp"

GVAR(playerTraits) = createHashMap;

[QGVAR(storeTraits), {
    GVAR(playerTraits) set [_this];
}] call CBA_fnc_addEventHandler;

[QGVAR(loadTraits), {
    private _type = GVAR(playerTraits) getOrDefault [getPlayerUID _this, ""];
    if (toLower (typeOf _this) in GVAR(traitsBlacklist)) exitWith {};

    private _traits = [_type];
    if (_type isEqualTo "engineer") then {
        traits = ["Engineer", "ExplosiveSpecialist", "UavHacker"]
    };
    {_this setUnitTrait _x} forEach _traits;
}] call CBA_fnc_addEventHandler;
