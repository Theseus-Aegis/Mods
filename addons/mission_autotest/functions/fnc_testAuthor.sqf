/*
 * Author: TMF Team, Jonpas
 * Tests author value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testAuthor
 *
 * Public: No
 */
#include "script_component.hpp"

private _value = getMissionConfigValue ["author", ""];
private _picture = [PASS_PICTURE, ERROR_PICTURE] select (_value find profileName == -1);

(_this controlsGroupCtrl CTRL_VALUE) ctrlSetText _value;
(_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText _picture;
