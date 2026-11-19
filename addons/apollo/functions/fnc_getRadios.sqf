#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Returns the local player's ACRE radio settings, kept for the mission so a reconnect gets them back
 * (FUNC(setRadios)). Radios get new IDs on load, so they're kept by base class, in order.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * [[[base radio, channel, volume, spatial], ...], active radio index, [multi push-to-talk radio indexes]] or [] <ARRAY>
 *
 * Example:
 * [] call tac_apollo_fnc_getRadios
 *
 * Public: No
 */

if (!(["acre_api"] call ACEFUNC(common,isModLoaded)) || {!([] call acre_api_fnc_isInitialized)}) exitWith {[]};

private _list = [] call acre_api_fnc_getCurrentRadioList;
private _radios = _list apply {
    [[_x] call acre_api_fnc_getBaseRadio, [_x] call acre_api_fnc_getRadioChannel, [_x] call acre_api_fnc_getRadioVolume, [_x] call acre_api_fnc_getRadioSpatial]
};
private _ptt = ([] call acre_api_fnc_getMultiPushToTalkAssignment) apply {_list find _x};

[_radios, _list find ([] call acre_api_fnc_getCurrentRadio), _ptt]
