class CfgWeapons {
    class M134_minigun;
    class M134_MELB: M134_minigun {
        // Revert to vanilla
        class LowROF: Mode_FullAuto {
            class StandardSound {
                soundClosure[] = {"closure1", 1};
            };
        };
    };
};
