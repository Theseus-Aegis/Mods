class Mode_SemiAuto;
class Mode_FullAuto;
class asdg_OpticRail;
class asdg_OpticRail1913: asdg_OpticRail {};

class CfgWeapons {
    class Rifle;
    class Rifle_Base_F: Rifle {
        class WeaponSlotsInfo;
    };

    // http://guns.connect.fi/gow/M95.html
    class bnae_rk95_base: Rifle_Base_F {
        ACE_barrelTwist=240.0;
        ACE_barrelLength=420.0;
        class Single: Mode_SemiAuto {
            dispersion=0.00044; // 1.5 MOA; default: 0.00058=2 MOA
        };
        class FullAuto: Mode_FullAuto {
            dispersion=0.00044; // 1.5 MOA; default: 0.00058=2 MOA
        };
    };

    class bnae_rk95_virtual: bnae_rk95_base {};

    class bnae_rk95r_virtual: bnae_rk95_virtual {
        ACE_RailHeightAboveBore=14.0;
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class asdg_OpticRail_bnae: asdg_OpticRail1913 {};
        };
    };

    class ItemCore;
    class InventoryMuzzleItem_Base_F;

    // ACE3 values: https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgWeapons.hpp#L643
    class bnae_suppressor_v2_base: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed=1.0;
            };
            class AmmoCoef {
                hit=1;
                typicalSpeed=1;
                airFriction=1;
                visibleFire=0.1;
                audibleFire=0.5;
                visibleFireTime=0.5;
                audibleFireTime=0.5;
                cost=1;
            };
            class MuzzleCoef {
                dispersionCoef="0.95f";
                artilleryDispersionCoef="1.0f";
                fireLightCoef="0.5f";
                recoilCoef="0.95f";
                recoilProneCoef="0.95f";
                minRangeCoef="1.0f";
                minRangeProbabCoef="1.0f";
                midRangeCoef="1.0f";
                midRangeProbabCoef="1.0f";
                maxRangeCoef="1.0f";
                maxRangeProbabCoef="1.0f";
            };
        };
    };

    // ACE3 values: https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgWeapons.hpp#L643
    class bnae_suppressor_base: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed=1.0;
            };
            class AmmoCoef {
                hit=1;
                typicalSpeed=1;
                airFriction=1;
                visibleFire=0.1;
                audibleFire=0.5;
                visibleFireTime=0.5;
                audibleFireTime=0.5;
                cost=1;
            };
            class MuzzleCoef {
                dispersionCoef="0.95f";
                artilleryDispersionCoef="1.0f";
                fireLightCoef="0.5f";
                recoilCoef="0.95f";
                recoilProneCoef="0.95f";
                minRangeCoef="1.0f";
                minRangeProbabCoef="1.0f";
                midRangeCoef="1.0f";
                midRangeProbabCoef="1.0f";
                maxRangeCoef="1.0f";
                maxRangeProbabCoef="1.0f";
            };
        };
    };
};
