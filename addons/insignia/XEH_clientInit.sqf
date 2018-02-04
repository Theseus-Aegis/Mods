#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

["CAManBase", "Take", FUNC(setInsignia)] call CBA_fnc_addClassEventHandler;
["CAManBase", "InventoryOpened", FUNC(getInsignia)] call CBA_fnc_addClassEventHandler;
