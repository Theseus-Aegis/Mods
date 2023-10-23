class CfgVehicles {
    class ACE_bodyBagObject;
    class GVAR(Bodybag_Object_OrangeLogo): ACE_bodyBagObject {
        maximumLoad = 0;
        transportMaxWeapons = 1;
        transportMaxMagazines = 1;
        transportMaxItems = 1;
        ace_dragging_canCarry = 1; // 1 = enabled (0 disabled)
        ace_dragging_carryPosition[] = {0, 0.5, 1.2};  // XYZ offset, 0.5m ahead, 1.2m up.
        ace_dragging_carryDirection = 90; // Direction
        // Needs new texture, if not done in time will just be black for now.
        //hiddenSelectionsTextures[] = {QPATHTOF(apl-sa\bodybag_co.paa)};
    };
};
