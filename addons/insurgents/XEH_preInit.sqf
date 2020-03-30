#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

GVAR(randomGear) = true call CBA_fnc_createNamespace;

// init random gear from config
private _configFile = configFile >> QGVAR(gear);
{
    private _rootConfig = _x;
    {
        if (!(_rootConfig isEqualTo _configFile) || {GEAR_ENABLED(configName _x)}) then {
            LOG_1("Parsing random gear - %1",_x);
            {
                private _key = configName _x;
                private _items = GVAR(randomGear) getVariable _key;
                if (isNil "_items") then {
                    LOG_1("Creating new gear category - %1",_key);
                    _items = [];
                    GVAR(randomGear) setVariable [_key, _items];
                };

                // add and filter unavilable classes
                {
                    if (!isNull (_x call CBA_fnc_getItemConfig)) then {
                        LOG_1("Adding '%1' to random gear pool",_x);
                        // we allow duplicates so chance of certain item can be increased by having them more times in arrays
                        _items pushBack _x;
                    };
                } forEach getArray _x;
            } forEach configProperties [_x, "isArray _x"];
        } else {
            INFO_1("Gear disabled - %1",_x);
        };
    } forEach ("true" configClasses _x);
} forEach [_configFile, missionConfigFile >> QGVAR(gear)];

ADDON = true;
