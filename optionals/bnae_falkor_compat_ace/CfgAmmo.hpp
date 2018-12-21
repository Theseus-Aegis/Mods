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
