/*
 * Author: Jonpas
 * Tests respawn mode value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testRespawnMode
 *
 * Public: No
 */
#include "script_component.hpp"

private _value = getMissionConfigValue ["respawn", 0];

// Convert string values to numerical
if (_value isEqualType "") then {
    _value = RESPAWN_MODES find (toUpper _value); // find is case-sensitive
};

// Exit if invalid mode (to prevent division by zero later)
if (_value == -1) exitWith {
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText ERROR_PICTURE;
};

private _text = format ["%1 - %2", RESPAWN_MODES select _value, _value];

if (_value == RESPAWN_MODE_RECOMMENDED) then {
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText PASS_PICTURE;
} else {
    _text = format ["%1 (%2: %3 - %4)", _text, localize LSTRING(ShouldBe), RESPAWN_MODES select RESPAWN_MODE_RECOMMENDED, RESPAWN_MODE_RECOMMENDED];
    (_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText WARNING_PICTURE;
};

(_this controlsGroupCtrl CTRL_VALUE) ctrlSetText _text;
