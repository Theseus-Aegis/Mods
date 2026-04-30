#include "..\script_component.hpp"
/*
 * Author: Karel Moricky, Edited by Mike
 * Description: Initialize interactive leaflet. - Edited to be utilised locally, otherwise it does not work for static pickups (drone fired can use the default function)
 * Call from initPlayerLocal.sqf 
 *
 * Arguments:
 * 0: Position <POSITION>
 * 1: STRING <CLASSNAME>
 * 2: Direction <NUMBER> (default: 0)
 * 
 * Example:
 * [[getPosATL LeafletPosition, "Custom_01"]] call FUNC(leaflet);
 * [[getPosATL LeafletPosition, "Custom_01", 10]] call FUNC(leaflet);
 * 
 * Returns Value:
 * None
*/

params ["_position", "_classname", ["_direction", 0]];

private _leaflet = createVehicleLocal ["Leaflet_05_F", _position, [], 0, "CAN_COLLIDE"];
_leaflet setDir _direction;

private _cfg = [["CfgLeaflets", _classname], configFile >> "CfgLeaflets" >> "Default"] call BIS_fnc_loadClass;
private _texture = getText (_cfg >> "texture");
private _text = getText (_cfg >> "text");

if (_texture == "") exitWith {
    format ["Texture not defined for class: %1", _classname] call CBA_fnc_notify;
};

[_leaflet, _texture, _text] call BIS_fnc_initInspectable;
