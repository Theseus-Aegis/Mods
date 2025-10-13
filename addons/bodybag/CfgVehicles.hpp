class CfgVehicles {

    class MapBoard_altis_F;
    class ACE_bodyBagObject: MapBoard_altis_F {
        ace_dragging_canCarry = 1; // 1 = enabled (0 disabled)
        ace_dragging_carryPosition[] = {0, 0.5, 1.2};  // XYZ offset, 0.5m ahead, 1.2m up.
        ace_dragging_carryDirection = 90; // Direction
        maximumLoad = 2000;
        transportMaxWeapons = 1;
        transportMaxMagazines = 1;
        transportMaxItems = 1;
    };

    class GVAR(Object_OrangeLogo): ACE_bodyBagObject {
        displayName = CSTRING(OrangeLogo_DisplayName);
        hiddenSelectionsTextures[] = {QPATHTOF(data\bodybag_orange_co.paa)};
    };
};
