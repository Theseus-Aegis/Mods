/*
 * Author: Jonpas
 * Invokes Java code through JNI extension with XML marshalling and returns the return value from extension.
 * Uses + operator to bypass 8192 character limit.
 *
 * Arguments:
 * 0: Method <STRING>
 * 1-inf: Arguments <ANY>
 *
 * Return Value:
 * Extension Return Value <STRING>
 *
 * Example:
 * ["someJavaMethod", "arg1", "arg2"] call tac_apollo_fnc_invokeJavaMethod
 *
 * Public: No
 */
#include "script_component.hpp"

if (!(_this isEqualType []) || {_this isEqualTo []} || {!((_this select 0) isEqualType "")}) exitWith {""};

// Parse arguments with correct syntax
private _argument_str = "";
_this deleteAt 0; // Errors when combined with forEach
{
    [str _x, _x] select (_x isEqualType "");
    _argument_str = _argument_str + "<A>" + _x + "</A>";
} count _this;

// Return Java Extension answer
"jni" callExtension ("<MI><M>" + (_this select 0) + "</M><AL>" + _argument_str + "</AL></MI>")
