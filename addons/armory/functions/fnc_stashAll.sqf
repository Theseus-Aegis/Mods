#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Stashes everything in the box into the locker (Chronos): one server event, the server stashes
 * each item as a single stash does (EFUNC(apollo,lockerStashAll)). The list refreshes when it's
 * done (lockerActionDone), with a hint of what the locker didn't take (lockerStashAllDone).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_armory_fnc_stashAll
 *
 * Public: No
 */

private _object = ACE_player getVariable [QGVAR(object), objNull];
if (isNull _object) exitWith {
    ERROR("Object is nil");
};

TRACE_1("Stash all",_object);
[QEGVAR(apollo,lockerStashAll), [player, _object]] call CBA_fnc_serverEvent;
ACE_player setVariable [QGVAR(lastStashTime), CBA_missionTime];

{
    ctrlShow [_x, false];
} forEach [TAKESTASHFRAME, TAKESTASHBTN, STASHALLFRAME, STASHALLBTN]; // until the list is refreshed
