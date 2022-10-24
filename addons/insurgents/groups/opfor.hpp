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
                class Unit1: Unit0 {
                    position[] = {5, -5, 0};
                    rank = "PRIVATE";
                };
            };
            class GVAR(OPF_G_F_sentry_eastern): GVAR(OPF_G_F_sentry) {
                name = CSTRING(Group_Sentry_Eastern);

                class Unit0 {
                    position[] = {0, 0, 0};
                    rank = "CORPORAL";
                    side = 0;
                    vehicle = QGVAR(soldier_o_eastern);
                };
                class Unit1: Unit0 {
                    position[] = {5, -5, 0};
                    rank = "PRIVATE";
                };
            };

            class GVAR(OPF_G_F_fireteam): GVAR(OPF_G_F_sentry) {
                name = CSTRING(Group_FireTeam);

                class Unit0 {
                    position[] = {0, 0, 0};
                    rank = "SERGEANT";
                    side = 0;
                    vehicle = QGVAR(soldier_o);
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
            class GVAR(OPF_G_F_fireteam_eastern): GVAR(OPF_G_F_fireteam) {
                name = CSTRING(Group_FireTeam_Eastern);

                class Unit0 {
                    position[] = {0, 0, 0};
                    rank = "SERGEANT";
                    side = 0;
                    vehicle = QGVAR(soldier_o_eastern);
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

            class GVAR(OPF_G_F_squad): GVAR(OPF_G_F_fireteam) {
                name = CSTRING(Group_Squad);

                class Unit0 {
                    position[] = {0, 0, 0};
                    rank = "SERGEANT";
                    side = 0;
                    vehicle = QGVAR(soldier_o);
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
            class GVAR(OPF_G_F_squad_eastern): GVAR(OPF_G_F_squad) {
                name = CSTRING(Group_Squad_Eastern);

                class Unit0 {
                    position[] = {0, 0, 0};
                    rank = "SERGEANT";
                    side = 0;
                    vehicle = QGVAR(soldier_o_eastern);
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
        };
    };
};
