/*
 * Author: Jonpas
 * Handles sitting down to and standing up from a chair.
 *
 * Arguments:
 * Chair <OBJECT>
 * OR
 * 0: Chair <OBJECT>
 * 1: (Optional) Direction and Position <ARRAY>
 * 1.0: Direction Offset <NUMBER>
 * 1.1: Position Offset for modelToWorld <ARRAY>
 * 2: (Optional) Animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * <arg> call TAC_Misc_fnc_chair;
 * [<arg0] call TAC_Misc_fnc_chair;
 * [<arg0>, <arg1>] call TAC_Misc_fnc_chair;
 * [<arg0>, [<arg1.0>, <arg1.1>], <arg2>] call TAC_Misc_fnc_chair;
 */
#include "script_component.hpp"

_chair = [_this, 0, _this] call BIS_fnc_param;
_posArg = [_this, 1, [], [[]]] call BIS_fnc_param;
_animArg = [_this, 2, [], [""]] call BIS_fnc_param;

// Only do animation handling if one is not defined through a parameter
_animList = [];
if (count _animArg == 0) then {
    // Animations (pre-defined for addAction condition)
    _animList = [
        "HubSittingChairUA_idle1",
        "HubSittingChairUA_idle2",
        "HubSittingChairUA_idle3",
        "HubSittingChairUA_move1",
        "HubSittingChairUB_idle1",
        "HubSittingChairUB_idle2",
        "HubSittingChairUB_idle3",
        "HubSittingChairUB_move1",
        "HubSittingChairUC_idle1",
        "HubSittingChairUC_idle2",
        "HubSittingChairUC_idle3",
        "HubSittingChairUC_move1",
        "HubSittingChairA_idle1",
        "HubSittingChairA_idle2",
        "HubSittingChairA_idle3",
        "HubSittingChairA_move1",
        "HubSittingChairB_idle1",
        "HubSittingChairB_idle2",
        "HubSittingChairB_idle3",
        "HubSittingChairB_move1",
        "HubSittingChairC_idle1",
        "HubSittingChairC_idle2",
        "HubSittingChairC_idle3",
        "HubSittingChairC_move1"
    ];
} else {
    // Put specified animation to the array for processing
    _animList = [_animArg];
};

// Set all animation names to lower-case (for addAction evaluation)
_indexCount = -1;
{
    _indexCount = _indexCount + 1;
    _animList set [_indexCount, toLower _x];
} forEach _animList;


// Action for sitting down
_chair addAction ["<t color='#0099FF'>Sit Down</t>", {
    _chair = _this select 0; // Object addAction is assigned to
    _player = _this select 1; // Object activating addAction

    _addActionArgs = _this select 3;
    _animList = _addActionArgs select 0; // List of sitting animations (Argument)
    _dirAndPos = _addActionArgs select 1; // Array with custom Direction and Position

    // Select random animation
    _anim = _animList select (floor (random (count _animList)));

    // Because Arma decides to set different position based on animation and using switchMove here only is even weirder, who knows...
    _player switchMove "amovpknlmstpsraswrfldnon";

    // Set Direction and Position per classname if not supplied in parameters
    if (count _dirAndPos == 0) then {
        // Sit based on object
        switch (typeOf _chair) do {
            case "Land_CampingChair_V1_F": { // Folding Chair
                _player setDir ((getDir _chair) + 180);
                _player setPos (_chair modelToWorld [0, -0.1, -0.45]);
            };
            case "Land_CampingChair_V2_F": { // Camping Chair
                _player setDir ((getDir _chair) + 180);
                _player setPos (_chair modelToWorld [0, -0.1, -0.45]);
            };
            case "Land_ChairPlastic_F": { // Chair (Plastic)
                _player setDir ((getDir _chair) + 90);
                _player setPos (_chair modelToWorld [-0.1, 0, -0.4]);
            };
            case "Land_ChairWood_F": { // Chair (Wooden)
                _player setDir ((getDir _chair) + 180);
                _player setPos (_chair modelToWorld [0, 0, 0]);
            };
            case "Land_OfficeChair_01_F": { // Office Chair
                _player setDir ((getDir _chair) + 180);
                _player setPos (_chair modelToWorld [0, 0, -0.6]);
            };
            case "Land_FieldToilet_F": { // Field Toilet
                if (count _animList > 0) then {
                    _anim = "HubSittingChairUB_idle1"; // BasicDriver kicks out
                };
                _player setDir ((getDir _chair) + 180);
                _player setPos (_chair modelToWorld [0, 0.75, -1.1]);
            };
            case "Land_ToiletBox_F": { // Toiletbox
                if (count _animList > 0) then {
                    _anim = "HubSittingChairUB_idle1"; // BasicDriver kicks out
                };
                _player setDir ((getDir _chair) + 180);
                _player setPos (_chair modelToWorld [0, 0.75, -1.1]);
            };
            case "Land_RattanChair_01_F": { // Rattan Chair
                _player setDir ((getDir _chair) + 180);
                _player setPos (_chair modelToWorld [0.07, 0.17, -1]); // Can't properly adjust
            };
            default { // Default - Chair (Wooden)
                _player setDir ((getDir _chair) + 180);
                _player setPos (_chair modelToWorld [0, 0, 0]);
            };
        };
    } else {
        _direction = _dirAndPos select 0; // Custom Direction
        _position = _dirAndPos select 1; // Custom Position

        // Sit based on supplied parameters
        _player setDir ((getDir _chair) + _direction);
        _player setPos (_chair modelToWorld _position);
    };
    [[_player, _anim], "TAC_Misc_fnc_switchMove", true, false, true] call BIS_fnc_MP; // switchMove is local
    _chair setVariable ["TAC_Misc_seatOccupied", true, true]; // Set variable to prevent multiple people sitting on one object


    // Action for standing up, comes up after sitting down
    _player addAction ["<t color='#0099FF'>Stand Up</t>", {
        _player = _this select 1; // Object activating addAction
        _actionID = _this select 2; // ID of addAction
        _chair = _this select 3; // Object player is sitting on (Argument)

        // Stand
        [[_player, ""], "TAC_Misc_fnc_switchMove", true, false, true] call BIS_fnc_MP; // switchMove is local
        _player removeAction _actionID;
        _chair setVariable ["TAC_Misc_seatOccupied", nil, true];
    }, _chair, 6];

}, [_animList, _posArg], 6, true, true, "", format ["(_target distance _this) < 2 && {!((animationState _this) in %1)} && {abs(speed _this) < 1} && {isNil{_target getVariable 'TAC_Misc_seatOccupied'}}", _animList]]; // Format because addAction condition is not in the same scope
