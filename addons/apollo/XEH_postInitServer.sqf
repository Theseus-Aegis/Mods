#include "script_component.hpp"

["ace_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    // Check JNI presence
    if ("jni" callExtension "version" == "") exitWith {
        ACE_LOGERROR("Apollo failed to initialize - Missing JNI extension!");
    };

    // Set server type (debug or live) globally
    private _serverType = ["getServerType"] call FUNC(invokeJavaMethod);
    EGVAR(chronos,debug) = [false, true] select (_serverType isEqualTo "debug");
    publicVariable QEGVAR(chronos,debug);

    if (GVAR(enabledVehicles)) then {
        call FUNC(vehicleLoad);
    };

    if (GVAR(enabledPlayers)) then {
        // Save player
        [QGVAR(savePlayer), {
            params ["_player", "_type"];
            [_player, getPlayerUID _player, _type] call FUNC(playerSingletonSave);
        }] call CBA_fnc_addEventHandler;

        // Player died
        [QGVAR(playerDied), {
            params ["_player", "_killedBy"];
            ["playerDied", getPlayerUID _player, _killedBy] call FUNC(invokeJavaMethod);
        }] call CBA_fnc_addEventHandler;

        // Corpse removal (prevent item multiplication when leaving nicely)
        addMissionEventHandler ["HandleDisconnect", FUNC(handleDisconnect)];

        // Start client initialization
        [QGVAR(initialized), []] call CBA_fnc_globalEventJIP;
    };

    [QGVAR(lockerAction), FUNC(lockerAction)] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
