/*
 * Author: DaC, Jonpas
 * Closes or opens the helicopter doors and calls lock function on all connected.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

/*--------------------------------------------------------------------
  Door Classnames
  ===============
  Used:
    door_L - UH-80 Ghost Hawk (Left)
    door_R - UH-80 Ghost Hawk (Right)
    door_back_L - CH-49 Mohawk (Left)
    door_back_R - CH-49 Mohawk (Right)
    door_4_source - Mi-290 Taru (Left Pod)
    door_5_source - Mi-290 Taru (Right Pod)
    door_6_source - Mi-290 Taru (Rear Pod)
    
  Other:
    cargoRamp_Open - CH-49 Mohawk (Cargo Ramp)
    door_1_source - Mi-290 Taru (Pilot)
    door_2_source - Mi-290 Taru (Co-Pilot)
    door_3_source - Mi-290 Taru (Loadmaster)
    door_L_source - CH-67 Huron (Left)
    door_R_source - CH-67 Huron (Right)
    door_rear_source - CH-67 Huron (Cargo Ramp)
    doorL_Front_Open - M-900 (Front Left)
    doorR_Front_Open - M-900 (Front Right)
    doorL_Back_Open - M-900 (Back Left)
    doorR_Back_Open - M-900 (Back Right)
--------------------------------------------------------------------*/

private ["_doors", "_newDoorStatus"];

// Doors to be animated
_doors = [
    "door_L","door_R",
    "door_back_L","door_back_R",
    "door_4_source","door_5_source","door_6_source"
];

PARAMS_1(_heli);

if (locked _heli < 2) then {
    _heli setVehicleLock "LOCKED";
    _newDoorStatus = 0;
    [localize LSTRING(Secured), QUOTE(PATHTOF(UI\secure_ca.paa))] call ACE_FUNC(common,displayTextPicture);
} else {
    _heli setVehicleLock "UNLOCKED";
    _newDoorStatus = 1;
    [localize LSTRING(Unsecured), QUOTE(PATHTOF(UI\secure_ca.paa))] call ACE_FUNC(common,displayTextPicture);
};

// Animate doors
{
    _heli animateDoor [_x, _newDoorStatus];
} forEach _doors;
