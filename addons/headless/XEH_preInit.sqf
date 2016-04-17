#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    GVAR(headlessClients) = [];
    GVAR(inRebalance) = false;
    ["TAC_HeadlessClientJoined", FUNC(handleConnectHC)] call ACE_Common_fnc_addEventHandler;
};

ADDON = true;
