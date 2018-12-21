class CfgMagazines {
    class CA_Magazine;

    class 30Rnd_762x39_Mag_F: CA_Magazine {
        initSpeed = 719; // muzzle velocity according with the barrel length, default 730
    };
    class 30Rnd_762x39_Magazine: 30Rnd_762x39_Mag_F {
        ammo = "B_762x39_Ball_F"; // AtragMx GunList "7.62x39mm", default ammo "B_762x51_Ball"
        initSpeed = 719; // muzzle velocity according with the barrel length, default 730
    };
    class 30Rnd_762x39_Mag_Green_F: 30Rnd_762x39_Mag_F {
        initSpeed = 719; // muzzle velocity according with the barrel length, default 730
    };
    class 30Rnd_762x39_Mag_Tracer_F: 30Rnd_762x39_Mag_F {
        initSpeed = 719; // muzzle velocity according with the barrel length, default 730
    };
    class 30Rnd_762x39_Mag_Tracer_Green_F: 30Rnd_762x39_Mag_F {
        initSpeed = 719; // muzzle velocity according with the barrel length, default 730
    };
};
