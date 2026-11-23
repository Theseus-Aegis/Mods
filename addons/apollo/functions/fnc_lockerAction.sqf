#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Puts an item from the box into the player's locker, or takes one out into the box, through the
 * extension. The website only answers with data; the box is changed here.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Type ("put" or "remove") <STRING>
 * 2: Container <OBJECT>
 * 3: Item Class Name <STRING>
 * 4: Box Item Class Name <STRING> (an ACRE radio with its ID)
 * 5: Quantity <STRING>
 * 6: Keep Magazines <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "remove", box, "class", "class", "5", false] call tac_apollo_fnc_lockerAction
 *
 * Public: No
 */

params ["_player", "_type", "_container", "_itemClass", "_itemClassBox", "_quantity", "_keepMagazines"];

private _playerID = getPlayerUID _player;
private _count = parseNumber _quantity;
private _isMagazine = isClass (configFile >> "CfgMagazines" >> _itemClassBox);

// Stashing magazines: the fullest go first; the website keeps the rounds of the partly used ones
// among them ("" for anything else)
private _partial = "";
private _full = getNumber (configFile >> "CfgMagazines" >> _itemClassBox >> "count");
if (_type == "put" && {_isMagazine}) then {
    private _rounds = (magazinesAmmoCargo _container select {_x select 0 == _itemClassBox}) apply {_x select 1};
    _rounds sort false;
    _partial = (_rounds select [0, _count]) select {_x < _full};
};

private _serverReply = ["lockerAction", _type, _playerID, _itemClass, _itemClassBox, _quantity, _keepMagazines, _partial] call FUNC(callServerExt);
if (_serverReply != "ready") exitWith {};

private _entries = [_playerID] call FUNC(lockerQueue);
if (isNil "_entries") exitWith {};

if (_type == "put") then {
    // Remove what was stashed: of magazines the full ones, then each partly used one by its rounds
    if (_isMagazine) then {
        [_container, _itemClassBox, _count - count _partial, false, _full] call FUNC(boxCargo);
        {
            [_container, _itemClassBox, 1, false, _x] call FUNC(boxCargo);
        } forEach _partial;
    } else {
        [_container, _itemClassBox, _count, false, -1, _keepMagazines] call FUNC(boxCargo);
    };

    // Notify Armory about finalization to force refresh box contents when stashing
    [QGVAR(lockerActionDone), [_player], _player] call CBA_fnc_targetEvent;
} else {
    {
        _x params ["_class", "_number", "_rounds"];
        [_container, _class, _number, true, _rounds] call FUNC(boxCargo);
    } forEach _entries;
};
