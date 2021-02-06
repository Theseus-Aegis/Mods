#include "script_component.hpp"
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

params ["_show"];

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
    MAINPIC10, MAINBTN10,
    //MAINPIC11, MAINBTN11,
    MAINPIC12, MAINBTN12,
    TAKESTASHPIC, TAKESTASHBTN // Doubles as Camera
];


// Exit if Hiding Main
if (!_show) exitWith {};

// Set up Main
ctrlSetText [MAINPIC1, QPATHTOF(UI\btnCategory_rifle.paa)];
buttonSetAction [MAINBTN1, QUOTE(['rifle'] call FUNC(dialogControl))];
CTRL(MAINBTN1) ctrlSetTooltip localize LSTRING(BtnRiflesTooltip);

ctrlSetText [MAINPIC2, QPATHTOF(UI\btnCategory_pistol.paa)];
buttonSetAction [MAINBTN2, QUOTE(['pistol'] call FUNC(dialogControl))];
CTRL(MAINBTN2) ctrlSetTooltip localize LSTRING(BtnPistolsTooltip);

ctrlSetText [MAINPIC3, QPATHTOF(UI\btnCategory_launcher.paa)];
buttonSetAction [MAINBTN3, QUOTE(['launcher'] call FUNC(dialogControl))];
CTRL(MAINBTN3) ctrlSetTooltip localize LSTRING(BtnLaunchersTooltip);

ctrlSetText [MAINPIC4, QPATHTOF(UI\btnCategory_ammo.paa)];
buttonSetAction [MAINBTN4, QUOTE(['ammo'] call FUNC(dialogControl))];
CTRL(MAINBTN4) ctrlSetTooltip localize LSTRING(BtnAmmoTooltip);

ctrlSetText [MAINPIC5, QPATHTOF(UI\btnCategory_item.paa)];
buttonSetAction [MAINBTN5, QUOTE(['item'] call FUNC(dialogControl))];
CTRL(MAINBTN5) ctrlSetTooltip localize LSTRING(BtnItemsTooltip);

ctrlSetText [MAINPIC6, QPATHTOF(UI\btnCategory_attachment.paa)];
buttonSetAction [MAINBTN6, QUOTE(['attachment'] call FUNC(dialogControl))];
CTRL(MAINBTN6) ctrlSetTooltip localize LSTRING(BtnAttachmentsTooltip);

ctrlSetText [MAINPIC7, QPATHTOF(UI\btnCategory_backpack.paa)];
buttonSetAction [MAINBTN7, QUOTE(['backpack'] call FUNC(dialogControl))];
CTRL(MAINBTN7) ctrlSetTooltip localize LSTRING(BtnBackpacksTooltip);

ctrlSetText [MAINPIC8, QPATHTOF(UI\btnCategory_wearable.paa)];
buttonSetAction [MAINBTN8, QUOTE(['wearable'] call FUNC(dialogControl))];
CTRL(MAINBTN8) ctrlSetTooltip localize LSTRING(BtnApparelTooltip);

/*ctrlSetText [MAINPIC9, QPATHTOF(UI\btnCategory_.paa)];
buttonSetAction [MAINBTN9, QUOTE([''] call FUNC(dialogControl))];
CTRL(MAINBTN9) ctrlSetTooltip "Access ";*/

ctrlSetText [MAINPIC10, QPATHTOF(UI\btnCategory_insignia.paa)];
buttonSetAction [MAINBTN10, QUOTE(['insignia'] call FUNC(dialogControl))];
CTRL(MAINBTN10) ctrlSetTooltip localize LSTRING(BtnInsigniasTooltip);

/*ctrlSetText [MAINPIC11, QPATHTOF(UI\btnCategory_locker.paa)];
buttonSetAction [MAINBTN11, QUOTE([''] call FUNC(dialogControl))];
CTRL(MAINBTN11) ctrlSetTooltip "Access ";*/

ctrlSetText [MAINPIC12, QPATHTOF(UI\btnStash.paa)];
buttonSetAction [MAINBTN12, QUOTE(['stash'] call FUNC(dialogControl))];
CTRL(MAINBTN12) ctrlSetTooltip localize LSTRING(BtnStashTooltip);

// Camera
ctrlSetText [TAKESTASHPIC, QPATHTOF(UI\btnCamera.paa)];
buttonSetAction [TAKESTASHBTN, QUOTE(call FUNC(openCamera))];
CTRL(TAKESTASHBTN) ctrlSetTooltip localize LSTRING(BtnOpenCameraTooltip);
