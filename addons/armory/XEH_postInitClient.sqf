#include "script_component.hpp"

// Exit on Headless Clients
if (!hasInterface) exitWith {};

[QGVAR(init), {
    params ["_object"];
    [_object] call FUNC(init);
}] call CBA_fnc_addEventHandler;

[QEGVAR(apollo,lockerActionDone), {
    params ["_player"];

    TRACE_1("Waiting for stashing to stop for full refresh",CBA_missionTime);
    [{
        params ["_player"];
        CBA_missionTime > (_player getVariable [QGVAR(lastStashTime), 0]) + 1
    }, {
        params ["_player"];
        // Only update if still open and in "Stash" screen
        if (!isNull (_player getVariable [QGVAR(object), objNull]) && {GVAR(selectedCategory) == "stash"}) then {
            TRACE_1("Stash force update",_player);
            private _boxContents = call FUNC(getBoxContents);

            private _subtractOnFullRefresh = ACE_player getVariable [QGVAR(subtractOnFullRefresh), []];
            {
                _x params ["_selectedItem", "_selectedAmount"];
                TRACE_2("Subtracting on force update",_selectedItem,_selectedAmount);
                _boxContents = [_boxContents, _selectedItem, _selectedAmount] call FUNC(subtractData);
                _subtractOnFullRefresh deleteAt _forEachIndex;
            } forEach [];
            TRACE_1("Finish subtract on full refresh",_subtractOnFullRefresh);

            [_boxContents] call FUNC(updateData);
        };
    }, _player, 1] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

// Talking Armory Boxes
[QGVAR(Locker), "containerOpened", {
    [QGVAR(talkingBoxEvent), [_this select 0]] call CBA_fnc_serverEvent;
}, true, [], true] call CBA_fnc_addClassEventHandler;
