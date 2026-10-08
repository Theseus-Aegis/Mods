class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] +={
            QGVAR(mortarHEMuzzle),
            QGVAR(mortarSmokeMuzzle),
            QGVAR(artilleryHEMuzzle),
            QGVAR(artillerySmokeMuzzle)
        };

        class ThrowMuzzle;
        class GVAR(mortarHEMuzzle): ThrowMuzzle {
            magazines[] = {QGVAR(mortarHESignal)};
        };
        class GVAR(mortarSmokeMuzzle): ThrowMuzzle {
            magazines[] = {QGVAR(mortarSmokeSignal)};
        };
        class GVAR(artilleryHEMuzzle): ThrowMuzzle {
            magazines[] = {QGVAR(artilleryHESignal)};
        };
        class GVAR(artillerySmokeMuzzle): ThrowMuzzle {
            magazines[] = {QGVAR(artillerySmokeSignal)};
        };
    };
};
