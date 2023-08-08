#include "script_component.hpp"
/*
 * Author: Mike
 * Laptop is hard limited to the "Rugged Laptop" items otherwise alignment is massively off.
 * Has a laptop generate an intel download after an ACE interaction.
 * Will update in increments of 10% until 100. Refresh rate of the download is worked out as downloadTime / fileSize
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Laptop <OBJECT>
 * 1: Filesize <NUMBER>
 * 2: Download Time <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MyGroup] call MFUNC(downloadIntel)
 */

params ["_object", "_fileSize", "_downloadTime"];

// PFH refresh rate
private _updateTickTime = _downloadTime / _fileSize;

// Initial setup - Players (ACE Action for download start.)
if (hasInterface) then {
    private _action = [
        QGVAR(downloadIntel),
        "Download Intel",
        "",
        {
            _target setVariable [QGVAR(downloadActive), true, true];
            // Placeholder for now. (Write files to external drive, wipe drive afterwards?)
            _target setObjectTextureGlobal [1, '#(rgb,512,512,3)text(1,1,"RobotoCondensedBold",0.1,"#000000","#ff0000","CHANGE ME!")'];
        },
        {
            !(_target getVariable [QGVAR(downloadActive), false]);
        }
    ] call ACEFUNC(interact_menu,createAction);

    [_object, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
};

// Initial setup - Server
if (isServer) then {
    // Placeholder for now. (Something resembling Linux)
    _object setObjectTextureGlobal [1, '#(rgb,512,512,3)text(1,1,"RobotoCondensedBold",0.1,"#000000","#ff0000","CHANGE ME!")'];
    _object setVariable [QGVAR(downloadActive), false, true];
    _object setVariable [QGVAR(downloadStage), 0];

    // PFH
    [{
        params ["_args", "_handle"];
        _args params ["_object", "_fileSize"];

        // Exit if download hasn't yet started.
        if !(_object getVariable [QGVAR(downloadActive), false]) exitWith {};

        private _stage = _object getVariable [QGVAR(downloadStage), 0];
        private _downloaded = _fileSize * (_stage / 100);
        private _progressBar = "[]";
        for "_i" from 1 to (_stage / 10) do {
            _progressBar = _progressBar insert [1, "="];
        };

        private _string = format ['#(rgb,512,512,3)text(1,1,"RobotoCondensedBold",0.1,"#000000","#ff0000","Downloading\n %1/%2GB \n%3\n(%4%5)")', _downloaded, _fileSize, _progressBar, _stage, "%"];

        _object setObjectTextureGlobal [1, _string];

        _object setVariable [QGVAR(downloadStage), (_stage + 10)];

        if (_stage == 100) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            private _string = format ['#(rgb,512,512,3)text(1,1,"RobotoCondensedBold",0.1,"#000000","#ff0000","Downloaded\n %1/%2GB \n%3\n(%4%5)")', _downloaded, _fileSize, _progressBar, _stage, "%"];
            _object setObjectTextureGlobal [1, _string];

            // Blank out screen
            [{
                _this setObjectTextureGlobal [1, ""];
            }, [_object], 10] call CBA_fnc_waitAndExecute;
        };

    }, _updateTickTime, [_object, _fileSize]] call CBA_fnc_addPerFrameHandler;
};
