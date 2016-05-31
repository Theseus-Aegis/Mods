#include "script_component.hpp"

[QGVAR(play), {
    (_this select 0) say3D (_this select 1);
}] call CBA_fnc_addEventHandler;
