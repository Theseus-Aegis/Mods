class CfgWeapons {
    class Default;
    class Put: Default {
        muzzles[] += {QCLASS(Breaching_Charge_Muzzle)};

        class PutMuzzle: Default {};
        class CLASS(Breaching_Charge_Muzzle): PutMuzzle {
            magazines[] = {QCLASS(Breaching_Charge_Magazine)};
            displayName = "Breaching Charge";
        };
    };
};
