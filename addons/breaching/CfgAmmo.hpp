class CfgAmmo {
    class ClaymoreDirectionalMine_Remote_Ammo;
    class GVAR(BreachingCharge_Ammo): ClaymoreDirectionalMine_Remote_Ammo {
        model = "\A3\Weapons_F\Explosives\mine_SLAM_directional";
        mineModelDisabled = "\A3\Weapons_F\Explosives\mine_SLAM_directional";

        hit = 5;
        indirectHit = 5;
        indirectHitRange = 2;
        defaultMagazine = QGVAR(BreachingCharge_Mag);

        ACEGVAR(explosives,magazine) = QGVAR(BreachingCharge_Mag);
        ACEGVAR(explosives,Explosive) = QGVAR(BreachingCharge_Ammo);
    };
};
