#include "script_component.hpp"

// Server EH
if (isServer) then {
    ["TAC_hideRadio", {
        PARAMS_1(_radio);
        hideObjectGlobal _radio;
    }] call ACE_FUNC(common,addEventHandler);
};
