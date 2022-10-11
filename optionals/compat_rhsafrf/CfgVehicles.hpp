class CfgVehicles {
/* Air */
    class Heli_Light_02_base_F;
    class Heli_Attack_02_base_F;

    // Mi8
    class RHS_Mi8_base: Heli_Light_02_base_F {
        EGVAR(heavyLifter,attachPos[]) = {0.1, 1, -1.8};
    };
    // Ka52
    class RHS_Ka52_base: Heli_Attack_02_base_F {
        EGVAR(heavyLifter,attachPos[]) = {0.1, 0, -0.7};
    };
    // Mi24
    class RHS_Mi24_base: Heli_Attack_02_base_F {
        EGVAR(heavyLifter,attachPos[]) = {0.7, 2, -1.7};
    };

    // Su25
    class O_Plane_CAS_02_F;
    class RHS_su25_base: O_Plane_CAS_02_F {
        EGVAR(heavyLifter,attachPos[]) = {0, -0.8, -1.1};
    };


/* Cars */
    // BTR60, BTR70
    class Wheeled_APC_F;
    class rhs_btr_base: Wheeled_APC_F {
        EGVAR(heavyLifter,attachPos[]) = {0.1, -0.7, -0.7};
    };
    // BTR70
    class rhs_btr70_vmf: rhs_btr_base {
        EGVAR(heavyLifter,attachPos[]) = {-0.1, -1, -0.7};
    };
    // BTR80
    class rhs_btr80_msv: rhs_btr70_vmf {
        EGVAR(heavyLifter,attachPos[]) = {-0.1, -1, -0.05};
    };
    // BTR80A
    class rhs_btr80a_msv: rhs_btr80_msv {
        EGVAR(heavyLifter,attachPos[]) = {-0.1, -1, -0.2};
    };
    // Ural
    class Truck_F;
    class RHS_Ural_BaseTurret: Truck_F {
        EGVAR(heavyLifter,attachPos[]) = {0.075, 0, -0.7};
    };
    // BM21
    class RHS_BM21_MSV_01: RHS_Ural_BaseTurret {
        EGVAR(heavyLifter,attachPos[]) = {0.075, 0, -0.5};
    };
    // GAZ66
    class rhs_truck: Truck_F {
        EGVAR(heavyLifter,attachPos[]) = {0.075, -3.2, 0.2};
    };


/* Tanks */
    class Tank_F;

    // BMP
    class rhs_bmp1tank_base: Tank_F {
        EGVAR(heavyLifter,attachPos[]) = {0.075, -1, -0.9};
    };
    // T72
    class rhs_a3t72tank_base: Tank_F {
        EGVAR(heavyLifter,attachPos[]) = {0, -1, -0.65};
    };
    // T80
    class rhs_tank_base: Tank_F {
        EGVAR(heavyLifter,attachPos[]) = {0, -1, 0.35};
    };
    // -2S3
    class rhs_2s3tank_base: Tank_F {
        EGVAR(heavyLifter,attachPos[]) = {0.1, -1.9, -1.55};
    };
    // ZSU
    class APC_Tracked_02_base_F;
    class rhs_zsutank_base: APC_Tracked_02_base_F {
        EGVAR(heavyLifter,attachPos[]) = {0.1, -0.7, -0.85};
    };
};
