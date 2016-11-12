class ACE_Settings {
    class GVAR(enabled) {
        value = 0;
        typeName = "BOOL";
        displayName = ACECSTRING(Common,Enabled);
        description = CSTRING(EnabledDesc);
    };
    class GVAR(enabledPlayers) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(EnabledPlayers);
        description = CSTRING(EnabledPlayersDesc);
    };
    class GVAR(enabledVehicles) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(EnabledVehicles);
        description = CSTRING(EnabledVehiclesDesc);
    };
};
