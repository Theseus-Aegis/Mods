#include "script_component.hpp"

["ace_settingsInitialized", {
    // Check JNI presence
    if ("jni" callExtension "version" == "") exitWith {
        ACE_LOGERROR("Apollo failed to initialize - no JNI extension active");
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
        addMissionEventHandler ["HandleDisconnect", FUNC(HandleDisconnect)];
    };

    [QGVAR(lockerAction), FUNC(lockerAction)] call CBA_fnc_addEventHandler;

    // Start client initialization
    [QGVAR(initialized), [GVAR(enabled), GVAR(enabledPlayers)]] call CBA_fnc_globalEventJIP;
}] call CBA_fnc_addEventHandler;
