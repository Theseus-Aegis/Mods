/*
 * Author: Jonpas
 * Adds Whiteboard slide actions.
 *
 * Arguments:
 * 0: Whiteboard <OBJECT>
 *
 * Return Value:
 * Children Actions <ARRAY>
 *
 * Example:
 * [whiteboard] call tac_whiteboards_fnc_addSlideActions;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_object);

private ["_slides", "_actions"];

_slides = _object getVariable QGVAR(Slides);
EXPLODE_3_PVT(_slides,_whiteboards,_images,_names);

_actions = [];
{
    _actions pushBack
    [
        [
            format ["Whiteboard_Image_%1", _forEachIndex],
            _names select _forEachIndex,
            "",
            {
                {
                    _x setObjectTextureGlobal [0, (_this select 2) select 1]
                } forEach ((_this select 2) select 0);
            },
            {true},
            {},
            [_whiteboards,_x]
        ] call ace_interact_menu_fnc_createAction,
        [],
        _object
    ];
} forEach _images;

_actions
