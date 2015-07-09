/*
 * Author: Jonpas
 * Sets up main menu.
 *
 * Arguments:
 * 0: Show/Hide Main Menu <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call tac_armory_fnc_dialogControl_main
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_show);

// Show/Hide Main
{
    ctrlShow [_x, _show];
} forEach [
    MAINPIC1, MAINBTN1,
    MAINPIC2, MAINBTN2,
    MAINPIC3, MAINBTN3,
    MAINPIC4, MAINBTN4,
    MAINPIC5, MAINBTN5,
    MAINPIC6, MAINBTN6,
    MAINPIC7, MAINBTN7,
    MAINPIC8, MAINBTN8,
    //MAINPIC9, MAINBTN9,
    //MAINPIC10, MAINBTN10,
    //MAINPIC11, MAINBTN11,
    MAINPIC12, MAINBTN12
];


// Exit if Hiding Main
if (!_show) exitWith {};

// Set up Main
ctrlSetText [MAINPIC1, QUOTE(PATHTOF(UI\btnCategory_rifle.paa))];
buttonSetAction [MAINBTN1, QUOTE(['rifle'] call FUNC(dialogControl))]; 
CTRL(MAINBTN1) ctrlSetTooltip "Access Rifles";

ctrlSetText [MAINPIC2, QUOTE(PATHTOF(UI\btnCategory_pistol.paa))];
buttonSetAction [MAINBTN2, QUOTE(['pistol'] call FUNC(dialogControl))];
CTRL(MAINBTN2) ctrlSetTooltip "Access Pistols";

ctrlSetText [MAINPIC3, QUOTE(PATHTOF(UI\btnCategory_launcher.paa))];
buttonSetAction [MAINBTN3, QUOTE(['launcher'] call FUNC(dialogControl))];
CTRL(MAINBTN3) ctrlSetTooltip "Access Launchers";

ctrlSetText [MAINPIC4, QUOTE(PATHTOF(UI\btnCategory_ammo.paa))];
buttonSetAction [MAINBTN4, QUOTE(['ammo'] call FUNC(dialogControl))];
CTRL(MAINBTN4) ctrlSetTooltip "Access Ammo";

ctrlSetText [MAINPIC5, QUOTE(PATHTOF(UI\btnCategory_item.paa))];
buttonSetAction [MAINBTN5, QUOTE(['item'] call FUNC(dialogControl))];
CTRL(MAINBTN5) ctrlSetTooltip "Access Items";

ctrlSetText [MAINPIC6, QUOTE(PATHTOF(UI\btnCategory_attachment.paa))];
buttonSetAction [MAINBTN6, QUOTE(['attachment'] call FUNC(dialogControl))];
CTRL(MAINBTN6) ctrlSetTooltip "Access Attachments";

ctrlSetText [MAINPIC7, QUOTE(PATHTOF(UI\btnCategory_backpack.paa))];
buttonSetAction [MAINBTN7, QUOTE(['backpack'] call FUNC(dialogControl))];
CTRL(MAINBTN7) ctrlSetTooltip "Access Backpacks";

ctrlSetText [MAINPIC8, QUOTE(PATHTOF(UI\btnCategory_wearable.paa))];
buttonSetAction [MAINBTN8, QUOTE(['wearable'] call FUNC(dialogControl))];
CTRL(MAINBTN8) ctrlSetTooltip "Access Apparel";

/*ctrlSetText [MAINPIC9, QUOTE(PATHTOF(UI\btnCategory_.paa))];
buttonSetAction [MAINBTN9, QUOTE([''] call FUNC(dialogControl))];
CTRL(MAINBTN9) ctrlSetTooltip "Access ";*/

/*ctrlSetText [MAINPIC10, QUOTE(PATHTOF(UI\btnCategory_kits.paa))];
buttonSetAction [MAINBTN10, QUOTE([''] call FUNC(dialogControl))];
CTRL(MAINBTN10) ctrlSetTooltip "Access ";*/

/*ctrlSetText [MAINPIC11, QUOTE(PATHTOF(UI\btnCategory_locker.paa))];
buttonSetAction [MAINBTN11, QUOTE([''] call FUNC(dialogControl))];
CTRL(MAINBTN11) ctrlSetTooltip "Access ";*/

ctrlSetText [MAINPIC12, QUOTE(PATHTOF(UI\btnStash.paa))];
buttonSetAction [MAINBTN12, QUOTE(['stash'] call FUNC(dialogControl))];
CTRL(MAINBTN12) ctrlSetTooltip "Stash Box Contents";
