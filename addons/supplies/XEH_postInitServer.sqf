#include "script_component.hpp"

GVAR(playerTraits) = createHashMap;

[QGVAR(storeTraits), {
    GVAR(playerTraits) set _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(loadTraits), {
    private _type = GVAR(playerTraits) getOrDefault [getPlayerUID _this, ""];
    if (_type isEqualTo "" || {typeOf _this in GVAR(traitsBlacklist)}) exitWith {};

    LOG_1("Restoring trait(s) for %1", name _this);
    private _traits = [_type];
    if (_type isEqualTo "engineer") then {
        traits = ["Engineer", "ExplosiveSpecialist", "UavHacker"]
    };
    {_this setUnitTrait [_x, true]} forEach _traits;
}] call CBA_fnc_addEventHandler;
