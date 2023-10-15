#include "script_component.hpp"

if (isServer) then {
    // Add Add Object To Chronos (server)
    [QGVAR(addObjectToChronos), {_this call FUNC(moduleAddObjectToChronosServer)}] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    // Failure notification
    [QGVAR(addObjectToChronosFailed), {
        [LSTRING(EnableChronos)] call ACEFUNC(common,displayTextStructured)
    }] call CBA_fnc_addEventHandler;
};
