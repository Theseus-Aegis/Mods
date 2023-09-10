#include "..\script_component.hpp"
/*
 * Author: TMF Team, Jonpas
 * Tests mission description value.
 *
 * Arguments:
 * Attribute Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_mission_autotest_fnc_testDescription
 *
 * Public: No
 */

private _value = getMissionConfigValue ["onLoadMission", ""];
if (_value == "") then {
    _value = "Multiplayer" get3DENMissionAttribute "IntelOverviewText";
};

//@todo check if second value is part of vanilla
private _picture = [PASS_PICTURE, ERROR_PICTURE] select (_value == "" || {_value == "*** Insert mission description here. ***"});

(_this controlsGroupCtrl CTRL_VALUE) ctrlSetText _value;
(_this controlsGroupCtrl CTRL_PICTURE) ctrlSetText _picture;
