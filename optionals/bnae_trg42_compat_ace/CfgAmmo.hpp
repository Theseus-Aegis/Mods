class CfgAmmo {
    class BulletBase;

    // https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L419
    class B_338LM_Ball: BulletBase {
        typicalSpeed=921; // muzzle velocity according with the barrel length
        airFriction=-0.00060841; // ACE3 value, default -0.00045
        ACE_caliber=8.585;
        ACE_bulletLength=39.573;
        ACE_bulletMass=16.2;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.322};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={921}; // muzzle velocity according with the barrel length
        ACE_barrelLengths[]={690};
    };

    // https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L446
    class B_338LM_APDS: B_338LM_Ball {
        typicalSpeed=828; // muzzle velocity according with the barrel length
        airFriction=-0.00053585; // ACE3 value, default -0.00022
        ACE_caliber=8.585;
        ACE_bulletLength=43.18;
        ACE_bulletMass=19.44;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.368};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={828}; // muzzle velocity according with the barrel length
        ACE_barrelLengths[]={690};
    };
};
