class CfgMagazines {
    class SLAMDirectionalMine_Wire_Mag;
    class GVAR(BreachingCharge_Magazine): SLAMDirectionalMine_Wire_Mag {
        scopeArsenal = 2;
        author = "Mike";
        mass = 5;
        displayName = CSTRING(BreachingCharge);
        descriptionShort = CSTRING(BreachingCharge_Description);
        ACEGVAR(explosives,SetupObject) = QGVAR(BreachingCharge_Place);

        class ACE_Triggers {
            SupportedTriggers[] = {"Command", "MK16_Transmitter"};
        };
    };
};
