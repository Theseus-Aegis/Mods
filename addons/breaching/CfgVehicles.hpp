class CfgVehicles {
    class SLAMDirectionalMine;
    class CLASS(Breaching_Charge): SLAMDirectionalMine {
        author = "Mike";
        ammo = QCLASS(Breaching_Charge_Ammo);
        displayName = "Breaching Charge";
    };

    class ACE_Explosives_Place_SLAM;
    class CLASS(Breaching_Charge_Place): ACE_Explosives_Place_SLAM {
        author = "Mike";
        displayName = "Breaching Charge";

        class EventHandlers {
            init = "";
            deleted = "";
        };
    };
};
