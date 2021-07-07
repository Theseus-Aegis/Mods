#include "script_component.hpp"

playerTraits = createHashMap;

[QGVAR(storeTraits), {
    playerTraits set _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(resetTraits), {
    private _type = playerTraits getOrDefault [getPlayerUID _this, ""];
    if (typeOf _this isEqualTo "tacs_Unit_B_TeamLeader") exitWith {};
    private _traits = [_type];
    if (_type isEqualTo "engineer") then {traits = ["Engineer", "ExplosiveSpecialist", "UavHacker"]};
    {_player setUnitTrait _x} forEach _traits;
}] call CBA_fnc_addEventHandler;
