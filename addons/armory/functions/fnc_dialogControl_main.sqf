#include "..\script_component.hpp"
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
    //MAINPIC3, MAINBTN3,
    MAINPIC4, MAINBTN4,
    MAINPIC5, MAINBTN5,
    MAINPIC6, MAINBTN6,
    MAINPIC7, MAINBTN7,
    MAINPIC8, MAINBTN8,
    MAINPIC9, MAINBTN9,
    MAINPIC10, MAINBTN10,
    //MAINPIC11, MAINBTN11,
    MAINPIC12, MAINBTN12,
    TAKESTASHPIC, TAKESTASHBTN // Doubles as Camera
];


// Exit if Hiding Main
if (!_show) exitWith {};

// Set up Main
[MAINPIC1, MAINBTN1, LSTRING(BtnRifles), QUOTE(['rifle'] call FUNC(dialogControl)), LSTRING(BtnRiflesTooltip)] call FUNC(setButton);
[MAINPIC2, MAINBTN2, LSTRING(BtnPistols), QUOTE(['pistol'] call FUNC(dialogControl)), LSTRING(BtnPistolsTooltip)] call FUNC(setButton);
[MAINPIC3, MAINBTN3, LSTRING(BtnLaunchers), QUOTE(['launcher'] call FUNC(dialogControl)), LSTRING(BtnLaunchersTooltip)] call FUNC(setButton);
[MAINPIC4, MAINBTN4, LSTRING(BtnAmmo), QUOTE(['ammo'] call FUNC(dialogControl)), LSTRING(BtnAmmoTooltip)] call FUNC(setButton);
[MAINPIC5, MAINBTN5, LSTRING(BtnItems), QUOTE(['item'] call FUNC(dialogControl)), LSTRING(BtnItemsTooltip)] call FUNC(setButton);
[MAINPIC6, MAINBTN6, LSTRING(BtnAttachments), QUOTE(['attachment'] call FUNC(dialogControl)), LSTRING(BtnAttachmentsTooltip)] call FUNC(setButton);
[MAINPIC7, MAINBTN7, LSTRING(BtnBackpacks), QUOTE(['backpack'] call FUNC(dialogControl)), LSTRING(BtnBackpacksTooltip)] call FUNC(setButton);
[MAINPIC8, MAINBTN8, LSTRING(BtnApparel), QUOTE(['wearable'] call FUNC(dialogControl)), LSTRING(BtnApparelTooltip)] call FUNC(setButton);
[MAINPIC9, MAINBTN9, LSTRING(BtnKits), QUOTE(['kits'] call FUNC(dialogControl)), LSTRING(BtnKitsTooltip)] call FUNC(setButton);
[MAINPIC10, MAINBTN10, LSTRING(BtnInsignias), QUOTE(['insignia'] call FUNC(dialogControl)), LSTRING(BtnInsigniasTooltip)] call FUNC(setButton);

// MAINPIC11, MAINBTN11: free
[MAINPIC12, MAINBTN12, LSTRING(BtnStash), QUOTE(['stash'] call FUNC(dialogControl)), LSTRING(BtnStashTooltip)] call FUNC(setButton);

// Camera (an icon, no label)
ctrlSetText [TAKESTASHPIC, QPATHTOF(UI\btnCamera.paa)];
ctrlSetText [TAKESTASHBTN, ""];
buttonSetAction [TAKESTASHBTN, QUOTE(call FUNC(openCamera))];
CTRL(TAKESTASHBTN) ctrlSetTooltip localize LSTRING(BtnOpenCameraTooltip);
