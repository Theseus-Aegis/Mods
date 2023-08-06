class CfgWeapons {
    class M134_minigun;
    class M134_MELB: M134_minigun {
        // Revert to vanilla
        class LowROF: Mode_FullAuto {
            class StandardSound {
                begin1[] = {"A3\Sounds_F\arsenal\weapons_vehicles\gatling_762mm\762mm_01_burst", 3.98107 , 1, 1300 , {2, 36879}};
                soundBegin[] = {"begin1", 1};
            };
        };
    };
};
