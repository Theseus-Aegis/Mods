class CfgMagazines {
    // Hand thrown - Does not include rocket support because that is stupid and death.
    class SmokeShellPurple;
    class SmokeShellBlue;
    class GVAR(mortarHESignal): SmokeShellPurple {
        ammo = QGVAR(mortarAmmoHE);
        descriptionShort = "Mortar HE";
        displayName = "Mortar HE Signal (Thrown)";
        displayNameShort = "Mortar HE";
    };
    class GVAR(mortarSmokeSignal): SmokeShellBlue {
        ammo = QGVAR(mortarAmmoSmoke);
        descriptionShort = "Mortar Smoke";
        displayName = "Mortar Smoke Signal (Thrown)";
        displayNameShort = "Mortar Smoke";
    };

    class GVAR(artilleryHESignal): GVAR(mortarHESignal) {
        ammo = QGVAR(artilleryAmmoHE);
        descriptionShort = "Artillery HE";
        displayName = "Artillery HE Signal (Thrown)";
        displayNameShort = "Artillery HE";
    };
    class GVAR(artillerySmokeSignal): GVAR(mortarSmokeSignal) {
        ammo = QGVAR(artilleryAmmoSmoke);
        descriptionShort = "Artillery Smoke";
        displayName = "Artillery Smoke Signal (Thrown)";
        displayNameShort = "Artillery Smoke";
    };

    // GL rounds
    class 1Rnd_SmokePurple_Grenade_shell;
    class 1Rnd_SmokeBlue_Grenade_shell;

    class GVAR(mortarHESignalGL): 1Rnd_SmokePurple_Grenade_shell {
        ammo = QGVAR(mortarAmmoHEGL);
        descriptionShort = "Mortar HE (GL)";
        displayName = "Mortar HE Signal (GL)";
        displayNameShort = "Mortar HE (GL)";
    };
    class GVAR(mortarSmokeSignalGL): 1Rnd_SmokeBlue_Grenade_shell {
        ammo = QGVAR(mortarAmmoSmokeGL);
        descriptionShort = "Mortar Smoke (GL)";
        displayName = "Mortar Smoke Signal (GL)";
        displayNameShort = "Mortar Smoke (GL)";
    };

    class GVAR(artilleryHESignalGL): GVAR(mortarHESignalGL) {
        ammo = QGVAR(artilleryAmmoHEGL);
        descriptionShort = "Artillery HE (GL)";
        displayName = "Artillery HE Signal (GL)";
        displayNameShort = "Artillery HE (GL)";
    };
    class GVAR(artillerySmokeSignalGL): GVAR(mortarSmokeSignalGL) {
        ammo = QGVAR(artilleryAmmoSmokeGL);
        descriptionShort = "Artillery Smoke (GL)";
        displayName = "Artillery Smoke Signal (GL)";
        displayNameShort = "Artillery Smoke (GL)";
    };

    class GVAR(rocketHESignalGL): GVAR(mortarHESignalGL) {
        ammo = QGVAR(rocketAmmoHEGL);
        descriptionShort = "Rocket HE (GL)";
        displayName = "Rocket HE Signal (GL)";
        displayNameShort = "Rocket HE (GL)";
    };
};
