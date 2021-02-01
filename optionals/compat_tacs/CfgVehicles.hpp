class CfgVehicles {
    class EGVAR(supplies,Recruit);

    class EGVAR(supplies,VIP): EGVAR(supplies,Recruit) {
        class TransportItems {
            MACRO_ADDITEM(tacs_Vest_Modular_Black,5);
        };
    };
};
