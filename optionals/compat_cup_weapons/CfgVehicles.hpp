class CfgVehicles {
    class EGVAR(supplies,Engineer);
    class Box_NATO_WpsLaunch_F;

    class EGVAR(supplies,Recruit): EGVAR(supplies,Engineer) {
        class TransportItems {
            MACRO_ADDITEM(cup_muzzle_pbs4,5);
            MACRO_ADDITEM(CUP_NVG_PVS14,5);
        };
    };

    class EGVAR(supplies,Launchers): Box_NATO_WpsLaunch_F {
        class TransportWeapons {
            MACRO_ADDWEAPON(CUP_launch_M136,3);
        };
    };
};
