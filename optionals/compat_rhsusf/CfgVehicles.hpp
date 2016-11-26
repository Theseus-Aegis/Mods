class CfgVehicles {
/* Air */
    // UH-60M
    class Heli_Transport_01_base_F;
    class RHS_UH60_Base: Heli_Transport_01_base_F {
        EGVAR(heavyLifter,attachPos[]) = {-0.1, -1, 1.3};
    };
    // CH-47F
    class Heli_Transport_02_base_F;
    class RHS_CH_47F_base: Heli_Transport_02_base_F {
        EGVAR(heavyLifter,attachPos[]) = {0, -0.5, 2.25};
    };
    // AH-64D
    class Heli_Attack_01_base_F;
    class RHS_AH64_base: Heli_Attack_01_base_F {
        EGVAR(heavyLifter,attachPos[]) = {-0.1, 0, 0.9};
    };

    // A-10A
    class Plane_CAS_01_base_F;
    class RHS_A10: Plane_CAS_01_base_F {
        EGVAR(heavyLifter,attachPos[]) = {0, 0.5, -0.45};
    };


/* Cars */
    // RG-33
    class MRAP_01_base_F;
    class rhsusf_rg33_base: MRAP_01_base_F {
        EGVAR(heavyLifter,attachPos[]) = {-0.1, 1, 0.95};
    };
    // RG-33 (M2)
    class rhsusf_rg33_m2_d: rhsusf_rg33_base {
        EGVAR(heavyLifter,attachPos[]) = {-0.1, 1, 1.2};
    };
    // M1083A1P2
    class rhsusf_fmtv_base;
    class rhsusf_M1083A1P2_B_wd_fmtv_usarmy: rhsusf_fmtv_base {
        EGVAR(heavyLifter,attachPos[]) = {0, 0.4, 0.5};
    };


/* Tanks */
    class MBT_01_base_F;

    // M1A1 AIM
    class rhsusf_m1a1tank_base: MBT_01_base_F {
        EGVAR(heavyLifter,attachPos[]) = {-0.2, 2, 1.4};
    };
    // M1A1 FEP
    class rhsusf_m1a1fep_d: rhsusf_m1a1tank_base {
        EGVAR(heavyLifter,attachPos[]) = {0, 4, 1.39};
    };
    class rhsusf_m1a1fep_wd: rhsusf_m1a1tank_base {
        EGVAR(heavyLifter,attachPos[]) = {0, 4, 1.39};
    };
    // M1A2
    class rhsusf_m1a2tank_base: rhsusf_m1a1tank_base {
        EGVAR(heavyLifter,attachPos[]) = {0, 2, 1.39};
    };
    // M109
    class MBT_01_arty_base_F;
    class rhsusf_m109tank_base: MBT_01_arty_base_F {
        EGVAR(heavyLifter,attachPos[]) = {0, 3, 1.3};
    };
    // M113
    class APC_Tracked_02_base_F;
    class rhsusf_m113tank_base: APC_Tracked_02_base_F {
        EGVAR(heavyLifter,attachPos[]) = {-0.5, 0.3, 1.4};
    };
    // M2A2, M2A3, M6
    class APC_Tracked_03_base_F;
    class RHS_M2A2_Base: APC_Tracked_03_base_F {
        EGVAR(heavyLifter,attachPos[]) = {0, 0, 0.29};
    };
};
