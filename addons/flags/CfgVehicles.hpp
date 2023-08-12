#define FLAG(COUNTRY) class GVAR(COUNTRY): Flag_White_F { \
    author = "ArmaForces, Bohemia Interactive"; \
    displayName = QUOTE(Flag (##COUNTRY##)); \
    class EventHandlers { \
        init = QUOTE((_this select 0) setFlagTexture QUOTE(QUOTE(\A3\ui_f\data\map\markers\flags\##COUNTRY##_ca.paa))); \
    }; \
}


class CfgVehicles {
    class Flag_White_F;

    FLAG(Belgium);
    FLAG(Canada);
    FLAG(Croatia);
    FLAG(CzechRepublic);
    FLAG(Denmark);
    FLAG(France);
    FLAG(Georgia);
    FLAG(Germany);
    FLAG(Greece);
    FLAG(Hungary);
    FLAG(Iceland);
    FLAG(Italy);
    FLAG(Luxembourg);
    FLAG(Netherlands);
    FLAG(Norway);
    FLAG(Poland);
    FLAG(Portugal);
    FLAG(Slovakia);
    FLAG(Slovenia);
    FLAG(Spain);

    class GVAR(Russia): Flag_White_F {
        author = "ArmaForces, Bohemia Interactive";
        displayName = "Flag (Russia)";

        class EventHandlers {
            init = QUOTE((_this select 0) setFlagTexture QUOTE(QUOTE(\A3\UI_F_Enoch\Data\CfgMarkers\Russia_CA.paa)));
        };
    };
};
