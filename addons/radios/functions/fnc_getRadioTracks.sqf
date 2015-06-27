/*
 * Author: Jonpas
 * Gets radio tracks classnames from config.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Radio Tracks <ARRAY>
 *
 * Example:
 * call tac_radios_fnc_getRadioTracks;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_config", "_tracks", "_configName"];

_config = configFile >> "CfgSounds";
_tracks = [];

for "_x" from 0 to (count _config - 1) do {
    _configName = toLower configName (_config select _x);

    if (_configName find QUOTE(ADDON) != -1) then {
        _tracks pushBack _configName;
    };
};

_tracks
