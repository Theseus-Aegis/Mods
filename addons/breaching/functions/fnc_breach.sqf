#include "..\script_component.hpp"
/*
 * Author: commy2, Ampers, Jonpas
 * Destroys an obstacle or opens a door.
 *
 * Arguments:
 * 0: Wire <OBJECT>
 * 1: Obstacle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_wire, _obstacle] call tac_breaching_fnc_breach
 *
 * Public: No
 */

params ["_wire", "_obstacle"];

// Editor wall
if (_obstacle isKindOf "Wall" || {_obstacle isKindOf "Fence"}) exitWith {
    LOG("wall/fence");

    // Get height
    private _box = boundingBox _obstacle;
    private _bw0 = _obstacle modelToWorld (_box select 0);
    private _bw1 = _obstacle modelToWorld (_box select 1);
    private _height = (_bw1 select 2) - (_bw0 select 2);

    // Drop
    [{
        params ["_args", "_handlePFH"];
        _args params ["_obstacle", "_height"];

        if (_height <= 0) exitWith {
            [_handlePFH] call CBA_fnc_removePerFrameHandler;
            LOG("remove editor wall drop PFH");

            _obstacle setDamage 1;
            deleteVehicle _obstacle;
        };

        private _pos = getPosATL _obstacle;
        _obstacle setPosATL [_pos select 0, _pos select 1, (_pos select 2) - 0.1];
        _args set [1, _height - 0.1];
    }, 0.04, [_obstacle, _height]] call CBA_fnc_addPerFrameHandler;
};

// House
if (_obstacle isKindOf "House") exitWith {
    LOG("house");

    // Modified version of ace_interaction_fnc_getDoor
    private _position0 = (getPosASL _wire) vectorAdd [0, 0, 0];
    private _position1 = _position0 vectorAdd (vectorUp _wire);

    private _intersections = [_obstacle, "GEOM"] intersect [ASLtoAGL _position0, ASLtoAGL _position1];
    if (_intersections isEqualTo []) exitWith {};

    private _door = toLower ((_intersections select 0) select 0);

    // Check if door is glass because then we need to find the proper location of the door so we can use it
    if ((_door find "glass") != -1) then {
        _door = [10, _obstacle, _door] call ACEFUNC(interaction,getGlassDoor);
    };
    if (isNil "_door") exitWith {};
    TRACE_1("open door",_door);

    // Get animations
    private _doorAnimations = [_obstacle, _door] call ACEFUNC(interaction,getDoorAnimations);
    _doorAnimations params ["_animations"];
    if (_animations isEqualTo []) exitWith {};

    // Add handle on carrier
    if (typeOf _obstacle == "Land_Carrier_01_island_01_F") then {
        private _handle = format ["door_handle_%1_rotate_1", (_animations select 0) select [5, 1]];
        TRACE_1("carrier handle",_handle);
        _animations pushBack _handle;
    };

    {
        // instantly open
        _obstacle animate [_x, 1, true];
    } forEach _animations;
};

private _obstaclePosWorld = ASLtoAGL getPosWorld _obstacle;

// Terrain wall (won't get destroyed, hide it instead)
if (_obstacle in (nearestTerrainObjects [_obstaclePosWorld, ["WALL", "FENCE"], 1])) exitWith {
    LOG("terrain wall/fence");

    _obstacle setDamage 1;
    [{
        hideObjectGlobal _this;
    }, _obstacle, 1] call CBA_fnc_waitAndExecute;
};

// Tree
if (_obstacle in (nearestTerrainObjects [_obstaclePosWorld, ["TREE", "SMALL TREE"], 1]) || {_obstacle isKindOf "Base_CUP_Tree"}) exitWith {
    LOG("tree");

    _obstacle setDamage 1;
};

TRACE_2("no valid obstacle found",_obstacle,typeOf _obstacle);
