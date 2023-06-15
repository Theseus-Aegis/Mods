class CfgMagazines {
    class SLAMDirectionalMine_Wire_Mag;
    class CLASS(Breaching_Charge_Magazine): SLAMDirectionalMine_Wire_Mag {
        scopeArsenal = 2;
        author = "Mike";
        mass = 5;
        displayName = "Breaching Charge";
        descriptionShort = ""; // fill this out later when we decide what it can / cannot do
        ace_explosives_SetupObject = QCLASS(Breaching_Charge_Place);

        class ACE_Triggers {
            SupportedTriggers[] = {"Command", "MK16_Transmitter"};
        };
    };
};
