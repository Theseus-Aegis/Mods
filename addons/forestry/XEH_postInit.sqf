#include "script_component.hpp"

if (hasInterface) then {

    GVAR(chopping) = false;

    [["TAC", "Forestry"],
        QGVAR(forestryID1),
        ["Cut Down Tree", "Destroy Nature"],
        "",
        {
            if (call FUNC(canChop)) then {
                call FUNC(doChop);
            };
        }
    ] call CBA_fnc_addKeybind;

    [["TAC", "Forestry"],
        QGVAR(forestryID2),
        ["Flatten Grass", "Destroy Nature"],
        "",
        {call FUNC(doFlatten)}
    ] call CBA_fnc_addKeybind;
};

// Server Event
[QGVAR(simulationEvent), {
    params ["_object"];

    hideObjectGlobal _object;
    _object enableSimulationGlobal false;

}] call CBA_fnc_addEventHandler;
