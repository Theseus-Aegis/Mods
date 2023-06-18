class CfgWeapons {
    class Default;
    class Put: Default {
        muzzles[] += {QGVAR(BreachingCharge_Muzzle)};

        class PutMuzzle: Default {};
        class GVAR(BreachingCharge_Muzzle): PutMuzzle {
            magazines[] = {QGVAR(BreachingCharge_Mag)};
            displayName = CSTRING(BreachingCharge);
        };
    };
};
