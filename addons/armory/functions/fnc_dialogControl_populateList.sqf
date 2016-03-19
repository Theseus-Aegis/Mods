/*
 * Author: Jonpas
 * Populates lists.
 *
 * Arguments:
 * 0: Armory Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[armoryData]] call tac_armory_fnc_dialogControl_populateList
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_armoryData"];

private _selectedSubCategory = lbText [DROPDOWN, (lbSelection CTRL(DROPDOWN)) select 0]; // SubCategory

TRACE_2("Populating list",_armoryData,_selectedSubCategory);

// Clear List
lnbClear NLIST;
private _rowNum = 0; // Needed for proper row images and data

// Fill List
{
    _x params ["_className", "_subCategory", "_description", "_quantity"];

    // Skip listing this item if there are none of them
    if (parseNumber _quantity > 0) then {
        // Get correct config
        private _configCfg = [_className] call ACE_Common_fnc_getConfigType;
        if (_configCfg == "") then {
            _configCfg = [_className] call ACE_Common_fnc_getConfigTypeObject;
        };
        if (_configCfg == "") exitWith {ACE_LOGERROR_1("Config Type not found for classname: %1",_className)};

        // Check sub-category for proper listing
        if (_selectedSubCategory == "" || {_selectedSubCategory == _subCategory}) then {
            private _displayName = getText (configFile >> _configCfg >> _className >> "displayName"); // Get display name from config
            private _tooltip = _displayName; // Display name gets cropped

            // Cut full name to prevent overlapping in shown name
            if ([_displayName] call CBA_fnc_strLen > DISPLAYNAME_LENGTH + 3) then {
                _displayName = [_displayName, 0, DISPLAYNAME_LENGTH] call CBA_fnc_substr;
                _displayName = [_displayName] call CBA_fnc_rightTrim;
                _displayName = [_displayName, "..."] joinString "";
            };

            lnbAddRow [NLIST, ["", _displayName, _quantity]];
            lbSetTooltip [NLIST, _rowNum, _tooltip];

            // Set hidden data with classname to displayName column and quantity to quantity column
            lnbSetData [NLIST, [_rowNum, 1], _className];
            lnbSetData [NLIST, [_rowNum, 2], _quantity];

            // Set picture
            private _picture = getText (configFile >> _configCfg >> _className >> "picture");
            lnbSetPicture [NLIST, [_rowNum, 0], _picture];
            _rowNum = _rowNum + 1;
        };
    };
} forEach _armoryData;

// Make global for sub-category selection (Dialog.hpp)
GVAR(armoryData) = _armoryData;
