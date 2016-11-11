/*
 * Author: TMF Team, Jonpas
 * Tests mission game type value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testGameType
 *
 * Public: No
 */
#include "script_component.hpp"

private _value = getText (missionConfigFile >> "Header" >> "gameType");
if (_value == "") then {
    // getMissionConfigValue does not work (even though attribute name is same)
    _value = "Multiplayer" get3DENMissionAttribute "GameType"; // default return: "Unknown"
};

(_this controlsGroupCtrl CTRL_VALUE) ctrlSetText _value;

if (_value == "" || {_value == "Unknown"}) then {
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
} else {
    if (_value != "COOP") then {
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
    } else {
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
    };
};
