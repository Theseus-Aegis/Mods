#include "..\script_component.hpp"
/*
 * Author: Ampersand
 * Returns WeaponHolderSimulated with copy of chestpack
 *
 * Arguments:
 * 0: Backpack <OBJECT>
 * 1: Loadout <ARRAY>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_backpack, (getUnitLoadout _unit) select 5 select 1] call tac_backpack_on_chest_fnc_setBackpackLoadout;
 *
 * Public: No
 */

params ["_backpack", "_loadout"];
if (isNull _backpack) exitWith {false};

[QGVAR(clearAllCargo), [_backpack]] call CBA_fnc_globalEvent;

// add items
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgVehicles = configFile >> "CfgVehicles";
{
    if (typeName (_x select 0) == "Array") then {
        // weapon with attachments
        for "_i" from 1 to (_x select 1) do {
            _backpack addWeaponWithAttachmentsCargoGlobal _x;
        };
    } else {
        private _cargoClass = (_x select 0);
        if (isClass (_cfgMagazines >> _cargoClass)) then {

            _backpack addMagazineAmmoCargo _x;
            // Above command sometimes fails on its own, like with PCML Missile in NATO Ammo Bearer's backpack
            [{
                params ["_backpack", "_mag", "_count", "_rounds"];
                private _countInBackpack = {_x isEqualTo [_mag, _rounds]} count magazinesAmmoCargo _backpack;
                if (_countInBackpack < _count) then {
                    _backpack addMagazineAmmoCargo [_mag, 1, _rounds];
                };
                _countInBackpack == _count
            }, {}, [_backpack] + _x, 1, {
                WARNING("chestpackToHolder timed out adding magazines");
                TRACE_1("Container: ",_this);
            }] call CBA_fnc_waitUntilAndExecute;

        } else {
            // backpacks
            private _cfgCargoBackpack = _cfgVehicles >> _cargoClass;
            if (isClass _cfgCargoBackpack) then {
                _backpack addBackpackCargoGlobal [_cargoClass, 1];
                [QGVAR(clearCargoBackpacks), [_backpack]] call CBA_fnc_globalEvent;
            } else {
                _backpack addItemCargoGlobal _x;
            };
        };
    };
} forEach _loadout;

true
