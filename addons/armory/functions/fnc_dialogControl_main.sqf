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
[MAINPIC1, MAINBTN1, LLSTRING(BtnRifles), QUOTE(['rifle'] call FUNC(dialogControl)), LLSTRING(BtnRiflesTooltip)] call FUNC(setButton);
[MAINPIC2, MAINBTN2, LLSTRING(BtnPistols), QUOTE(['pistol'] call FUNC(dialogControl)), LLSTRING(BtnPistolsTooltip)] call FUNC(setButton);
[MAINPIC3, MAINBTN3, LLSTRING(BtnLaunchers), QUOTE(['launcher'] call FUNC(dialogControl)), LLSTRING(BtnLaunchersTooltip)] call FUNC(setButton);
[MAINPIC4, MAINBTN4, LLSTRING(BtnAmmo), QUOTE(['ammo'] call FUNC(dialogControl)), LLSTRING(BtnAmmoTooltip)] call FUNC(setButton);
[MAINPIC5, MAINBTN5, LLSTRING(BtnItems), QUOTE(['item'] call FUNC(dialogControl)), LLSTRING(BtnItemsTooltip)] call FUNC(setButton);
[MAINPIC6, MAINBTN6, LLSTRING(BtnAttachments), QUOTE(['attachment'] call FUNC(dialogControl)), LLSTRING(BtnAttachmentsTooltip)] call FUNC(setButton);
[MAINPIC7, MAINBTN7, LLSTRING(BtnBackpacks), QUOTE(['backpack'] call FUNC(dialogControl)), LLSTRING(BtnBackpacksTooltip)] call FUNC(setButton);
[MAINPIC8, MAINBTN8, LLSTRING(BtnApparel), QUOTE(['wearable'] call FUNC(dialogControl)), LLSTRING(BtnApparelTooltip)] call FUNC(setButton);
[MAINPIC9, MAINBTN9, LLSTRING(BtnKits), QUOTE(['kits'] call FUNC(dialogControl)), LLSTRING(BtnKitsTooltip)] call FUNC(setButton);
[MAINPIC10, MAINBTN10, LLSTRING(BtnInsignias), QUOTE(['insignia'] call FUNC(dialogControl)), LLSTRING(BtnInsigniasTooltip)] call FUNC(setButton);

// MAINPIC11, MAINBTN11: free
[MAINPIC12, MAINBTN12, LLSTRING(BtnStash), QUOTE(['stash'] call FUNC(dialogControl)), LLSTRING(BtnStashTooltip)] call FUNC(setButton);

// Camera (an icon, no label)
ctrlSetText [TAKESTASHPIC, QPATHTOF(UI\btnCamera.paa)];
ctrlSetText [TAKESTASHBTN, ""];
buttonSetAction [TAKESTASHBTN, QUOTE(call FUNC(openCamera))];
CTRL(TAKESTASHBTN) ctrlSetTooltip LLSTRING(BtnOpenCameraTooltip);
