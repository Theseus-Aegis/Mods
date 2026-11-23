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
            {
                ctrlShow [_x, GVAR(system) == 1];
            } forEach [STASHALLPIC, STASHALLBTN];
        };
    }, _player, 1] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

// Stash All done: what the locker didn't take is still in the box
[QEGVAR(apollo,lockerStashAllDone), {
    params ["_player", "_left"];
    if (_left isEqualTo []) exitWith {
        [LSTRING(StashedAll), 2.5] call ACEFUNC(common,displayTextStructured);
    };
    private _names = _left apply {
        private _displayName = getText ((_x call CBA_fnc_getItemConfig) >> "displayName");
        if (_displayName == "") then { _displayName = getText ((_x call CBA_fnc_getObjectConfig) >> "displayName"); };
        [_displayName, _x] select (_displayName == "")
    };
    [format [localize LSTRING(StashedAllLeft), _names joinString ", "], 4] call ACEFUNC(common,displayTextStructured);
}] call CBA_fnc_addEventHandler;

// Kit taken (or refused): refresh the kits, as the locker has changed
[QEGVAR(apollo,lockerKitTaken), {
    params ["_player", "_success"];
    if (!_success) then {
        [LSTRING(KitTakeFailed), 2.5] call ACEFUNC(common,displayTextStructured);
    };
    if (!isNull (_player getVariable [QGVAR(object), objNull]) && {GVAR(selectedCategory) == "kits"}) then {
        [lbCurSel DROPDOWN] call FUNC(dialogControl_kits);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(Locker), "ContainerOpened", {
    params ["_container", "_unit"];

    // Only run if the setting is enabled.
    if (GVAR(lockerClear)) then {
        [QGVAR(checkContainer), _container] call CBA_fnc_serverEvent;
    };
}] call CBA_fnc_addClassEventHandler;
