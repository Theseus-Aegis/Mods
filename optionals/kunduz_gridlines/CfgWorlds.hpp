class CfgWorlds {
    class CAWorld;
    class Stratis: CAWorld {
        class Grid {
            class Zoom1;
            class Zoom2;
            class Zoom3;
        };
    };

    class CUP_Kunduz: Stratis {
        class Grid: Grid {
            offsetX = 0;
            offsetY = 5120;
            class Zoom1: Zoom1 {};
            class Zoom2: Zoom2 {};
            class Zoom3: Zoom3 {};
        };
    };
};
