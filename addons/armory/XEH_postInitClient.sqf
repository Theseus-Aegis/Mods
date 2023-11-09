#include "script_component.hpp"

// Exit on Headless Clients
if (!hasInterface) exitWith {};

[QGVAR(init), {
    params ["_object"];
    [_object] call FUNC(init);
}] call CBA_fnc_addEventHandler;

[QGVAR(Locker), "containerOpened", {
    [_this select 0] call FUNC(talkingBox);
}, true, [], true] call CBA_fnc_addClassEventHandler;

GVAR(boxLines) = [
    "tacr_box_100_quid",
    "tacr_box_business_dog",
    "tacr_box_buy_another",
    "tacr_box_contraband",
    "tacr_box_die_anyway",
    "tacr_box_dire_decisions",
    "tacr_box_dress_up",
    "tacr_box_epr_ammo",
    "tacr_box_fashion_sense",
    "tacr_box_go_out",
    "tacr_box_good_heavens",
    "tacr_box_gpnvgs",
    "tacr_box_grenade_egging",
    "tacr_box_helmet",
    "tacr_box_money_and_needs",
    "tacr_box_more_ammo",
    "tacr_box_reasonably_priced",
    "tacr_box_shambles"
];

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
