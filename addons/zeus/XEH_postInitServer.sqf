#include "script_component.hpp"

// Exit on Server
if (!isServer) exitWith {};

// Add Add Object To Chronos (server)
["AddObjectToChronos", {_this call FUNC(moduleAddObjectToChronosServer)}] call ACE_Common_fnc_addEventHandler;
