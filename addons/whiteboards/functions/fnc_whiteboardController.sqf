/*
 * Author: DaC, Jonpas
 * Sets up whiteboard slide controls.
 *
 * Arguments:
 * 0: Whiteboard <OBJECT>
 * 1: Controller <OBJECT>
 * 2: Default Texture <STRING>
 * 3: Actions <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [<arg0>, <arg1>, <arg2>, <arg3>] call tac_whitebaords_fnc_whiteboardController;
 */
#include "script_component.hpp"

PARAMS_4(_whiteboard,_controller,_defaultTexture,_actions);

_whiteboard setObjectTextureGlobal [0, _defaultTexture];

{
    PARAMS_2(_textMessage,_imgSrc);

    _controller addAction [_textMessage, {
        EXPLODE_2_PVT(_this select 3,_imgSrc,_whiteboard);
        _whiteboard setObjectTextureGlobal [0, _imgSrc];
    }, [_imgSrc, _whiteboard]];
} forEach _actions;
