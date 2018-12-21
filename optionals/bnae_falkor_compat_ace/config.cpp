class CfgPatches {
    class bnae_falkor_compat_ace {
        requiredaddons[]= {
            "bnae_falkor",
            "bnae_core",
            "cba_jr"
        };
        requiredversion=0.1;
        weapons[]= {};
        units[]= {};
    };
};

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

class CfgMagazines {
    class CA_Magazine;

    // AtragMx GunList ".300WM Berger OTM"
    class 10Rnd_300WM_Magazine: CA_Magazine {
        initSpeed=800; // muzzle velocity according with the barrel length, default 990
    };
};

class CfgAmmo {
    class BulletBase;

    // https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L292
    class B_300WM_Ball: BulletBase {
        airFriction=-0.00055262; // ACE3 value, default -0.00060
        typicalSpeed=800; // muzzle velocity according with the barrel length
        caliber=2.0;
        hit=19;
        ACE_caliber=7.823;
        ACE_bulletLength=40.691;
        ACE_bulletMass=14.904;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.368};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={800}; // muzzle velocity according with the barrel length
        ACE_barrelLengths[]={508.0};
    };
};
