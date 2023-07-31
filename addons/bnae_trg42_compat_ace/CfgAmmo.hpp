class CfgAmmo {
    class BulletBase;
    class B_338LM_Ball: BulletBase {
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
        ACE_ballisticCoefficients[] = {0.322};
        ACE_barrelLengths[] = {508,660.4,711.2};
        ACE_bulletLength = 39.573;
        ACE_bulletMass = 16.2;
        ACE_caliber = 8.61;
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {880,915,925};
        ACE_standardAtmosphere = "ICAO";
        ACE_velocityBoundaries[] = {};
    };
    class B_338LM_APDS: B_338LM_Ball {};
};
