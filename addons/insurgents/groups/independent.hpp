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
                class Unit1: Unit0 {
                    position[] = {5, -5, 0};
                    rank = "PRIVATE";
                };
            };
            class GVAR(IND_G_F_sentry_african): GVAR(IND_G_F_sentry) {
                name = CSTRING(Group_Sentry_African);

                class Unit0 {
                    position[] = {0, 0, 0};
                    rank = "CORPORAL";
                    side = 2;
                    vehicle = QGVAR(soldier_i_african);
                };
                class Unit1: Unit0 {
                    position[] = {5, -5, 0};
                    rank = "PRIVATE";
                };
            };
            class GVAR(IND_G_F_fireteam): GVAR(IND_G_F_sentry) {
                name = CSTRING(Group_FireTeam);

                class Unit0 {
                    position[] = {0, 0, 0};
                    rank = "SERGEANT";
                    side = 2;
                    vehicle = QGVAR(soldier_i);
                };
                class Unit1: Unit0 {
                    position[] = {5, -5, 0};
                    rank = "PRIVATE";
                };
                class Unit2: Unit1 {
                    position[] = {-5, -5, 0};
                };
                class Unit3: Unit2 {
                    position[] = {10, -10, 0};
                };
            };
            class GVAR(IND_G_F_fireteam_african): GVAR(IND_G_F_fireteam) {
                name = CSTRING(Group_FireTeam_African);

                class Unit0 {
                    position[] = {0, 0, 0};
                    rank = "SERGEANT";
                    side = 2;
                    vehicle = QGVAR(soldier_i_african);
                };
                class Unit1: Unit0 {
                    position[] = {5, -5, 0};
                    rank = "PRIVATE";
                };
                class Unit2: Unit1 {
                    position[] = {-5, -5, 0};
                };
                class Unit3: Unit2 {
                    position[] = {10, -10, 0};
                };
            };
            class GVAR(IND_G_F_squad): GVAR(IND_G_F_fireteam) {
                name = CSTRING(Group_Squad);

                class Unit0 {
                    position[] = {0, 0, 0};
                    rank = "SERGEANT";
                    side = 2;
                    vehicle = QGVAR(soldier_i);
                };
                class Unit1: Unit0 {
                    position[] = {5, -5, 0};
                    rank = "CORPORAL";
                };
                class Unit2: Unit1 {
                    position[] = {-5, -5, 0};
                    rank = "PRIVATE";
                };
                class Unit3: Unit2 {
                    position[] = {10, -10, 0};
                };
                class Unit4: Unit3 {
                    position[] = {-10, -10, 0};
                };
                class Unit5: Unit4 {
                    position[] = {15, -15, 0};
                };
                class Unit6: Unit5 {
                    position[] = {-15, -15, 0};
                };
                class Unit7: Unit6 {
                    position[] = {20, -20, 0};
                };
            };
            class GVAR(IND_G_F_squad_african): GVAR(IND_G_F_squad) {
                name = CSTRING(Group_Squad_African);

                class Unit0 {
                    position[] = {0, 0, 0};
                    rank = "SERGEANT";
                    side = 2;
                    vehicle = QGVAR(soldier_i_african);
                };
                class Unit1: Unit0 {
                    position[] = {5, -5, 0};
                    rank = "CORPORAL";
                    side = 2;
                };
                class Unit2: Unit1 {
                    position[] = {-5, -5, 0};
                    rank = "PRIVATE";
                };
                class Unit3: Unit2 {
                    position[] = {10, -10, 0};
                };
                class Unit4: Unit3 {
                    position[] = {-10, -10, 0};
                };
                class Unit5: Unit4 {
                    position[] = {15, -15, 0};
                };
                class Unit6: Unit5 {
                    position[] = {-15, -15, 0};
                };
                class Unit7: Unit6 {
                    position[] = {20, -20, 0};
                };
            };
        };
    };
};
