class CfgVehicles {
    class EGVAR(supplies,Engineer);

    class EGVAR(supplies,Recruit): EGVAR(supplies,Engineer) {
        class TransportItems {
            MACRO_ADDITEM(cup_muzzle_pbs4,5);
            MACRO_ADDITEM(CUP_NVG_PVS14,5);
        };
    };
};
