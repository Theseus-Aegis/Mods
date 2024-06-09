#include "..\script_component.hpp"
/*
 * Author: Mike
 * Plays a looping sound via createSoundSource with optional automatic deletion.
 * Supports custom sounds for loop created through Description.ext
 * If deletion time is greater than 0 it will automatically delete it after the delay specified.
 *
 * Call on the server only.
 *
 * Arguments
 * 0: Object <OBJECT>
 * 1: Sound <STRING>
 * 2: Time until deletion <NUMBER> (default: 0)
 *
 * Return Value:
 * Sound Source
 *
 * Example:
 * [Loudspeaker, "Sound_Alarm", 30] call MFUNC(soundSource)
 * GVAR(myLoudSpeakerSound) = [Loudspeaker, "Sound_Alarm"] call MFUNC(soundSource)
*/

params ["_object", ["_sound", ""], ["_deleteTime", 0]];

if (!isServer) exitWith {};

if (isNull _object) exitWith {
    ERROR_MSG("Object (%1) does not exist",_object);
};

// Check if CfgVehicles entry exists in config or mission config.
private _cfgFile = isClass (configFile >> "CfgVehicles" >> _sound);
private _missionCfgFile = isClass (missionConfigFile >> "CfgVehicles" >> _sound);

if (!_cfgFile && !_missionCfgFile) then {
    ERROR_MSG_1("Sound (%1) does not exist.",_sound);
};

private _position = getPosATL _object; // Height matters in some cases.
private _soundSource = createSoundSource [_sound, _position, [], 0];

if (_deleteTime > 0) then {
    [{
        params ["_soundSource"];
        deleteVehicle _soundSource;
    }, [_soundSource], _deleteTime] call CBA_fnc_waitAndExecute;
};

_soundSource
