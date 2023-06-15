class CfgAmmo {
    class ClaymoreDirectionalMine_Remote_Ammo;
    class CLASS(Breaching_Charge_Ammo): ClaymoreDirectionalMine_Remote_Ammo {
        model = "\A3\Weapons_F\Explosives\mine_SLAM_directional";
        hit = 5;
        indirectHit = 5;
        indirectHitRange = 2;
        mineModelDisabled = "\A3\Weapons_F\Explosives\mine_SLAM_directional";
        defaultMagazine = QCLASS(Breaching_Charge_Magazine);
        ace_explosives_magazine = QCLASS(Breaching_Charge_Magazine);
        ace_explosives_Explosive = QCLASS(Breaching_Charge_Ammo_Scripted);
    };
    class CLASS(Breaching_Charge_Ammo_Scripted): CLASS(Breaching_Charge_Ammo) {};
};
