class CfgAmmo {
    class BulletBase;

    // class ACE_303_Ball; https://github.com/acemod/ACE3/blob/e5a15d200f44df5fccc0bc5575d18d80b35538dd/extras/CfgAmmoReference.hpp#L412
    class B_303_Ball: BulletBase {
        typicalSpeed = 763; // muzzle velocity according with the barrel length
        airFriction = -0.00083;
        ACE_caliber = 7.899;
        ACE_bulletLength = 31.166;
        ACE_bulletMass = 11.2752;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.493};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {763}; // muzzle velocity according with the barrel length
        ACE_barrelLengths[] = {640.08};
    };
};
