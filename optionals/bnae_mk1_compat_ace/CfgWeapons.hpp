class Mode_SemiAuto;

class CfgWeapons {
    class Rifle_Long_Base_F;

    class bnae_mk1_base: Rifle_Long_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 640.08;
        ACE_RailHeightAboveBore = 1.8;
        class Single: Mode_SemiAuto {
            dispersion = 0.00044;
        };
    };
};
