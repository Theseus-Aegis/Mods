/*
 * Author: Jonpas
 * Invokes Java code through JNI extension and returns the return value from extension.
 * Must combine strings with + operator to bypass 8192 characters limit.
 *
 * Arguments:
 * Packet of methods <ARRAY>
 *
 * Return Value:
 * Extension Return Value <STRING>
 *
 * Example:
 * ["someJavaMethod"] call tac_apollo_fnc_invokeJavaMethod
 *
 * Public: No
 */
#include "script_component.hpp"

private _packet = _this;
_packet params ["_method"];

if (isNil "_packet" || {!(_packet isEqualType [])} || {(count _packet) isEqualTo 0} || {!(_method isEqualType "")}) exitWith {""};

// Parse arguments with correct syntax
private _argument_str = "";
_packet deleteAt 0; // Errors when combined with forEach
{
    if !(_x isEqualType "") then {
        _x = str _x;
    };
    _argument_str = _argument_str + "<A>" + _x + "</A>";
} count _packet;

// Return Java Extension answer
"jni" callExtension ("<MI><M>" + _method + "</M><AL>" + _argument_str + "</AL></MI>")
