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

private _tracks = ("true" configClasses (configFile >> "CfgSounds")) apply {toLower (configName _x)};
_tracks = _tracks select {_x find QUOTE(ADDON) != -1 && {_x find "_quiet" == -1} && {_x find "_loud" == -1}};

TRACE_1("Tracks",_tracks);
_tracks
