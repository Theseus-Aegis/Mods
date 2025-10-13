#include "..\script_component.hpp"
/*
 * Author: JoramD, MikeMF
 * Ground Vehicle Spawner, altered from Olympus.
 * Vehicle list is provided by the mission template.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Spawn Position <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Vehicle_Spawner, Vehicle_Position] call MFUNC(vehicleSpawner)
 */

params ["_spawnController", "_spawnPosition"];

private _mainAction = [
    QGVAR(spawnVehicle),
    "Spawn Vehicle",
    "a3\ui_f\data\gui\rsc\rscdisplayarsenal\spacegarage_ca.paa",
    {},
    {true}
] call ACEFUNC(interact_menu,createAction);

[_spawnController, 0, ["ACE_MainActions"], _mainAction] call ACEFUNC(interact_menu,addActionToObject);

{
    _x params ["_classname"];
    private _displayName = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
    private _spawnVehicleAction = [
        format [QGVAR(spawn_%1), _classname],
        format ["Spawn %1", _displayName],
        "",
        {
            (_this select 2) params ["_classname", "_spawnPosition"];
            if (_spawnPosition nearEntities 5 isEqualTo []) then {
                private _vehicle = createVehicle [_classname, _spawnPosition, [], 0, "CAN_COLLIDE"];
                _vehicle setDir (getDir _spawnPosition);

                clearItemCargoGlobal _vehicle;
                clearBackpackCargoGlobal _vehicle;
                clearWeaponCargoGlobal _vehicle;
                clearMagazineCargoGlobal _vehicle;

                _vehicle addItemCargoGlobal ["ToolKit", 1];
                _vehicle setVariable ["ace_cargo_noRename", true, true];

                ["ACE_Wheel", _vehicle] call ACEFUNC(cargo,loadItem);
                ["ACE_Wheel", _vehicle] call ACEFUNC(cargo,loadItem);
            } else {
                "Could not spawn vehicle, spawn position is blocked." call CBA_fnc_notify;
            };
        },
        {true},
        {},
        [_classname, _spawnPosition, _displayName]
    ] call ACEFUNC(interact_menu,createAction);

    [_spawnController, 0, ["ACE_MainActions", QGVAR(spawnVehicle)], _spawnVehicleAction] call ACEFUNC(interact_menu,addActionToObject);
} forEach tac_scripts_vehicleSpawnerList;

// Only ground vehicles on the pad, with no crewmembers can be removed.
private _deleteAction = [
    QGVAR(deleteSpawnedVehicleAction),
    "Remove Vehicle From Spawn Pad",
    "a3\3den\data\displays\display3den\panelleft\entitylist_delete_ca.paa",
    {
        (_this select 2) params ["_spawnPosition"];
        private _spawnPositionEntities = _spawnPosition nearEntities 5;
        {
            private _entity = _x;
            private _vehicleCheck = ["Car", "Tank", "TrackedAPC", "WheeledAPC"] findIf {_entity isKindOf _x};
            if (_vehicleCheck != -1) then {
                if (fullCrew _x isNotEqualTo []) exitWith {
                    "Cannot delete vehicle that is manned." call CBA_fnc_notify;
                };
                deleteVehicle _X;
            };
        } forEach _spawnPositionEntities;
    },
    {
        (_this select 2) params ["_spawnPosition"];
        _spawnPosition nearEntities [["Car","Tank","TrackedAPC","WheeledAPC"],5] isNotEqualTo []
    },
    {},
    [_spawnPosition]
] call ACEFUNC(interact_menu,createAction);

[_spawnController, 0, ["ACE_MainActions"], _deleteAction] call ACEFUNC(interact_menu,addActionToObject);
