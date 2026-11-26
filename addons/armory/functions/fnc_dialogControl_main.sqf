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

// Show/Hide Main (slots 1-6 are the left column, 7-12 the right, top to bottom; 5 and 11 are an empty row, 5 is Launchers hidden)
{
    ctrlShow [_x, _show];
} forEach [
    MAINFRAME1, MAINBTN1,
    MAINFRAME2, MAINBTN2,
    MAINFRAME3, MAINBTN3,
    MAINFRAME4, MAINBTN4,
    //MAINFRAME5, MAINBTN5,
    MAINFRAME6, MAINBTN6,
    MAINFRAME7, MAINBTN7,
    MAINFRAME8, MAINBTN8,
    MAINFRAME9, MAINBTN9,
    MAINFRAME10, MAINBTN10,
    //MAINFRAME11, MAINBTN11,
    MAINFRAME12, MAINBTN12,
    TAKESTASHFRAME, CAMERAPIC, TAKESTASHBTN // Take/Stash's button doubles as Camera
];


// Exit if Hiding Main
if (!_show) exitWith {};

// Set up Main
[MAINBTN1, LLSTRING(BtnRifles), QUOTE(['rifle'] call FUNC(dialogControl)), LLSTRING(BtnRiflesTooltip)] call FUNC(setButton);
[MAINBTN7, LLSTRING(BtnPistols), QUOTE(['pistol'] call FUNC(dialogControl)), LLSTRING(BtnPistolsTooltip)] call FUNC(setButton);
[MAINBTN2, LLSTRING(BtnApparel), QUOTE(['wearable'] call FUNC(dialogControl)), LLSTRING(BtnApparelTooltip)] call FUNC(setButton);
[MAINBTN8, LLSTRING(BtnBackpacks), QUOTE(['backpack'] call FUNC(dialogControl)), LLSTRING(BtnBackpacksTooltip)] call FUNC(setButton);
[MAINBTN3, LLSTRING(BtnAmmo), QUOTE(['ammo'] call FUNC(dialogControl)), LLSTRING(BtnAmmoTooltip)] call FUNC(setButton);
[MAINBTN9, LLSTRING(BtnAttachments), QUOTE(['attachment'] call FUNC(dialogControl)), LLSTRING(BtnAttachmentsTooltip)] call FUNC(setButton);
[MAINBTN4, LLSTRING(BtnItems), QUOTE(['item'] call FUNC(dialogControl)), LLSTRING(BtnItemsTooltip)] call FUNC(setButton);
[MAINBTN10, LLSTRING(BtnInsignias), QUOTE(['insignia'] call FUNC(dialogControl)), LLSTRING(BtnInsigniasTooltip)] call FUNC(setButton);
[MAINBTN5, LLSTRING(BtnLaunchers), QUOTE(['launcher'] call FUNC(dialogControl)), LLSTRING(BtnLaunchersTooltip)] call FUNC(setButton);
[MAINBTN6, LLSTRING(BtnKits), QUOTE(['kits'] call FUNC(dialogControl)), LLSTRING(BtnKitsTooltip)] call FUNC(setButton);
[MAINBTN12, LLSTRING(BtnStash), QUOTE(['stash'] call FUNC(dialogControl)), LLSTRING(BtnStashTooltip)] call FUNC(setButton);

// Camera (an icon in Take/Stash's frame, no label)
ctrlSetText [TAKESTASHBTN, ""];
buttonSetAction [TAKESTASHBTN, QUOTE(call FUNC(openCamera))];
CTRL(TAKESTASHBTN) ctrlSetTooltip LLSTRING(BtnOpenCameraTooltip);
