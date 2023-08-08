#include "script_component.hpp"
/*
 * Author: Mike
 * Only Laptop, Rugged Laptop & PC Set - Screen are actively supported.
 * Has a laptop generate an intel download after an ACE interaction.
 * Will update in increments of 10% until 100. Refresh rate of the download is worked out as downloadTime / 10
 * Texture source is shown on the object via Attributes > Object Specific > Texture #X
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Laptop <OBJECT>
 * 1: Texture Source <NUMBER>
 * 2: Filesize <NUMBER>
 * 3: Download Time <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Laptop, 0, 100, 60] call MFUNC(downloadIntel)
 */

params ["_object", "_textureSource", "_fileSize", "_downloadTime"];

// Initial setup - Players (ACE Action for download start.)
if (hasInterface) then {
    private _action = [
        QGVAR(downloadIntel),
        "Download Intel",
        "",
        {
            (_this select 2) params ["_textureSource"];

            _target setVariable [QGVAR(downloadActive), true, true];
            private _string = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","\n login: loki \n Password: \n user@loki \n ----------- \n OS: Arch Linux x86_64 \n Host: X570 AORUS PRO -CF \n Kernel: 6.4.8-arch1-1 \n Packages: 1767 (pacman), 4 (flatpak) \n Shell: zsh 5.9 \n Resolution: 3440x1440, 2560x1080, 1920x1080 \n WM: i3 \n Theme: Equilux [GTK2/3] \n Icons: Papirus-Dark [GTK2/3] \n Terminal: kitty \n CPU: AMD Ryzen 7 5800X3D (16) @ 4.550GHz \n GPU: AMD ATI Radeon 540/540X/550/550X  \n GPU: AMD ATI Radeon RX 6800/6800 XT  \n Memory: %1MiB / 64224MiB \n\n  $ sudo mkdir -p /mnt/usb \n  $ sudo mount /dev/sdb1 /mnt/usb \n  /mnt/usb/steal.py /home/fraser/confidential --wipe \n\n")', floor (random [10000, 30000, 64224])];
            _target setObjectTextureGlobal [_textureSource, _string];
        },
        {
            !(_target getVariable [QGVAR(downloadActive), false]);
        },
        {},
        [_textureSource]
    ] call ACEFUNC(interact_menu,createAction);

    [_object, 0, ["ACE_MainActions"], _action] call ACEFUNC(interact_menu,addActionToObject);
};

// Initial setup - Server
if (isServer) then {
    // PFH refresh rate
    private _updateTickTime = _downloadTime / 10;

    private _string = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","\n login: loki \n Password: \n user@loki \n ----------- \n OS: Arch Linux x86_64 \n Host: X570 AORUS PRO -CF \n Kernel: 6.4.8-arch1-1 \n Packages: 1767 (pacman), 4 (flatpak) \n Shell: zsh 5.9 \n Resolution: 3440x1440, 2560x1080, 1920x1080 \n WM: i3 \n Theme: Equilux [GTK2/3] \n Icons: Papirus-Dark [GTK2/3] \n Terminal: kitty \n CPU: AMD Ryzen 7 5800X3D (16) @ 4.550GHz \n GPU: AMD ATI Radeon 540/540X/550/550X  \n GPU: AMD ATI Radeon RX 6800/6800 XT  \n Memory: %1MiB / 64224MiB \n\n")', floor (random [10000, 30000, 64224])];
    _object setObjectTextureGlobal [_textureSource, _string];
    _object setVariable [QGVAR(downloadActive), false, true];
    _object setVariable [QGVAR(downloadStage), 0];

    // PFH
    [{
        params ["_args", "_handle"];
        _args params ["_object", "_fileSize", "_textureSource"];

        // Exit if download hasn't yet started.
        if !(_object getVariable [QGVAR(downloadActive), false]) exitWith {};

        private _memory = floor (random [10000, 30000, 64224]);
        private _stage = _object getVariable [QGVAR(downloadStage), 0];
        private _downloaded = _fileSize * (_stage / 100);
        private _progressBar = "[          ]";
        for "_i" from 1 to (_stage / 10) do {
            _progressBar = _progressBar splitString "";
            _progressBar set [_i, "="];
            _progressBar = _progressBar joinString "";
        };

        private _string = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","\n login: loki \n Password: \n user@loki \n ----------- \n OS: Arch Linux x86_64 \n Host: X570 AORUS PRO -CF \n Kernel: 6.4.8-arch1-1 \n Packages: 1767 (pacman), 4 (flatpak) \n Shell: zsh 5.9 \n Resolution: 3440x1440, 2560x1080, 1920x1080 \n WM: i3 \n Theme: Equilux [GTK2/3] \n Icons: Papirus-Dark [GTK2/3] \n Terminal: kitty \n CPU: AMD Ryzen 7 5800X3D (16) @ 4.550GHz \n GPU: AMD ATI Radeon 540/540X/550/550X  \n GPU: AMD ATI Radeon RX 6800/6800 XT  \n Memory: %1MiB / 64224MiB \n\n  $ sudo mkdir -p /mnt/usb \n  $ sudo mount /dev/sdb1 /mnt/usb \n  /mnt/usb/steal.py /home/fraser/confidential --wipe \n\n  Downloading: %2/%3GB \n  %4 (%5%6)")', _memory, _downloaded, _fileSize, _progressBar, _stage, "%"];

        _object setObjectTextureGlobal [_textureSource, _string];

        _object setVariable [QGVAR(downloadStage), (_stage + 10)];

        if (_stage == 100) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            private _string = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","\n login: loki \n Password: \n user@loki \n ----------- \n OS: Arch Linux x86_64 \n Host: X570 AORUS PRO -CF \n Kernel: 6.4.8-arch1-1 \n Packages: 1767 (pacman), 4 (flatpak) \n Shell: zsh 5.9 \n Resolution: 3440x1440, 2560x1080, 1920x1080 \n WM: i3 \n Theme: Equilux [GTK2/3] \n Icons: Papirus-Dark [GTK2/3] \n Terminal: kitty \n CPU: AMD Ryzen 7 5800X3D (16) @ 4.550GHz \n GPU: AMD ATI Radeon 540/540X/550/550X  \n GPU: AMD ATI Radeon RX 6800/6800 XT  \n Memory: %1MiB / 64224MiB \n\n  $ sudo mkdir -p /mnt/usb \n  $ sudo mount /dev/sdb1 /mnt/usb \n  /mnt/usb/steal.py /home/fraser/confidential --wipe \n\n  Downloaded:  %2/%3GB \n  %4 (%5%6)")', _memory, _downloaded, _fileSize, _progressBar, _stage, "%"];
            _object setObjectTextureGlobal [_textureSource, _string];

            // Blank out screen
            [{
                (_this select 0) setObjectTextureGlobal [(_this select 1), "#(argb,8,8,3)color(0,0,0,0,co)"];
            }, [_object, _textureSource], 10] call CBA_fnc_waitAndExecute;
        };

    }, _updateTickTime, [_object, _fileSize, _textureSource]] call CBA_fnc_addPerFrameHandler;
};
