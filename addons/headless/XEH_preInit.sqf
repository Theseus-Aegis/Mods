#include "script_component.hpp"

ADDON = false;

PREP(handleDisconnect);
PREP(moduleInit);
PREP(pass);
PREP(registerHeadless);

if (isServer) then {
    GVAR(headlessClients) = [];
};

ADDON = true;
