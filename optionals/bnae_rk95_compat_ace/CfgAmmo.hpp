class CfgAmmo {
    class BulletBase;

    // https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L340
    class B_762x39_Ball_F : BulletBase {
        airFriction = -0.00154815;
        typicalSpeed = 719; // muzzle velocity according with the barrel length
        ACE_caliber = 7.823;
        ACE_bulletLength = 28.956;
        ACE_bulletMass = 7.9704;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.275}; // AtragMx G1 BC
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {719}; // muzzle velocity according with the barrel length
        ACE_barrelLengths[] = {420};
    };
};
