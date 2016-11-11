/*
 * Author: TMF Team, Jonpas
 * Tests minimum players value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testMinPlayers
 *
 * Public: No
 */
#include "script_component.hpp"

private _config = missionConfigFile >> "Header" >> "minPlayers";
private _value = getNumber _config; // Returns 0 even if not set
if (!isNumber _config) then {
    _value = "Multiplayer" get3DENMissionAttribute "MinPlayers";
};

private _playerCount = count playableUnits;

if (_value >= 0 && {_value <= _playerCount}) then {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (str _value);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: <%3)", _value, localize LSTRING(ShouldBe), _playerCount]);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
};
