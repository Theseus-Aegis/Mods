class CfgAnimationSourceSounds {
    class GVAR(TargetLargeSound) {
        class PopUp {
            loop = 0;
            sound0[] = {"a3\missions_f_beta\data\sounds\firing_drills\target_pop-up_large.wss", 5, 1, 25};
            sound[] = {"sound0", 1};
            terminate = 0;
            trigger = "phase factor [0.01, 0.01]";
        };
        class PopDown {
            loop = 0;
            sound0[] = {"a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_large.wss", 5, 1, 25};
            sound[] = {"sound0", 1};
            terminate = 0;
            trigger = "phase factor [0.99, 0.99]";
        };
    };
    class GVAR(TargetSmallSound) {
        class PopUp {
            loop = 0;
            sound0[] = {"a3\missions_f_beta\data\sounds\firing_drills\target_pop-up_small.wss", 1, 1, 25};
            sound[] = {"sound0", 1};
            terminate = 0;
            trigger = "phase factor [0.01, 0.01]";
        };
        class PopDown {
            loop = 0;
            sound0[] = {"a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_small.wss", 1, 1, 25};
            sound[] = {"sound0", 1};
            terminate = 0;
            trigger = "phase factor [0.99, 0.99]";
        };
    };
};
