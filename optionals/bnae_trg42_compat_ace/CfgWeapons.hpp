class Mode_SemiAuto;
class asdg_OpticRail1913;

class CfgWeapons {
    class Rifle_Base_F;
    class Rifle_Long_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };

    // http://cdn1.sako.fi/sites/default/files/TRG-42_Tech_specs.pdf
    class bnae_trg42_base: Rifle_Long_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist = 254.0; // 1:10"
        ACE_barrelLength = 690.0; // 27 1/8"
        ACE_RailHeightAboveBore = 1.41739;

        class WeaponSlotsInfo: WeaponSlotsInfo {
            class asdg_OpticRail_bnae: asdg_OpticRail1913 {};
        };

        class Single: Mode_SemiAuto {
            dispersion = 0.00023; // 0.8 MOA; default: 0.00044 = 1.5 MOA
        };
    };

    class ItemCore;
    class InventoryMuzzleItem_Base_F;

    // ACE3 values: https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgWeapons.hpp#L643
    class bnae_silencer_base: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.0;
            };
            class AmmoCoef {
                hit = 1;
                typicalSpeed = 1;
                airFriction = 1;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1;
            };
            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class bnae_muzzle_base: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.0; // ACE3 value, default 0.6
            };
            // default values
            class AmmoCoef {
                hit = 1;
                typicalSpeed = 1;
                airFriction = 1;
                visibleFire = 0.8;
                audibleFire = 0.9;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1;
            };
            // ACE3 values
            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };
};
