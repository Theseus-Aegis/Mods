#include "script_component.hpp"
/*
 * Author: TMF Team, Jonpas
 * Tests maximum players value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testMaxPlayers
 *
 * Public: No
 */

private _config = missionConfigFile >> "Header" >> "maxPlayers";
private _value = getNumber _config; // Returns 0 even if not set
if (!isNumber _config) then {
    // getMissionConfigValue does not work (even though attribute name is same)
    _value = "Multiplayer" get3DENMissionAttribute "MaxPlayers";
};

private _playableCount = count (playableUnits + ((all3DENEntities select 3) select {_x isKindOf "HeadlessClient_F"}));

if (_value != _playableCount) then {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: %3)", _value, localize LSTRING(ShouldBe), _playableCount]);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (str _value);
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
};
