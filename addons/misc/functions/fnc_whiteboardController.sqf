/*
 * Author: DaC
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
 * [<arg0>, <arg1>, <arg2>, <arg3>] call TAC_Misc_fnc_whiteboardController;
 */
#include "script_component.hpp"

private ["_whiteBoardObj", "_controllerObj", "_defaultTexture", "_actions", "_textMessage", "_imgSrc"];

_whiteBoardObj = _this select 0;
_controllerObj = _this select 1;
_defaultTexture = _this select 2;
_actions = _this select 3;

_whiteBoardObj setObjectTextureGlobal [0, _defaultTexture];

{
    _textMessage = _x select 0;
    _imgSrc = _x select 1;
    _controllerObj addAction [_x select 0, {
        _this select 3 select 1 setObjectTextureGlobal [0, _this select 3 select 0]
    }, [_imgSrc, _whiteBoardObj]];
} forEach _actions;
