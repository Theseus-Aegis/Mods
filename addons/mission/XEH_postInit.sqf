#include "script_component.hpp"

// Verify mission type is correct
private _missionType = getMissionConfigValue ["tac_type", -1];
if (_missionType == -1 || {_missionType >= count MISSION_TYPES}) exitWith {
    ERROR_MSG_2("Invalid mission type %1! Expected 0-%2",_missionType,count MISSION_TYPES - 1);
};

// Exit if not player client
if (!hasInterface) exitWith {};

// Collect Intel: Request intel collected so far
[QGVAR(collectIntel_updateRequest), ACE_player] call CBA_fnc_serverEvent;
