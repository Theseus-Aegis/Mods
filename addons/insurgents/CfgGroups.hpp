class CfgGroups {
    // INDEPENDENT
    class Indep {
        class IND_G_F {
            class Infantry {
                class GVAR(IND_G_F_sentry) {
                    faction = "IND_G_F";
                    name = CSTRING(Group_Sentry);
                    icon = "\A3\ui_f\data\map\markers\nato\n_inf.paa";
                    side = 2;

                    class Unit0 {
                        position[] = {0, 0, 0};
                        rank = "CORPORAL";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit1 {
                        position[] = {5, -5, 0};
                        rank = "PRIVATE";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                };
                class GVAR(IND_G_F_fireteam) {
                    faction = "IND_G_F";
                    name = CSTRING(Group_FireTeam);
                    icon = "\A3\ui_f\data\map\markers\nato\n_inf.paa";
                    side = 2;

                    class Unit0 {
                        position[] = {0, 0, 0};
                        rank = "SERGEANT";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit1 {
                        position[] = {5, -5, 0};
                        rank = "PRIVATE";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit2 {
                        position[] = {-5, -5, 0};
                        rank = "PRIVATE";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit3 {
                        position[] = {10, -10, 0};
                        rank = "PRIVATE";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                };
                class GVAR(IND_G_F_squad) {
                    name = CSTRING(Group_Squad);
                    faction = "IND_G_F";
                    icon = "\A3\ui_f\data\map\markers\nato\n_inf.paa";
                    side = 2;

                    class Unit0 {
                        position[] = {0, 0, 0};
                        rank = "SERGEANT";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit1 {
                        position[] = {5, -5, 0};
                        rank = "CORPORAL";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit2 {
                        position[] = {-5, -5, 0};
                        rank = "PRIVATE";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit3 {
                        position[] = {10, -10, 0};
                        rank = "PRIVATE";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit4 {
                        position[] = {-10, -10, 0};
                        rank = "PRIVATE";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit5 {
                        position[] = {15, -15, 0};
                        rank = "PRIVATE";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit6 {
                        position[] = {-15, -15, 0};
                        rank = "PRIVATE";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                    class Unit7 {
                        position[] = {20, -20, 0};
                        rank = "PRIVATE";
                        side = 2;
                        vehicle = QGVAR(soldier_i);
                    };
                };
            };
        };
    };
    // OPFOR
    class East {
        class OPF_G_F {
            class Infantry {
                class GVAR(OPF_G_F_sentry) {
                    faction = "OPF_G_F";
                    name = CSTRING(Group_Sentry);
                    icon = "\A3\ui_f\data\map\markers\nato\o_inf.paa";
                    side = 0;

                    class Unit0 {
                        position[] = {0, 0, 0};
                        rank = "CORPORAL";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit1 {
                        position[] = {5, -5, 0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                };
                class GVAR(OPF_G_F_fireteam) {
                    faction = "OPF_G_F";
                    name = CSTRING(Group_FireTeam);
                    icon = "\A3\ui_f\data\map\markers\nato\o_inf.paa";
                    side = 0;

                    class Unit0 {
                        position[] = {0, 0, 0};
                        rank = "SERGEANT";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit1 {
                        position[] = {5, -5, 0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit2 {
                        position[] = {-5, -5, 0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit3 {
                        position[] = {10, -10, 0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                };
                class GVAR(OPF_G_F_squad) {
                    name = CSTRING(Group_Squad);
                    faction = "OPF_G_F";
                    icon = "\A3\ui_f\data\map\markers\nato\o_inf.paa";
                    side = 0;

                    class Unit0 {
                        position[] = {0, 0, 0};
                        rank = "SERGEANT";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit1 {
                        position[] = {5, -5, 0};
                        rank = "CORPORAL";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit2 {
                        position[] = {-5, -5, 0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit3 {
                        position[] = {10, -10, 0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit4 {
                        position[] = {-10, -10, 0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit5 {
                        position[] = {15, -15, 0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit6 {
                        position[] = {-15, -15, 0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                    class Unit7 {
                        position[] = {20, -20, 0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = QGVAR(soldier_o);
                    };
                };
            };
        };
    };
    // BLUFOR
    class West {
        class Guerilla {
            class Infantry {
                class GVAR(BLU_G_F_sentry) {
                    faction = "BLU_G_F";
                    name = CSTRING(Group_Sentry);
                    icon = "\A3\ui_f\data\map\markers\nato\b_inf.paa";
                    side = 1;

                    class Unit0 {
                        position[] = {0, 0, 0};
                        rank = "CORPORAL";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit1 {
                        position[] = {5, -5, 0};
                        rank = "PRIVATE";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                };
                class GVAR(BLU_G_F_fireteam) {
                    faction = "BLU_G_F";
                    name = CSTRING(Group_FireTeam);
                    icon = "\A3\ui_f\data\map\markers\nato\b_inf.paa";
                    side = 1;

                    class Unit0 {
                        position[] = {0, 0, 0};
                        rank = "SERGEANT";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit1 {
                        position[] = {5, -5, 0};
                        rank = "PRIVATE";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit2 {
                        position[] = {-5, -5, 0};
                        rank = "PRIVATE";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit3 {
                        position[] = {10, -10, 0};
                        rank = "PRIVATE";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                };
                class GVAR(BLU_G_F_squad) {
                    name = CSTRING(Group_Squad);
                    faction = "BLU_G_F";
                    icon = "\A3\ui_f\data\map\markers\nato\b_inf.paa";
                    side = 1;

                    class Unit0 {
                        position[] = {0, 0, 0};
                        rank = "SERGEANT";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit1 {
                        position[] = {5, -5, 0};
                        rank = "CORPORAL";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit2 {
                        position[] = {-5, -5, 0};
                        rank = "PRIVATE";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit3 {
                        position[] = {10, -10, 0};
                        rank = "PRIVATE";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit4 {
                        position[] = {-10, -10, 0};
                        rank = "PRIVATE";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit5 {
                        position[] = {15, -15, 0};
                        rank = "PRIVATE";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit6 {
                        position[] = {-15, -15, 0};
                        rank = "PRIVATE";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                    class Unit7 {
                        position[] = {20, -20, 0};
                        rank = "PRIVATE";
                        side = 1;
                        vehicle = QGVAR(soldier_b);
                    };
                };
            };
        };
    };

};
