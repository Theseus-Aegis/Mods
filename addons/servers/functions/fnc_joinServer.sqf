#include "script_component.hpp"
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

diag_log _ip;
diag_log _port;

private _passwordCache = profileNamespace getVariable ["cba_ui_ServerPasswords", [[], []]];
diag_log _passwordCache;

_passwordCache params ["_addresses", "_passwords"];
diag_log _addresses;
diag_log _passwords;

private _index = _addresses find (format ["%1:%2", _ip, _port]);
diag_log _index;

private _password = _passwords param [_index, ""];
diag_log _password;

connectToServer [_ip, _port, _password];
