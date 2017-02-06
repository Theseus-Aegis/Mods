#include "script_component.hpp"

ADDON = false;

// frame after preInit, but before postInit
0 spawn {
    {
        // do nothing if auto loaded settings file is present
        if (isClass (configFile >> "CfgPatches" >> "cba_auto_load_settings_file")) exitWith {};

        private _source = ["client", "server"] select (isMultiplayer && isServer);
        private _info = loadFile PATH_SETTINGS_FILE_PBO;

        _info = _info call EFUNC(settings,parse);

        {
            _x params ["_setting", "_value", "_force"];
            [_setting, _value, _force, _source] call EFUNC(settings,set);
        } forEach _info;

        LOG("CBA Settings file loaded from PBO.");
    } call CBA_fnc_directCall;
};

ADDON = true;
