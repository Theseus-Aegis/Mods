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
 * _tracks = call tac_radios_fnc_getRadioTracks;
 *
 * Public: No
 */
#include "script_component.hpp"

private _config = configFile >> "CfgSounds";
private _tracks = [];

for "_x" from 0 to (count _config - 1) do {
    private _configName = toLower (configName (_config select _x));

    if (_configName find QUOTE(ADDON) != -1 && {_configName find "_quiet" == -1} && {_configName find "_loud" == -1}) then {
        _tracks pushBack _configName;
    };
};

TRACE_1("Tracks",_tracks);
_tracks
