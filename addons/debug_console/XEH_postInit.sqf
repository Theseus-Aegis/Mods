#include "script_component.hpp"

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", FUNC(handleDisconnect)];
    [QGVAR(createCurator), {LINKFUNC(addCurator)}] call CBA_fnc_addEventHandler;
};

[QGVAR(massHeal), {[ace_player] call ACEFUNC(medical_treatment,fullHealLocal)}] call CBA_fnc_addEventHandler;

[["Curator", "Assigning Curator"], {[QGVAR(createCurator), ace_player] call CBA_fnc_serverEvent}] call FUNC(addButton);
[["Mass Heal", "Healing all Players"], {[QGVAR(massHeal)] call CBA_fnc_globalEvent}] call FUNC(addButton);
