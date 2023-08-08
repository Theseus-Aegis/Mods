class CfgMagazines {
    class SLAMDirectionalMine_Wire_Mag;
    class GVAR(BreachingCharge_Mag): SLAMDirectionalMine_Wire_Mag {
        scopeArsenal = 2;
        author = "Mike";
        displayName = CSTRING(BreachingCharge);
        descriptionShort = CSTRING(BreachingCharge_Description);
        mass = 5;

        ammo = QGVAR(BreachingCharge_Ammo);
        ACEGVAR(explosives,SetupObject) = QGVAR(BreachingCharge_Place);

        class ACE_Triggers {
            SupportedTriggers[] = {"Command", "MK16_Transmitter"};
        };
    };
};
