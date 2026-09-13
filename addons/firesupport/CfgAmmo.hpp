class CfgAmmo {
    // Hand Thrown
    class SmokeShellPurple;
    class GVAR(mortarAmmoHE): SmokeShellPurple {
        timeToLive = 25;
    };

    class SmokeShellBlue;
    class GVAR(mortarAmmoSmoke): SmokeShellBlue {
        timeToLive = 25;
    };

    class GVAR(artilleryAmmoHE): GVAR(mortarAmmoHE) {};
    class GVAR(artilleryAmmoSmoke): GVAR(mortarAmmoSmoke) {};

    // Grenade Launched
    class G_40mm_SmokePurple;
    class GVAR(mortarAmmoHEGL): G_40mm_SmokePurple {
        timeToLive = 25;
    };

    class G_40mm_SmokeBlue;
    class GVAR(mortarAmmoSmokeGL): G_40mm_SmokeBlue {
        timeToLive = 25;
    };

    class GVAR(artilleryAmmoHEGL): GVAR(mortarAmmoHEGL) {};
    class GVAR(artilleryAmmoSmokeGL): GVAR(mortarAmmoSmokeGL {};

    class GVAR(rocketAmmoHEGL): GVAR(mortarAmmoHEGL) {};
};
