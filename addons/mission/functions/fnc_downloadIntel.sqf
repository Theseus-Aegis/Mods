#include "script_component.hpp"
/*
 * Author: Mike
 * Laptop is hard limited to the "Rugged Laptop" items otherwise alignment is massively off.
 * Has a laptop generate an intel download after an ACE interaction.
 * Will update in increments of 10% until 100. Refresh rate of the download is worked out as downloadTime / fileSize
 * fileSize should always be above 10.
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

if (_fileSize < 10) then {
    WARNING_1("Filesize (%1) too low, set to a value above 10",_fileSize);
};

// Initial setup - Players (ACE Action for download start.)
if (hasInterface) then {
    private _action = [
        QGVAR(downloadIntel),
        "Download Intel",
        "",
        {
            _target setVariable [QGVAR(downloadActive), true, true];
            _target setObjectTextureGlobal [1, '#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#000000","#00B200","\n login: loki \n Password: \n user@loki \n ----------- \n OS: Arch Linux x86_64 \n Host: X570 AORUS PRO -CF \n Kernel: 6.4.8-arch1-1 \n Uptime: 44 hours, 12 mins \n Packages: 1767 (pacman), 4 (flatpak) \n Shell: zsh 5.9 \n Resolution: 3440x1440, 2560x1080, 1920x1080 \n WM: i3 \n Theme: Equilux [GTK2/3] \n Icons: Papirus-Dark [GTK2/3] \n Terminal: kitty \n CPU: AMD Ryzen 7 5800X3D (16) @ 4.550GHz \n GPU: AMD ATI Radeon 540/540X/550/550X / RX 540X/550/550X \n GPU: AMD ATI Radeon RX 6800/6800 XT / 6900 XT \n Memory: 39995MiB / 64224MiB \n\n  $ sudo mkdir -p /mnt/usb \n  $ sudo mount /dev/sdb1 /mnt/usb \n  /mnt/usb/steal.py /home/fraser/confidential --wipe \n\n")'];
        },
        {
            !(_target getVariable [QGVAR(downloadActive), false]);
        }
    ] call ACEFUNC(interact_menu,createAction);

    [_object, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
};

// Initial setup - Server
if (isServer) then {
    // PFH refresh rate
    private _updateTickTime = _downloadTime / _fileSize;

    _object setObjectTextureGlobal [1, '#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#000000","#00B200","\n login: loki \n Password: \n user@loki \n ----------- \n OS: Arch Linux x86_64 \n Host: X570 AORUS PRO -CF \n Kernel: 6.4.8-arch1-1 \n Uptime: 44 hours, 12 mins \n Packages: 1767 (pacman), 4 (flatpak) \n Shell: zsh 5.9 \n Resolution: 3440x1440, 2560x1080, 1920x1080 \n WM: i3 \n Theme: Equilux [GTK2/3] \n Icons: Papirus-Dark [GTK2/3] \n Terminal: kitty \n CPU: AMD Ryzen 7 5800X3D (16) @ 4.550GHz \n GPU: AMD ATI Radeon 540/540X/550/550X / RX 540X/550/550X \n GPU: AMD ATI Radeon RX 6800/6800 XT / 6900 XT \n Memory: 39995MiB / 64224MiB \n")'];
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
        private _progressBar = "[          ]";
        for "_i" from 1 to (_stage / 10) do {
            _progressBar = _progressBar splitString "";
            _progressBar set [_i, "="];
            _progressBar = _progressBar joinString "";
        };

        private _string = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#000000","#00B200","\n login: loki \n Password: \n user@loki \n ----------- \n OS: Arch Linux x86_64 \n Host: X570 AORUS PRO -CF \n Kernel: 6.4.8-arch1-1 \n Uptime: 44 hours, 12 mins \n Packages: 1767 (pacman), 4 (flatpak) \n Shell: zsh 5.9 \n Resolution: 3440x1440, 2560x1080, 1920x1080 \n WM: i3 \n Theme: Equilux [GTK2/3] \n Icons: Papirus-Dark [GTK2/3] \n Terminal: kitty \n CPU: AMD Ryzen 7 5800X3D (16) @ 4.550GHz \n GPU: AMD ATI Radeon 540/540X/550/550X / RX 540X/550/550X \n GPU: AMD ATI Radeon RX 6800/6800 XT / 6900 XT \n Memory: 39995MiB / 64224MiB \n\n  $ sudo mkdir -p /mnt/usb \n  $ sudo mount /dev/sdb1 /mnt/usb \n  /mnt/usb/steal.py /home/fraser/confidential --wipe \n\n  Downloading: %1/%2GB \n  %3 (%4%5)")', _downloaded, _fileSize, _progressBar, _stage, "%"];

        _object setObjectTextureGlobal [1, _string];

        _object setVariable [QGVAR(downloadStage), (_stage + 10)];

        if (_stage == 100) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            private _string = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#000000","#00B200","\n login: loki \n Password: \n user@loki \n ----------- \n OS: Arch Linux x86_64 \n Host: X570 AORUS PRO -CF \n Kernel: 6.4.8-arch1-1 \n Uptime: 44 hours, 12 mins \n Packages: 1767 (pacman), 4 (flatpak) \n Shell: zsh 5.9 \n Resolution: 3440x1440, 2560x1080, 1920x1080 \n WM: i3 \n Theme: Equilux [GTK2/3] \n Icons: Papirus-Dark [GTK2/3] \n Terminal: kitty \n CPU: AMD Ryzen 7 5800X3D (16) @ 4.550GHz \n GPU: AMD ATI Radeon 540/540X/550/550X / RX 540X/550/550X \n GPU: AMD ATI Radeon RX 6800/6800 XT / 6900 XT \n Memory: 39995MiB / 64224MiB \n\n  $ sudo mkdir -p /mnt/usb \n  $ sudo mount /dev/sdb1 /mnt/usb \n  /mnt/usb/steal.py /home/fraser/confidential --wipe \n\n  Downloaded:  %1/%2GB \n  %3 (%4%5)")', _downloaded, _fileSize, _progressBar, _stage, "%"];
            _object setObjectTextureGlobal [1, _string];

            // Blank out screen
            [{
                _this #1 setObjectTextureGlobal [1, ""];
            }, [_object], 10] call CBA_fnc_waitAndExecute;
        };

    }, _updateTickTime, [_object, _fileSize]] call CBA_fnc_addPerFrameHandler;
};
