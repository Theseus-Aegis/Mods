#include "..\script_component.hpp"
/*
 * Author: JoramD
 * Join a server using the password saved by CBA.
 *
 * Arguments:
 * 0: IP <STRING>
 * 1: Port <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["213.239.214.39", 2302] call tac_servers_fnc_joinServer
 *
 * Public: No
 */

params ["_ip", "_port"];

private _passwordCache = profileNamespace getVariable ["cba_ui_ServerPasswords", [[], []]];
_passwordCache params ["_addresses", "_passwords"];

private _index = _addresses find (format ["%1:%2", _ip, _port]);
private _password = _passwords param [_index, ""];

connectToServer [_ip, _port, _password];
