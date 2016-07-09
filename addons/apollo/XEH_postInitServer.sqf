#include "script_component.hpp"

// Check JNI presence
if ("jni" callExtension "version" == "") exitWith {
    ACE_LOGERROR("Apollo failed to initialize - no JNI extension active");
};

// Set server type (debug or live) globally
private _serverType = ["getServerType"] call FUNC(invokeJavaMethod);
GVAR(debug) = [false, true] select (_serverType isEqualTo "debug");
publicVariable QGVAR(debug);

if (GVAR(enabledVehicles)) then {
    call FUNC(vehicleLoad);
};

// Save player
[QGVAR(savePlayer), {
    params ["_unit", "_type"];
    [_unit, getPlayerUID _unit, _type] call FUNC(playerSingletonSave);
}] call CBA_fnc_addEventHandler;

// Player died
[QGVAR(playerDied), {
    params ["_unit", "_killedBy"];
    ["playerDied", getPlayerUID _unit, _killedBy] call FUNC(invokeJavaMethod);
}] call CBA_fnc_addEventHandler;

// Corpse removal (prevent item multiplication when leaving nicely)
addMissionEventHandler ["HandleDisconnect", FUNC(HandleDisconnect)];

[QGVAR(lockerAction), FUNC(lockerAction)] call CBA_fnc_addEventHandler;

[QGVAR(initialized), []] call CBA_fnc_globalEvent;
