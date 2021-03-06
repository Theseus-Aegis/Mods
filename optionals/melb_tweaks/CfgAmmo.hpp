class CfgAmmo {
    class B_762x51_Minigun_Tracer_Red;
    class B_762x51_Minigun_Tracer_Red_MELB: B_762x51_Minigun_Tracer_Red {
        // Revert to vanilla
        tracerScale = 0.6;
        tracerStartTime = 0.0075;
        tracerEndTime = 5;
    };

    class B_762x51_Ball;
    class B_762x51_Ball_MELB: B_762x51_Ball {
        // Revert to vanilla
        model = "\A3\Weapons_f\Data\bullettracer\tracer_white";
        tracerScale = 1.2;
        tracerStartTime = 0.073;
        tracerEndTime = 2.15957;
    };

    class B_127x99_SLAP_Tracer_Red;
    class B_127x99_SLAP_MELB: B_127x99_SLAP_Tracer_Red {
        // Revert to vanilla
        tracerScale = 1.3;
        tracerStartTime = 0.075;
        tracerEndTime = 1;
    };
};
