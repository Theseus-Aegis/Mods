#include "script_component.hpp"

ADDON = false;

PREP(handleDisconnect);
PREP(moduleInit);
PREP(transferGroups);
PREP(registerHeadlessClient);

if (isServer) then {
    GVAR(headlessClients) = [];
    ["TAC_HeadlessClientJoined", FUNC(registerHeadlessClient)] call ACE_Common_fnc_addEventHandler;
};

ADDON = true;
