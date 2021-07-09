#include "script_component.hpp"

GVAR(playerTraits) = createHashMap;

[QGVAR(storeTraits), {
    GVAR(playerTraits) set _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(loadTraits), {
    private _type = GVAR(playerTraits) getOrDefault [getPlayerUID _this, ""];
    if (_type isEqualTo "" || {typeOf _this in GVAR(traitsBlacklist)}) exitWith {};

    INFO_1("Restoring trait: %1 for: %2", _type, name _this);
    private _traits = [_type];
    if (_type isEqualTo "engineer") then {
        traits = ["Engineer", "ExplosiveSpecialist", "UavHacker"]
    };
    {[QGVAR(setTraits), _x, _this] call CBA_fnc_targetEvent;} forEach _traits;
}] call CBA_fnc_addEventHandler;
