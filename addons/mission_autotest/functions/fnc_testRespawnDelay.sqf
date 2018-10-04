#include "script_component.hpp"
/*
 * Author: Jonpas
 * Tests respawn delay value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testRespawnDelay
 *
 * Public: No
 */

private _value = getMissionConfigValue ["respawnDelay", 0];

if (_value < RESPAWN_DELAY_MIN_RECOMMENDED || {_value > RESPAWN_DELAY_MAX_RECOMMENDED}) then {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (format ["%1 (%2: %3 - %4)", _value, localize LSTRING(ShouldBe), RESPAWN_DELAY_MIN_RECOMMENDED, RESPAWN_DELAY_MAX_RECOMMENDED]);

    if (_value < RESPAWN_DELAY_MIN_RECOMMENDED) then {
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
        (_this controlsGroupCtrl CTRL_VALUE) ctrlSetTooltip (localize LSTRING(RespawnNoDelayNote));
    } else {
        (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
    }
} else {
    (_this controlsGroupCtrl CTRL_VALUE) ctrlSetText (str (round _value));
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
};
