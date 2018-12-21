class CfgMagazines {
    class CA_Magazine;

    // AtragMx GunList ".338LM 250gr"
    class 5Rnd_338LM_Magazine: CA_Magazine {
       initSpeed = 921; // muzzle velocity according with the barrel length, default 1005
    };

    // AtragMx GunList ".338LM 300gr"
    class 5Rnd_APDS_338LM_Magazine: 5Rnd_338LM_Magazine {
       initSpeed = 828; // muzzle velocity according with the barrel length, default 1120
    };
};
