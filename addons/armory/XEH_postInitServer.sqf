addMissionEventHandler ["HandleDisconnect", {
    params ["_disconnectedPlayer"];
    local _openedObject = _disconnectedPlayer getVariable [QGVAR(object), objNull];
    if (!isNull _openedObject) then {
        _openedObject setVariable [QGVAR(inUse), nil, true]
    };
}];
