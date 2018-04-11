/*
 * Author: Corello
 * Checks through the players equipment and compares it against the allowed list of civilian gear and displays the status for each item.
 * Call from functions\fn_addCheckDisguiseAction.sqf
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(checkDisguise);
 */
#include "script_component.hpp"

params ["_playerObject"];

private _disguisedActionText = parseText format ["<img image='\a3\ui_f\data\igui\cfg\holdactions\holdaction_search_ca.paa' size='3' align='center'/><br/>%1<br/><br/>Head:<br/>%2<br/><br/>Glasses:<br/>%3<br/><br/>Uniform:<br/>%4<br/><br/>Vest:<br/>%5<br/><br/>Backpack:<br/>%6",
    ['<t color="#FFFFFF" align="center">' + localize LSTRING(NotFullyDisguised) + '</t>','<t color="#FFFFFF" align="center">' + localize LSTRING(FullyDisguised) + '</t>'] select (captive _playerObject),
    ['<t color="#FF0000">' + localize LSTRING(NotDisguised) + '</t>','<t color="#12B317">' + localize LSTRING(Disguised) + '</t>'] select (headgear _playerObject in GVAR(civilianHeadgear)),
    ['<t color="#FF0000">' + localize LSTRING(NotDisguised) + '</t>','<t color="#12B317">' + localize LSTRING(Disguised) + '</t>'] select (goggles _playerObject in GVAR(civilianGoggles)),
    ['<t color="#FF0000">' + localize LSTRING(NotDisguised) + '</t>','<t color="#12B317">' + localize LSTRING(Disguised) + '</t>'] select (uniform _playerObject in GVAR(civilianUniforms)),
    ['<t color="#FF0000">' + localize LSTRING(NotDisguised) + '</t>','<t color="#12B317">' + localize LSTRING(Disguised) + '</t>'] select (vest _playerObject in GVAR(civilianVests)),
    ['<t color="#FF0000">' + localize LSTRING(NotDisguised) + '</t>','<t color="#12B317">' + localize LSTRING(Disguised) + '</t>'] select (backpack _playerObject in GVAR(civilianBackpacks))];
	[_disguisedActionText, 10] call ACEFUNC(common,displayTextStructured);