class Mode_SemiAuto;
class asdg_OpticRail;
class asdg_OpticRail1913: asdg_OpticRail {};

class CfgWeapons {
    class Rifle_Base_F;

    class Rifle_Long_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };

    // https://www.falkordefense.com/rifles/petra/
    class bnae_falkor_base: Rifle_Long_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist=254.0; // 1:10"
        ACE_barrelLength=508.0; // 20", the new version has a 22" barrel but the 3D model is the old version with a 20" barrel
        ACE_RailHeightAboveBore=3.0;
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class asdg_OpticRail_bnae: asdg_OpticRail1913 {};
        };
        class Single: Mode_SemiAuto {
            dispersion=0.00029; // 1 MOA; default: 0.00044=1.5 MOA
        };
    };
};
