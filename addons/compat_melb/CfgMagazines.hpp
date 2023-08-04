class CfgMagazines {
    class 5000Rnd_762x51_Belt;
    class 6000Rnd_762x51_Belt_Red_MELB: 5000Rnd_762x51_Belt {
        // Fix "flipping" with AFM - disable recoil
        muzzleImpulseFactor[] = {0, 0}; // default: {0.6, 0.5}
    };

    class 500Rnd_127x99_mag_Tracer_Red;
    class 1300Rnd_127x99_mag_Tracer_Red_MELB: 500Rnd_127x99_mag_Tracer_Red {
        // Fix "flipping" with AFM - disable recoil
        muzzleImpulseFactor[] = {0, 0}; // default: {0.9, 0.4}
    };
};
