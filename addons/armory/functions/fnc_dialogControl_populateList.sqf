#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Populates lists.
 *
 * Arguments:
 * 0: Armory Data <ARRAY>
 *   Entry:
 *   0: Classname <STRING>
 *   1: Sub-Category <STRING>
 *   2: Description <STRING> (unused)
 *   3: Quantity <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[armoryData]] call tac_armory_fnc_dialogControl_populateList
 *
 * Public: No
 */

params ["_armoryData"];

private _selSubCategory = lbText [DROPDOWN, (lbSelection CTRL(DROPDOWN)) select 0]; // SubCategory

//TRACE_2("Populating list",_armoryData,_selSubCategory);

// Clear List
lnbClear NLIST;
private _rowNum = 0; // Needed for proper row images and data

// Fill List
_armoryData sort true; // Errors when used in combination with forEach
{
    _x params ["_className", "_subCategory", "", "_quantity"];

    // Skip listing this item if there are none of them
    if (_quantity > 0) then {
        // Get correct config
        private _configCfg = configName (configHierarchy (_className call CBA_fnc_getItemConfig) param [1, configNull]);
        if (_configCfg == "") then {
            _configCfg = configName (configHierarchy (_className call CBA_fnc_getObjectConfig) param [1, configNull]);
        };
        if (_configCfg == "") then {
            _configCfg = ["", "CfgUnitInsignia"] select (isClass (configFile >> "CfgUnitInsignia" >> _className));
        };
        if (_configCfg == "") exitWith {ERROR_MSG_1("Config type not found for classname: '%1'",_className)};

        // Check sub-category for proper listing
        if (_selSubCategory == "All" || {_selSubCategory == _subCategory} || {_selSubCategory == "Compatible" && [_className] call FUNC(isCompatible)}) then {
            private _displayName = getText (configFile >> _configCfg >> _className >> "displayName"); // Get display name from config
            private _tooltip = _displayName; // Display name gets cropped

            // Cut full name to prevent overlapping in shown name
            if (count _displayName > DISPLAYNAME_LENGTH + 3) then {
                _displayName = [_displayName, 0, DISPLAYNAME_LENGTH] call CBA_fnc_substr;
                _displayName = [_displayName] call CBA_fnc_rightTrim;
                _displayName = [_displayName, "..."] joinString "";
            };

            private _quantityList = [str _quantity, "∞"] select (_configCfg == "CfgUnitInsignia");
            lnbAddRow [NLIST, ["", _displayName, _quantityList]];
            lbSetTooltip [NLIST, _rowNum * 3, _tooltip]; // Requires multiplication by 3 to be set on proper index (no idea why)

            // Set hidden data with classname to displayName column and quantity to quantity column
            lnbSetData [NLIST, [_rowNum, 1], _className];
            lnbSetData [NLIST, [_rowNum, 2], str _quantity];

            // Set picture
            private _pictureType = ["picture", "texture"] select (_configCfg == "CfgUnitInsignia");
            private _picture = getText (configFile >> _configCfg >> _className >> _pictureType);
            lnbSetPicture [NLIST, [_rowNum, 0], _picture];
            _rowNum = _rowNum + 1;
        };
    };
} forEach _armoryData;

// Make global for sub-category selection (Dialog.hpp)
GVAR(armoryData) = _armoryData;
