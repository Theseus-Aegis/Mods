class CfgVehicles {
    class CUP_LR_Base;
    class CUP_LR_Transport_Base: CUP_LR_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"cargo", 2}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
    class CUP_LR_MG_Base: CUP_LR_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"turret", {0}}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
    class CUP_LR_Ambulance_Base: CUP_LR_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"cargo", 0}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
    class CUP_LR_Special_Base: CUP_LR_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", "commander"};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
    class CUP_LR_SPG9_Base: CUP_LR_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"turret", {1}}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };

    class CUP_SUV_Base;
    class CUP_SUV_Unarmed_Base: CUP_SUV_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"cargo", 1}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
    class CUP_SUV_Armored_Base: CUP_SUV_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"cargo", 0}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };

    class CUP_Lada_Base;
    class CUP_LADA_LM_Base;
    class CUP_S1203_Base;
    class CUP_S1203_Ambulance_Base;
    class CUP_S1203_LM_Base;
    class CUP_Volha_Base;
    class Car_F;
    class CUP_Skoda_Base;
    class CUP_C_Golf4_Civ_Base;
    class CUP_C_Golf4_Civ_sport_Base;
    class CUP_MQ9_Dyn_Base;
    class CUP_Pchela1T_Base;
    class CUP_BMP3_Base;
    class CUP_M113_Base;
    class CUP_M113_Med_Base;
    class CUP_M163_Base;
    class CUP_BTR40_MG_Base;
    class CUP_BTR40_Base;
    class CUP_Dingo_Base;
    class CUP_HMMWV_Unarmed_Base;
    class CUP_HMMWV_M2_Base;
    class CUP_HMMWV_MK19_Base;
    class CUP_HMMWV_TOW_Base;
    class CUP_HMMWV_M1114_Base;
    class CUP_HMMWV_Ambulance_Base;
    class CUP_HMMWV_Transport_Base;
    class CUP_HMMWV_M2_GPK_Base;
    class CUP_HMMWV_Terminal_Base;
    class CUP_HMMWV_SOV_Base;
    class CUP_HMMWV_SOV_M2_Base;
    class CUP_HMMWV_Crows_M2_Base;
    class CUP_HMMWV_crows_MK19_Base;
    class CUP_HMMWV_DSHKM_GPK_Base;
    class CUP_HMMWV_AGS_GPK_Base;
    class CUP_LAV25_Base;
    class CUP_M1030_Base;
    class CUP_MTVR_Base;
    class CUP_MTVR_Reammo_Base;
    class CUP_MTVR_Refuel_Base;
    class CUP_MTVR_Repair_Base;
    class CUP_RG31_M2;
    class CUP_RG31_M2_OD;
    class CUP_RG31_M2_GC;
    class CUP_RG31_Mk19;
    class CUP_RG31_Mk19_OD;
    class CUP_RG31E_M2;
    class CUP_M1126_ICV_BASE;
    class CUP_StrykerBase;
    class CUP_TowingTractor_Base;
    class CUP_M1165_GMV_BASE;
    class CUP_M1151_M2_BASE;
    class CUP_M1151_Deploy_BASE;
    class CUP_M1151_Mk19_BASE;
    class CUP_M1151_Unarmed_BASE;
    class CUP_M1152_BASE;
    class CUP_M1167_BASE;
    class CUP_B_A10_CAS_USA;
    class CUP_AH1Z_Dynamic_Base;
    class CUP_MH6_TRANSPORT;
    class CUP_AH6_BASE;
    class CUP_AH6_DYNLOAD;
    class CUP_CH53E_Base;
    class CUP_CH53E_VIV_Base;
    class CUP_DC3_Base;
    class CUP_C47_Base;
    class CUP_AC47_Spooky_Base;
    class CUP_F35B_dynamic_base;
    class CUP_F35B_dynamic_stealth_base;
    class CUP_KA50_Dynamic_Base;
    class CUP_Ka52_Dynamic_Base;
    class CUP_MH60S_Base;
    class CUP_MH60S_FFV_Base;
    class CUP_Su25_Dyn_Base;
    class CUP_SU34_Dynamic_Base;
    class CUP_UH1H_base;
    class CUP_UH1H_slick_base;
    class CUP_B_UH1Y_Base;
    class CUP_B_UH1Y_GUNSHIP_USMC;
    class CUP_Uh60_Base;
    class CUP_MH60L_Dap_4x_Dynamic_Base;
    class CUP_MH60L_Dap_2x_Dynamic_Base;
    class CUP_Uh60_FFV_Base;
    class CUP_UH60_Unarmed_Base;
    class CUP_Uh60_Unarmed_FFV_Base;
    class CUP_UH60S_Dap_4x_Dynamic_Base;
    class CUP_UH60S_Dap_2x_Dynamic_Base;
    class CUP_Uh60S_Base;
    class CUP_Uh60L_Base;
    class CUP_Uh60L_FFV_Base;
    class CUP_Uh60L_Unarmed_Base;
    class CUP_Uh60L_Unarmed_FFV_Base;
    class CUP_BMP1_base;
    class CUP_BMP1P_base;
    class CUP_BMP2_base;
    class CUP_BMP2_HQ_Base;
    class CUP_BMP2_Ambul_Base;
    class CUP_BMP2_ZU_base;
    class CUP_Fishing_Boat_Base;
    class CUP_BAF_Coyote_BASE_D;
    class CUP_Datsun_PK_Base;
    class CUP_Datsun_civil_Base;
    class CUP_Ikarus_Base;
    class CUP_BAF_Jackal2_GMG_D;
    class CUP_BAF_Jackal2_GMG_W;
    class CUP_BAF_Jackal2_L2A1_D;
    class CUP_BAF_Jackal2_L2A1_W;
    class CUP_Mastiff_Base;
    class CUP_Ridgback_Base;
    class CUP_TT650_Base;
    class CUP_UAZ_Unarmed_Base;
    class CUP_UAZ_Open_Base;
    class CUP_UAZ_MG_Base;
    class CUP_UAZ_AGS30_Base;
    class CUP_UAZ_SPG9_Base;
    class CUP_UAZ_METIS_Base;
    class CUP_UAZ_Amb_Base;
    class CUP_Ural_Base;
    class CUP_Ural_Open_Base;
    class CUP_Ural_Refuel_Base;
    class CUP_Ural_Repair_Base;
    class CUP_Ural_Reammo_Base;
    class CUP_Ural_Empty_Base;
    class CUP_BM21_Base;
    class CUP_Ural_Civ_Base;
    class CUP_V3S_Open_Base;
    class CUP_V3S_Covered_Base;
    class CUP_V3S_Refuel_Base;
    class CUP_V3S_Repair_Base;
    class CUP_V3S_Rearm_Base;
    class CUP_Wolfhound_Base;
    class CUP_AN2_Base;
    class CUP_AV8B_DYN_Base;
    class CUP_GR9_DYN_Base;
    class CUP_AW159_Unarmed_Base;
    class CUP_AW159_Dynamic_Base;
    class CUP_C130J_Base;
    class CUP_C130J_VIV_Base;
    class CUP_Merlin_HC3_Base;
    class CUP_Merlin_HC3_VIV_Base;
    class CUP_Merlin_HC3A_Base;
    class CUP_Merlin_HC3_Armed_Base;
    class CUP_Merlin_HC3A_Armed_Base;
    class CUP_Merlin_HM2_Base;
    class CUP_Ka60_GL_BASE;
    class CUP_Ka60_Base;
    class CUP_L39_DYN_Base;
    class CUP_Mi24_P_Dynamic_Base;
    class CUP_Mi24_V_Dynamic_Base;
    class CUP_Mi24_D_Dynamic_Base;
    class CUP_Mi24_D_MEV_Dynamic_Base;
    class CUP_Mi35_Dynamic_Base;
    class CUP_Mi35_TOH_Dynamic_Base;
    class CUP_Mi8_base;
    class CUP_Mi8_medevac_base;
    class CUP_Mi8_VIV_base;
    class CUP_Mi8_MTV3_base;
    class CUP_Mi171Sh_Base;
    class CUP_Mi171Sh_Unarmed_Base;
    class Plane_Base_F;
    class CUP_SA330_Base;
    class CUP_FV432_Bulldog_Base;
    class CUP_Ambient_A330_Base;
    class CUP_Ambient_B737_Base;
    class CUP_Ambient_Cessna172_Base;

// Heavy Lifter - Generated using heavylifter_exportConfig function
    class CUP_C_Lada_White_CIV: CUP_Lada_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, 0.18};
    };
    class CUP_C_Lada_Red_CIV: CUP_Lada_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, 0.18};
    };
    class CUP_C_Lada_GreenTK_CIV: CUP_Lada_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, 0.18};
    };
    class CUP_C_Lada_TK2_CIV: CUP_Lada_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, 0.18};
    };
    class CUP_LADA_LM_CIV: CUP_LADA_LM_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, 0.18};
    };
    class CUP_C_S1203_CIV: CUP_S1203_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.01, 0.32};
    };
    class CUP_C_S1203_Ambulance_CIV: CUP_S1203_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 0.32};
    };
    class CUP_B_S1203_Ambulance_CDF: CUP_S1203_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 0.32};
    };
    class CUP_C_S1203_Militia_CIV: CUP_S1203_LM_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 0.32};
    };
    class CUP_C_Volha_Gray_TKCIV: CUP_Volha_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.05, 0.14};
    };
    class CUP_C_Volha_Blue_TKCIV: CUP_Volha_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.05, 0.14};
    };
    class CUP_C_Volha_Limo_TKCIV: CUP_Volha_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.05, 0.14};
    };
    class CUP_O_Volha_SLA: CUP_Volha_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.05, 0.14};
    };
    class CUP_C_Octavia_CIV: Car_F {
        EGVAR(heavylifter,attachPos)[] = {0, 0.63, 0.11};
    };
    class CUP_C_Skoda_White_CIV: CUP_Skoda_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.02, 0.11};
    };
    class CUP_C_Skoda_Red_CIV: CUP_Skoda_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.02, 0.11};
    };
    class CUP_C_Skoda_Blue_CIV: CUP_Skoda_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.02, 0.11};
    };
    class CUP_C_Skoda_Green_CIV: CUP_Skoda_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.02, 0.11};
    };
    class CUP_C_Golf4_red_Civ: CUP_C_Golf4_Civ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.08};
    };
    class CUP_C_Golf4_black_Civ: CUP_C_Golf4_Civ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.08};
    };
    class CUP_C_Golf4_yellow_Civ: CUP_C_Golf4_Civ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.08};
    };
    class CUP_C_Golf4_blue_Civ: CUP_C_Golf4_Civ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.08};
    };
    class CUP_C_Golf4_white_Civ: CUP_C_Golf4_Civ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.08};
    };
    class CUP_C_Golf4_green_Civ: CUP_C_Golf4_Civ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.08};
    };
    class CUP_C_Golf4_random_Civ: CUP_C_Golf4_Civ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.08};
    };
    class CUP_C_Golf4_whiteblood_Civ: CUP_C_Golf4_Civ_sport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.06};
    };
    class CUP_C_Golf4_camo_Civ: CUP_C_Golf4_Civ_sport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.06};
    };
    class CUP_C_Golf4_camodigital_Civ: CUP_C_Golf4_Civ_sport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.06};
    };
    class CUP_C_Golf4_camodark_Civ: CUP_C_Golf4_Civ_sport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.06};
    };
    class CUP_C_Golf4_reptile_Civ: CUP_C_Golf4_Civ_sport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.06};
    };
    class CUP_C_Golf4_kitty_Civ: CUP_C_Golf4_Civ_sport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.06};
    };
    class CUP_C_Golf4_crowe_Civ: CUP_C_Golf4_Civ_sport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.19, 0.06};
    };
    class CUP_B_USMC_DYN_MQ9: CUP_MQ9_Dyn_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.58};
    };
    class CUP_O_Pchela1T_RU: CUP_Pchela1T_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, -1.03};
    };
    class CUP_B_Pchela1T_CDF: CUP_Pchela1T_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, -1.03};
    };
    class CUP_O_BMP3_RU: CUP_BMP3_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.11, 2.87};
    };
    class CUP_O_BMP3_CSAT_T: CUP_BMP3_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.11, 2.87};
    };
    class CUP_B_M113_USA: CUP_M113_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.26, 3.16};
    };
    class CUP_B_M113_desert_USA: CUP_M113_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.26, 3.16};
    };
    class CUP_B_M113_Med_USA: CUP_M113_Med_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.25, 2.57};
    };
    class CUP_B_M163_USA: CUP_M163_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.35, 2.57};
    };
    class CUP_I_M113_AAF: CUP_M113_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.26, 3.16};
    };
    class CUP_I_M113_Med_AAF: CUP_M113_Med_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.25, 2.57};
    };
    class CUP_I_M163_AAF: CUP_M163_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.35, 2.57};
    };
    class CUP_I_M113_RACS: CUP_M113_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.26, 3.16};
    };
    class CUP_I_M113_Med_RACS: CUP_M113_Med_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.25, 2.57};
    };
    class CUP_I_M163_RACS: CUP_M163_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.35, 2.57};
    };
    class CUP_I_M113_UN: CUP_M113_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.26, 3.16};
    };
    class CUP_I_M113_Med_UN: CUP_M113_Med_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.25, 2.57};
    };
    class CUP_O_M113_TKA: CUP_M113_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.26, 3.16};
    };
    class CUP_O_M113_Med_TKA: CUP_M113_Med_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.25, 2.57};
    };
    class CUP_I_BTR40_MG_TKG: CUP_BTR40_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 0.81};
    };
    class CUP_I_BTR40_TKG: CUP_BTR40_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 0.35};
    };
    class CUP_O_BTR40_MG_TKM: CUP_BTR40_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 0.81};
    };
    class CUP_O_BTR40_TKM: CUP_BTR40_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 0.35};
    };
    class CUP_O_BTR40_MG_TKA: CUP_BTR40_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 0.81};
    };
    class CUP_O_BTR40_TKA: CUP_BTR40_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 0.35};
    };
    class CUP_B_Dingo_CZ_Wdl: CUP_Dingo_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.02, 1.41};
    };
    class CUP_B_Dingo_GL_CZ_Wdl: CUP_Dingo_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.02, 1.38};
    };
    class CUP_B_HMMWV_Unarmed_USMC: CUP_HMMWV_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 1.28};
    };
    class CUP_B_HMMWV_M2_USMC: CUP_HMMWV_M2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.17, 1.28};
    };
    class CUP_B_HMMWV_MK19_USMC: CUP_HMMWV_MK19_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.17, 1.28};
    };
    class CUP_B_HMMWV_TOW_USMC: CUP_HMMWV_TOW_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.17, 1.28};
    };
    class CUP_B_HMMWV_M1114_USMC: CUP_HMMWV_M1114_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.01, 1.28};
    };
    class CUP_B_HMMWV_Ambulance_USMC: CUP_HMMWV_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 0.89};
    };
    class CUP_B_HMMWV_Unarmed_USA: CUP_HMMWV_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 1.28};
    };
    class CUP_B_HMMWV_M2_USA: CUP_HMMWV_M2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.17, 1.28};
    };
    class CUP_B_HMMWV_MK19_USA: CUP_HMMWV_MK19_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.17, 1.28};
    };
    class CUP_B_HMMWV_TOW_USA: CUP_HMMWV_TOW_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.17, 1.28};
    };
    class CUP_B_HMMWV_Ambulance_USA: CUP_HMMWV_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 0.89};
    };
    class CUP_B_HMMWV_Transport_USA: CUP_HMMWV_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.03, 0.3};
    };
    class CUP_B_HMMWV_M2_GPK_USA: CUP_HMMWV_M2_GPK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.15, 1.28};
    };
    class CUP_B_HMMWV_Terminal_USA: CUP_HMMWV_Terminal_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.19, 0.89};
    };
    class CUP_B_HMMWV_SOV_USA: CUP_HMMWV_SOV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.02, 0.8};
    };
    class CUP_B_HMMWV_SOV_M2_USA: CUP_HMMWV_SOV_M2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.02, 1.03};
    };
    class CUP_B_HMMWV_Crows_M2_USA: CUP_HMMWV_Crows_M2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 1.28};
    };
    class CUP_B_HMMWV_Crows_MK19_USA: CUP_HMMWV_crows_MK19_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 1.28};
    };
    class CUP_B_HMMWV_Unarmed_NATO_T: CUP_HMMWV_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 1.28};
    };
    class CUP_B_HMMWV_M2_NATO_T: CUP_HMMWV_M2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.17, 1.28};
    };
    class CUP_B_HMMWV_MK19_NATO_T: CUP_HMMWV_MK19_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.17, 1.28};
    };
    class CUP_B_HMMWV_TOW_NATO_T: CUP_HMMWV_TOW_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.17, 1.28};
    };
    class CUP_B_HMMWV_Ambulance_NATO_T: CUP_HMMWV_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 0.89};
    };
    class CUP_B_HMMWV_Transport_NATO_T: CUP_HMMWV_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.03, 0.3};
    };
    class CUP_B_HMMWV_M2_GPK_NATO_T: CUP_HMMWV_M2_GPK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.15, 1.28};
    };
    class CUP_B_HMMWV_Terminal_NATO_T: CUP_HMMWV_Terminal_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.19, 0.89};
    };
    class CUP_B_HMMWV_SOV_NATO_T: CUP_HMMWV_SOV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.02, 0.8};
    };
    class CUP_B_HMMWV_SOV_M2_NATO_T: CUP_HMMWV_SOV_M2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.02, 1.03};
    };
    class CUP_B_HMMWV_Crows_M2_NATO_T: CUP_HMMWV_Crows_M2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 1.28};
    };
    class CUP_B_HMMWV_Crows_MK19_NATO_T: CUP_HMMWV_crows_MK19_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 1.28};
    };
    class CUP_B_HMMWV_M2_GPK_ACR: CUP_HMMWV_M2_GPK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.15, 1.28};
    };
    class CUP_B_HMMWV_DSHKM_GPK_ACR: CUP_HMMWV_DSHKM_GPK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 1.28};
    };
    class CUP_B_HMMWV_AGS_GPK_ACR: CUP_HMMWV_AGS_GPK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 1.28};
    };
    class CUP_B_HMMWV_Ambulance_ACR: CUP_HMMWV_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 0.89};
    };
    class CUP_B_LAV25_USMC: CUP_LAV25_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.19, 2.9};
    };
    class CUP_B_LAV25M240_USMC: CUP_B_LAV25_USMC {
        EGVAR(heavylifter,attachPos)[] = {0, -0.19, 2.97};
    };
    class CUP_B_LAV25_HQ_USMC: CUP_B_LAV25_USMC {
        EGVAR(heavylifter,attachPos)[] = {0, -0.19, 4.58};
    };
    class CUP_B_M1030_USMC: CUP_M1030_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.26};
    };
    class CUP_B_MTVR_USA: CUP_MTVR_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.09, 0.87};
    };
    class CUP_B_MTVR_Ammo_USA: CUP_MTVR_Reammo_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.84};
    };
    class CUP_B_MTVR_Refuel_USA: CUP_MTVR_Refuel_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.17, 0.84};
    };
    class CUP_B_MTVR_Repair_USA: CUP_MTVR_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.17, 0.84};
    };
    class CUP_B_MTVR_USMC: CUP_MTVR_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.09, 0.87};
    };
    class CUP_B_MTVR_Ammo_USMC: CUP_MTVR_Reammo_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.84};
    };
    class CUP_B_MTVR_Refuel_USMC: CUP_MTVR_Refuel_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.17, 0.84};
    };
    class CUP_B_MTVR_Repair_USMC: CUP_MTVR_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.17, 0.84};
    };
    class CUP_B_RG31_M2_USMC: CUP_RG31_M2 {
        EGVAR(heavylifter,attachPos)[] = {0, 0.03, 1.35};
    };
    class CUP_B_RG31_M2_OD_USMC: CUP_RG31_M2_OD {
        EGVAR(heavylifter,attachPos)[] = {0, 0.03, 1.21};
    };
    class CUP_B_RG31_M2_GC_USMC: CUP_RG31_M2_GC {
        EGVAR(heavylifter,attachPos)[] = {0, -0.02, 1.35};
    };
    class CUP_B_RG31_Mk19_USMC: CUP_RG31_Mk19 {
        EGVAR(heavylifter,attachPos)[] = {0, 0.15, 1.33};
    };
    class CUP_B_RG31_Mk19_OD_USMC: CUP_RG31_Mk19_OD {
        EGVAR(heavylifter,attachPos)[] = {0, 0.15, 1.33};
    };
    class CUP_B_RG31E_M2_USMC: CUP_RG31E_M2 {
        EGVAR(heavylifter,attachPos)[] = {0, 0.01, 1.35};
    };
    class CUP_B_M1126_ICV_M2_Desert: CUP_M1126_ICV_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0.03, -1.16};
    };
    class CUP_B_M1126_ICV_MK19_Desert: CUP_M1126_ICV_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0.03, -1.16};
    };
    class CUP_B_M1130_CV_M2_Desert: CUP_B_M1126_ICV_M2_Desert {
        EGVAR(heavylifter,attachPos)[] = {0, 0.03, -1.14};
    };
    class CUP_B_M1129_MC_MK19_Desert: CUP_B_M1126_ICV_MK19_Desert {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, -1.15};
    };
    class CUP_B_M1135_ATGMV_Desert: CUP_StrykerBase {
        EGVAR(heavylifter,attachPos)[] = {0, 0.07, -1.13};
    };
    class CUP_B_M1128_MGS_Desert: CUP_StrykerBase {
        EGVAR(heavylifter,attachPos)[] = {0, 0.25, -1.16};
    };
    class CUP_B_M1133_MEV_Desert: CUP_M1126_ICV_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0.03, -1.13};
    };
    class CUP_B_TowingTractor_USMC: CUP_TowingTractor_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.02, -1.25};
    };
    class CUP_B_M1165_GMV_USA: CUP_M1165_GMV_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.25};
    };
    class CUP_B_M1151_M2_USA: CUP_M1151_M2_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.24};
    };
    class CUP_B_M1151_Deploy_USA: CUP_M1151_Deploy_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.26};
    };
    class CUP_B_M1151_Mk19_USA: CUP_M1151_Mk19_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.24};
    };
    class CUP_B_M1151_USA: CUP_M1151_Unarmed_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.25};
    };
    class CUP_B_M1152_USA: CUP_M1152_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.25, 1.24};
    };
    class CUP_B_M1167_USA: CUP_M1167_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.08, 1.25};
    };
    class CUP_B_M1165_GMV_WDL_USA: CUP_M1165_GMV_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.25};
    };
    class CUP_B_M1151_M2_WDL_USA: CUP_M1151_M2_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.24};
    };
    class CUP_B_M1151_Deploy_WDL_USA: CUP_M1151_Deploy_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.26};
    };
    class CUP_B_M1151_Mk19_WDL_USA: CUP_M1151_Mk19_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.24};
    };
    class CUP_B_M1151_WDL_USA: CUP_M1151_Unarmed_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.25};
    };
    class CUP_B_M1152_WDL_USA: CUP_M1152_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.25, 1.24};
    };
    class CUP_B_M1167_WDL_USA: CUP_M1167_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.08, 1.25};
    };
    class CUP_B_M1165_GMV_USMC: CUP_M1165_GMV_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.25};
    };
    class CUP_B_M1151_M2_USMC: CUP_M1151_M2_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.24};
    };
    class CUP_B_M1151_Deploy_USMC: CUP_M1151_Deploy_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.26};
    };
    class CUP_B_M1151_Mk19_USMC: CUP_M1151_Mk19_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.24};
    };
    class CUP_B_M1151_USMC: CUP_M1151_Unarmed_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.25};
    };
    class CUP_B_M1152_USMC: CUP_M1152_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.25, 1.24};
    };
    class CUP_B_M1167_USMC: CUP_M1167_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.08, 1.25};
    };
    class CUP_B_M1165_GMV_DSRT_USMC: CUP_M1165_GMV_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.25};
    };
    class CUP_B_M1151_M2_DSRT_USMC: CUP_M1151_M2_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.24};
    };
    class CUP_B_M1151_Deploy_DSRT_USMC: CUP_M1151_Deploy_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.26};
    };
    class CUP_B_M1151_Mk19_DSRT_USMC: CUP_M1151_Mk19_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.24};
    };
    class CUP_B_M1151_DSRT_USMC: CUP_M1151_Unarmed_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.25};
    };
    class CUP_B_M1152_DSRT_USMC: CUP_M1152_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.25, 1.24};
    };
    class CUP_B_M1167_DSRT_USMC: CUP_M1167_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.08, 1.25};
    };
    class CUP_B_M1165_GMV_NATO_T: CUP_M1165_GMV_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.25};
    };
    class CUP_B_M1151_M2_NATO_T: CUP_M1151_M2_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.24};
    };
    class CUP_B_M1151_Deploy_NATO_T: CUP_M1151_Deploy_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.26};
    };
    class CUP_B_M1151_Mk19_NATO_T: CUP_M1151_Mk19_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.14, 1.24};
    };
    class CUP_B_M1151_NATO_T: CUP_M1151_Unarmed_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.25};
    };
    class CUP_B_M1152_NATO_T: CUP_M1152_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.25, 1.24};
    };
    class CUP_B_M1167_NATO_T: CUP_M1167_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -0.08, 1.25};
    };
    class CUP_B_A10_DYN_USA: CUP_B_A10_CAS_USA {
        EGVAR(heavylifter,attachPos)[] = {0, 0, -0.39};
    };
    class CUP_B_AH1Z_Dynamic_USMC: CUP_AH1Z_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.41, 0.73};
    };
    class CUP_I_AH1Z_Dynamic_AAF: CUP_AH1Z_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.41, 0.73};
    };
    class CUP_B_MH6M_USA: CUP_MH6_TRANSPORT {
        EGVAR(heavylifter,attachPos)[] = {0, -0.71, -0.26};
    };
    class CUP_B_MH6J_USA: CUP_MH6_TRANSPORT {
        EGVAR(heavylifter,attachPos)[] = {0, -0.71, -0.26};
    };
    class CUP_B_MH6M_OBS_USA: CUP_MH6_TRANSPORT {
        EGVAR(heavylifter,attachPos)[] = {0, -0.71, -0.26};
    };
    class CUP_B_MH6J_OBS_USA: CUP_MH6_TRANSPORT {
        EGVAR(heavylifter,attachPos)[] = {0, -0.71, -0.26};
    };
    class CUP_B_AH6X_USA: CUP_AH6_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -1.13, -1.32};
    };
    class CUP_B_AH6M_USA: CUP_AH6_DYNLOAD {
        EGVAR(heavylifter,attachPos)[] = {0, -0.71, -0.26};
    };
    class CUP_B_CH53E_USMC: CUP_CH53E_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -4.31, 2.91};
    };
    class CUP_B_CH53E_VIV_USMC: CUP_CH53E_VIV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -4.31, 2.91};
    };
    class CUP_B_CH53E_GER: CUP_CH53E_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -4.31, 2.91};
    };
    class CUP_B_CH53E_VIV_GER: CUP_CH53E_VIV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -4.31, 2.91};
    };
    class CUP_C_DC3_CIV: CUP_DC3_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.5};
    };
    class CUP_C_DC3_TanoAir_CIV: CUP_DC3_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.5};
    };
    class CUP_C_C47_CIV: CUP_C47_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.5};
    };
    class CUP_O_C47_SLA: CUP_C47_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.5};
    };
    class CUP_B_C47_USA: CUP_C47_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.5};
    };
    class CUP_B_AC47_Spooky_USA: CUP_AC47_Spooky_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.5};
    };
    class CUP_B_F35B_USMC: CUP_F35B_dynamic_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.11};
    };
    class CUP_B_F35B_Stealth_USMC: CUP_F35B_dynamic_stealth_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.11};
    };
    class CUP_O_Ka50_DL_SLA: CUP_KA50_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.45, -1.4};
    };
    class CUP_O_Ka50_DL_RU: CUP_KA50_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.45, -1.4};
    };
    class CUP_O_Ka52_RU: CUP_Ka52_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 1.19};
    };
    class CUP_O_Ka52_Blk_RU: CUP_Ka52_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 1.19};
    };
    class CUP_O_Ka52_GreyCamo_RU: CUP_Ka52_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 1.19};
    };
    class CUP_O_Ka52_Grey_RU: CUP_Ka52_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.55, 1.19};
    };
    class CUP_B_MH60S_USMC: CUP_MH60S_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.32, 0.62};
    };
    class CUP_B_MH60S_FFV_USMC: CUP_MH60S_FFV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.32, 0.62};
    };
    class CUP_B_Su25_Dyn_CDF: CUP_Su25_Dyn_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.64};
    };
    class CUP_O_Su25_Dyn_TKA: CUP_Su25_Dyn_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.64};
    };
    class CUP_O_Su25_Dyn_SLA: CUP_Su25_Dyn_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.64};
    };
    class CUP_O_Su25_Dyn_CSAT_T: CUP_Su25_Dyn_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.64};
    };
    class CUP_O_Su25_Dyn_RU: CUP_Su25_Dyn_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.64};
    };
    class CUP_O_SU34_CSAT: CUP_SU34_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.79};
    };
    class CUP_O_SU34_RU: CUP_SU34_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.79};
    };
    class CUP_O_SU34_SLA: CUP_SU34_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.79};
    };
    class CUP_I_SU34_AAF: CUP_SU34_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.79};
    };
    class CUP_B_SU34_CDF: CUP_SU34_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.79};
    };
    class CUP_O_UH1H_TKA: CUP_UH1H_base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1};
    };
    class CUP_O_UH1H_slick_TKA: CUP_UH1H_slick_base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1};
    };
    class CUP_O_UH1H_SLA: CUP_UH1H_base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1};
    };
    class CUP_O_UH1H_slick_SLA: CUP_UH1H_slick_base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1};
    };
    class CUP_I_UH1H_TK_GUE: CUP_UH1H_base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1};
    };
    class CUP_I_UH1H_slick_TK_GUE: CUP_UH1H_slick_base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1};
    };
    class CUP_B_UH1D_GER_KSK: CUP_UH1H_base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1};
    };
    class CUP_B_UH1D_slick_GER_KSK: CUP_UH1H_slick_base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1};
    };
    class CUP_B_UH1D_GER_KSK_Des: CUP_UH1H_base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1};
    };
    class CUP_B_UH1D_slick_GER_KSK_Des: CUP_UH1H_slick_base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1};
    };
    class CUP_B_UH1Y_UNA_USMC: CUP_B_UH1Y_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.2, 0.76};
    };
    class CUP_B_UH1Y_MEV_USMC: CUP_B_UH1Y_UNA_USMC {
        EGVAR(heavylifter,attachPos)[] = {0, -1.2, 0.87};
    };
    class CUP_B_UH1Y_Gunship_Dynamic_USMC: CUP_B_UH1Y_GUNSHIP_USMC {
        EGVAR(heavylifter,attachPos)[] = {0, -1.2, 0.76};
    };
    class CUP_B_UH60M_US: CUP_Uh60_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.73, 0.55};
    };
    class CUP_B_MH60L_DAP_4x_US: CUP_MH60L_Dap_4x_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.73, 0.55};
    };
    class CUP_B_MH60L_DAP_2x_US: CUP_MH60L_Dap_2x_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.73, 0.55};
    };
    class CUP_B_UH60M_FFV_US: CUP_Uh60_FFV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.73, 0.55};
    };
    class CUP_B_UH60M_Unarmed_US: CUP_UH60_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1.32};
    };
    class CUP_B_UH60M_Unarmed_FFV_US: CUP_Uh60_Unarmed_FFV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1.32};
    };
    class CUP_B_UH60M_Unarmed_FFV_MEV_US: CUP_Uh60_Unarmed_FFV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1.32};
    };
    class CUP_B_MH60L_DAP_4x_USN: CUP_UH60S_Dap_4x_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.76, 0.55};
    };
    class CUP_B_MH60L_DAP_2x_USN: CUP_UH60S_Dap_2x_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.76, 0.55};
    };
    class CUP_B_UH60S_USN: CUP_Uh60S_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.76, 0.55};
    };
    class CUP_I_UH60L_RACS: CUP_Uh60L_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.73, 0.55};
    };
    class CUP_I_UH60L_FFV_RACS: CUP_Uh60L_FFV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.73, 0.55};
    };
    class CUP_I_UH60L_Unarmed_RACS: CUP_Uh60L_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1.32};
    };
    class CUP_I_UH60L_Unarmed_FFV_Racs: CUP_Uh60L_Unarmed_FFV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1.32};
    };
    class CUP_I_UH60L_Unarmed_FFV_MEV_Racs: CUP_Uh60L_Unarmed_FFV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.69, 1.32};
    };
    class CUP_O_BMP1_TKA: CUP_BMP1_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, 2.52};
    };
    class CUP_O_BMP1P_TKA: CUP_BMP1P_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, 2.5};
    };
    class CUP_O_BMP2_TKA: CUP_BMP2_base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 2.55};
    };
    class CUP_O_BMP_HQ_TKA: CUP_BMP2_HQ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.44, 7.25};
    };
    class CUP_O_BMP2_AMB_TKA: CUP_BMP2_Ambul_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.03};
    };
    class CUP_O_BMP2_ZU_TKA: CUP_BMP2_ZU_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, 3.03};
    };
    class CUP_I_BMP1_TK_GUE: CUP_BMP1_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, 2.52};
    };
    class CUP_B_BMP2_CDF: CUP_BMP2_base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 2.55};
    };
    class CUP_B_BMP_HQ_CDF: CUP_BMP2_HQ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.44, 7.25};
    };
    class CUP_B_BMP2_AMB_CDF: CUP_BMP2_Ambul_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.03};
    };
    class CUP_O_BMP2_RU: CUP_BMP2_base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 2.55};
    };
    class CUP_O_BMP_HQ_RU: CUP_BMP2_HQ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.44, 7.25};
    };
    class CUP_O_BMP2_AMB_RU: CUP_BMP2_Ambul_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.03};
    };
    class CUP_O_BMP2_CHDKZ: CUP_BMP2_base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 2.55};
    };
    class CUP_O_BMP_HQ_CHDKZ: CUP_BMP2_HQ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.44, 7.25};
    };
    class CUP_O_BMP2_AMB_CHDKZ: CUP_BMP2_Ambul_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.03};
    };
    class CUP_I_BMP2_UN: CUP_BMP2_base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 2.55};
    };
    class CUP_I_BMP_HQ_UN: CUP_BMP2_HQ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.44, 7.25};
    };
    class CUP_I_BMP2_AMB_UN: CUP_BMP2_Ambul_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.03};
    };
    class CUP_O_BMP2_SLA: CUP_BMP2_base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 2.55};
    };
    class CUP_O_BMP_HQ_sla: CUP_BMP2_HQ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.44, 7.25};
    };
    class CUP_O_BMP2_AMB_sla: CUP_BMP2_Ambul_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.03};
    };
    class CUP_O_BMP1_CSAT: CUP_BMP1_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, 2.52};
    };
    class CUP_O_BMP1P_CSAT: CUP_BMP1P_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, 2.5};
    };
    class CUP_O_BMP2_CSAT: CUP_BMP2_base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 2.55};
    };
    class CUP_O_BMP_HQ_CSAT: CUP_BMP2_HQ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.44, 7.25};
    };
    class CUP_O_BMP2_AMB_CSAT: CUP_BMP2_Ambul_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.03};
    };
    class CUP_O_BMP2_ZU_CSAT: CUP_BMP2_ZU_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, 3.03};
    };
    class CUP_O_BMP1_CSAT_T: CUP_BMP1_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, 2.52};
    };
    class CUP_O_BMP1P_CSAT_T: CUP_BMP1P_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, 2.5};
    };
    class CUP_O_BMP2_CSAT_T: CUP_BMP2_base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 2.55};
    };
    class CUP_O_BMP_HQ_CSAT_T: CUP_BMP2_HQ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.44, 7.25};
    };
    class CUP_O_BMP2_AMB_CSAT_T: CUP_BMP2_Ambul_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.03};
    };
    class CUP_O_BMP2_ZU_CSAT_T: CUP_BMP2_ZU_base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, 3.03};
    };
    class CUP_I_BMP2_NAPA: CUP_BMP2_base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 2.55};
    };
    class CUP_I_BMP_HQ_NAPA: CUP_BMP2_HQ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.44, 7.25};
    };
    class CUP_I_BMP2_AMB_NAPA: CUP_BMP2_Ambul_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.03};
    };
    class CUP_B_BMP2_CZ: CUP_BMP2_base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.12, 2.55};
    };
    class CUP_B_BMP_HQ_CZ: CUP_BMP2_HQ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.44, 7.25};
    };
    class CUP_B_BMP2_AMB_CZ: CUP_BMP2_Ambul_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.16, 0.03};
    };
    class CUP_C_Fishing_Boat_Chernarus: CUP_Fishing_Boat_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 1.78, 6.51};
    };
    class CUP_B_BAF_Coyote_L2A1_D: CUP_BAF_Coyote_BASE_D {
        EGVAR(heavylifter,attachPos)[] = {0, 0.56, -1.1};
    };
    class CUP_B_BAF_Coyote_GMG_D: CUP_BAF_Coyote_BASE_D {
        EGVAR(heavylifter,attachPos)[] = {0, 0.77, -1.1};
    };
    class CUP_B_BAF_Coyote_GMG_W: CUP_B_BAF_Coyote_GMG_D {
        EGVAR(heavylifter,attachPos)[] = {0, 0.62, -1.1};
    };
    class CUP_B_BAF_Coyote_L2A1_W: CUP_B_BAF_Coyote_L2A1_D {
        EGVAR(heavylifter,attachPos)[] = {0, 0.58, -1.1};
    };
    class CUP_O_Datsun_PK: CUP_Datsun_PK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.24, 0.79};
    };
    class CUP_O_Datsun_PK_Random: CUP_Datsun_PK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.24, 0.79};
    };
    class CUP_I_Datsun_PK: CUP_Datsun_PK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.24, 0.79};
    };
    class CUP_I_Datsun_PK_Random: CUP_Datsun_PK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.24, 0.79};
    };
    class CUP_I_Datsun_PK_TK: CUP_Datsun_PK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.24, 0.79};
    };
    class CUP_I_Datsun_PK_TK_Random: CUP_Datsun_PK_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.24, 0.79};
    };
    class CUP_C_Datsun: CUP_Datsun_civil_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.23, 0.68};
    };
    class CUP_C_Datsun_4seat: CUP_Datsun_civil_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.23, 0.68};
    };
    class CUP_C_Datsun_Plain: CUP_Datsun_civil_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.23, 0.68};
    };
    class CUP_C_Datsun_Covered: CUP_Datsun_civil_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.23, 0.68};
    };
    class CUP_C_Datsun_Tubeframe: CUP_Datsun_civil_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.23, 0.68};
    };
    class CUP_C_Ikarus_TKC: CUP_Ikarus_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.38, 0.56};
    };
    class CUP_C_Ikarus_Chernarus: CUP_Ikarus_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.38, 0.56};
    };
    class CUP_B_Jackal2_GMG_GB_D: CUP_BAF_Jackal2_GMG_D {
        EGVAR(heavylifter,attachPos)[] = {0, 0.05, 1.23};
    };
    class CUP_B_Jackal2_GMG_GB_W: CUP_BAF_Jackal2_GMG_W {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 1.23};
    };
    class CUP_B_Jackal2_L2A1_GB_D: CUP_BAF_Jackal2_L2A1_D {
        EGVAR(heavylifter,attachPos)[] = {0, -0.19, 1.24};
    };
    class CUP_B_Jackal2_L2A1_GB_W: CUP_BAF_Jackal2_L2A1_W {
        EGVAR(heavylifter,attachPos)[] = {0, -0.15, 1.24};
    };
    class CUP_C_LR_Transport_CTK: CUP_LR_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.64, 0.48};
    };
    class CUP_B_LR_Transport_CZ_W: CUP_LR_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.64, 0.48};
    };
    class CUP_B_LR_Transport_CZ_D: CUP_LR_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.64, 0.48};
    };
    class CUP_B_LR_MG_CZ_W: CUP_LR_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.36, 0.96};
    };
    class CUP_B_LR_Ambulance_CZ_W: CUP_LR_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.23, 0.48};
    };
    class CUP_B_LR_Ambulance_CZ_D: CUP_LR_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.23, 0.48};
    };
    class CUP_B_LR_Special_CZ_W: CUP_LR_Special_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.56, 0.64};
    };
    class CUP_B_LR_Special_Des_CZ_D: CUP_LR_Special_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.56, 0.64};
    };
    class CUP_B_LR_Transport_GB_W: CUP_LR_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.54, 0.53};
    };
    class CUP_B_LR_Transport_GB_D: CUP_LR_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.54, 0.53};
    };
    class CUP_B_LR_MG_GB_W: CUP_LR_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.36, 0.96};
    };
    class CUP_B_LR_MG_GB_D: CUP_LR_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.36, 0.96};
    };
    class CUP_B_LR_Ambulance_GB_W: CUP_LR_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.23, 0.48};
    };
    class CUP_B_LR_Ambulance_GB_D: CUP_LR_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.23, 0.48};
    };
    class CUP_B_LR_Special_M2_GB_W: CUP_LR_Special_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.1, 0.96};
    };
    class CUP_B_LR_Special_GMG_GB_W: CUP_LR_Special_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.66, 0.92};
    };
    class CUP_I_LR_Transport_AAF: CUP_LR_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.64, 0.48};
    };
    class CUP_I_LR_MG_AAF: CUP_LR_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.36, 0.96};
    };
    class CUP_I_LR_Ambulance_AAF: CUP_LR_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.23, 0.48};
    };
    class CUP_I_LR_Transport_RACS: CUP_LR_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.64, 0.48};
    };
    class CUP_I_LR_MG_RACS: CUP_LR_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.36, 0.96};
    };
    class CUP_I_LR_Ambulance_RACS: CUP_LR_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.23, 0.48};
    };
    class CUP_O_LR_Transport_TKA: CUP_LR_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.64, 0.48};
    };
    class CUP_O_LR_MG_TKA: CUP_LR_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.36, 0.96};
    };
    class CUP_O_LR_Ambulance_TKA: CUP_LR_Ambulance_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.23, 0.48};
    };
    class CUP_O_LR_SPG9_TKA: CUP_LR_SPG9_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.38, 0.33};
    };
    class CUP_O_LR_Transport_TKM: CUP_LR_Transport_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.64, 0.48};
    };
    class CUP_O_LR_MG_TKM: CUP_LR_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.36, 0.96};
    };
    class CUP_O_LR_SPG9_TKM: CUP_LR_SPG9_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.38, 0.33};
    };
    class CUP_B_Mastiff_HMG_GB_D: CUP_Mastiff_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.81, -1.23};
    };
    class CUP_B_Mastiff_HMG_GB_W: CUP_Mastiff_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.81, -1.23};
    };
    class CUP_B_Mastiff_GMG_GB_D: CUP_Mastiff_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.81, -1.23};
    };
    class CUP_B_Mastiff_GMG_GB_W: CUP_Mastiff_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.81, -1.23};
    };
    class CUP_B_Mastiff_LMG_GB_D: CUP_Mastiff_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.81, -1.23};
    };
    class CUP_B_Mastiff_LMG_GB_W: CUP_Mastiff_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.81, -1.23};
    };
    class CUP_B_Ridgback_HMG_GB_D: CUP_Ridgback_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, -1.23};
    };
    class CUP_B_Ridgback_HMG_GB_W: CUP_Ridgback_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, -1.23};
    };
    class CUP_B_Ridgback_GMG_GB_D: CUP_Ridgback_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, -1.23};
    };
    class CUP_B_Ridgback_GMG_GB_W: CUP_Ridgback_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, -1.23};
    };
    class CUP_B_Ridgback_LMG_GB_D: CUP_Ridgback_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, -1.23};
    };
    class CUP_B_Ridgback_LMG_GB_W: CUP_Ridgback_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.12, -1.23};
    };
    class CUP_C_TT650_CIV: CUP_TT650_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.26};
    };
    class CUP_C_TT650_RU: CUP_TT650_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.26};
    };
    class CUP_C_TT650_TK_CIV: CUP_TT650_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.26};
    };
    class CUP_I_TT650_NAPA: CUP_TT650_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.26};
    };
    class CUP_O_TT650_CHDKZ: CUP_TT650_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.26};
    };
    class CUP_O_TT650_TKA: CUP_TT650_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.26};
    };
    class CUP_B_UAZ_Unarmed_CDF: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_Open_CDF: CUP_UAZ_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_MG_CDF: CUP_UAZ_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_AGS30_CDF: CUP_UAZ_AGS30_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_SPG9_CDF: CUP_UAZ_SPG9_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_METIS_CDF: CUP_UAZ_METIS_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Unarmed_CHDKZ: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Open_CHDKZ: CUP_UAZ_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_MG_CHDKZ: CUP_UAZ_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_AGS30_CHDKZ: CUP_UAZ_AGS30_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_SPG9_CHDKZ: CUP_UAZ_SPG9_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_METIS_CHDKZ: CUP_UAZ_METIS_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Unarmed_SLA: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Militia_SLA: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Open_SLA: CUP_UAZ_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_MG_SLA: CUP_UAZ_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_AGS30_SLA: CUP_UAZ_AGS30_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_SPG9_SLA: CUP_UAZ_SPG9_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_METIS_SLA: CUP_UAZ_METIS_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Unarmed_CSAT: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Militia_CSAT: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Open_CSAT: CUP_UAZ_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_MG_CSAT: CUP_UAZ_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_AGS30_CSAT: CUP_UAZ_AGS30_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_SPG9_CSAT: CUP_UAZ_SPG9_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_METIS_CSAT: CUP_UAZ_METIS_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Unarmed_RU: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Open_RU: CUP_UAZ_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_MG_RU: CUP_UAZ_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_AGS30_RU: CUP_UAZ_AGS30_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_SPG9_RU: CUP_UAZ_SPG9_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_METIS_RU: CUP_UAZ_METIS_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_AMB_RU: CUP_UAZ_Amb_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Unarmed_TKA: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_Open_TKA: CUP_UAZ_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_MG_TKA: CUP_UAZ_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_AGS30_TKA: CUP_UAZ_AGS30_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_SPG9_TKA: CUP_UAZ_SPG9_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_UAZ_METIS_TKA: CUP_UAZ_METIS_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_I_UAZ_Unarmed_UN: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_I_UAZ_Open_UN: CUP_UAZ_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_I_UAZ_MG_UN: CUP_UAZ_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_I_UAZ_AGS30_UN: CUP_UAZ_AGS30_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_I_UAZ_SPG9_UN: CUP_UAZ_SPG9_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_C_UAZ_Unarmed_TK_CIV: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_C_UAZ_Open_TK_CIV: CUP_UAZ_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_Unarmed_ACR: CUP_UAZ_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_Open_ACR: CUP_UAZ_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_MG_ACR: CUP_UAZ_MG_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_AGS30_ACR: CUP_UAZ_AGS30_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_SPG9_ACR: CUP_UAZ_SPG9_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_B_UAZ_METIS_ACR: CUP_UAZ_METIS_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.1, -1.27};
    };
    class CUP_O_Ural_RU: CUP_Ural_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_O_Ural_Open_RU: CUP_Ural_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_O_Ural_Refuel_RU: CUP_Ural_Refuel_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.23, 0.65};
    };
    class CUP_O_Ural_Repair_RU: CUP_Ural_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.04, 0.65};
    };
    class CUP_O_Ural_Reammo_RU: CUP_Ural_Reammo_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.05, 0.65};
    };
    class CUP_O_Ural_Empty_RU: CUP_Ural_Empty_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 0.65};
    };
    class CUP_O_BM21_RU: CUP_BM21_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.87, 0.65};
    };
    class CUP_B_Ural_CDF: CUP_Ural_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_B_Ural_Open_CDF: CUP_Ural_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_B_Ural_Refuel_CDF: CUP_Ural_Refuel_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.23, 0.65};
    };
    class CUP_B_Ural_Repair_CDF: CUP_Ural_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.04, 0.65};
    };
    class CUP_B_Ural_Reammo_CDF: CUP_Ural_Reammo_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.05, 0.65};
    };
    class CUP_B_Ural_Empty_CDF: CUP_Ural_Empty_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 0.65};
    };
    class CUP_B_BM21_CDF: CUP_BM21_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.87, 0.65};
    };
    class CUP_O_Ural_CHDKZ: CUP_Ural_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_O_Ural_Open_CHDKZ: CUP_Ural_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_O_Ural_Refuel_CHDKZ: CUP_Ural_Refuel_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.23, 0.65};
    };
    class CUP_O_Ural_Repair_CHDKZ: CUP_Ural_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.04, 0.65};
    };
    class CUP_O_Ural_Reammo_CHDKZ: CUP_Ural_Reammo_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.05, 0.65};
    };
    class CUP_O_Ural_Empty_CHDKZ: CUP_Ural_Empty_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 0.65};
    };
    class CUP_O_BM21_CHDKZ: CUP_BM21_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.87, 0.65};
    };
    class CUP_O_Ural_TKA: CUP_Ural_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_O_Ural_Open_TKA: CUP_Ural_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_O_Ural_Refuel_TKA: CUP_Ural_Refuel_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.23, 0.65};
    };
    class CUP_O_Ural_Repair_TKA: CUP_Ural_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.04, 0.65};
    };
    class CUP_O_Ural_Reammo_TKA: CUP_Ural_Reammo_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.05, 0.65};
    };
    class CUP_O_Ural_Empty_TKA: CUP_Ural_Empty_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 0.65};
    };
    class CUP_O_BM21_TKA: CUP_BM21_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.87, 0.65};
    };
    class CUP_O_Ural_SLA: CUP_Ural_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_O_Ural_Open_SLA: CUP_Ural_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_O_Ural_Refuel_SLA: CUP_Ural_Refuel_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.23, 0.65};
    };
    class CUP_O_Ural_Repair_SLA: CUP_Ural_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.04, 0.65};
    };
    class CUP_O_Ural_Reammo_SLA: CUP_Ural_Reammo_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.05, 0.65};
    };
    class CUP_O_Ural_Empty_SLA: CUP_Ural_Empty_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 0.65};
    };
    class CUP_O_BM21_SLA: CUP_BM21_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.87, 0.65};
    };
    class CUP_I_Ural_UN: CUP_Ural_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_I_Ural_Repair_UN: CUP_Ural_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.04, 0.65};
    };
    class CUP_I_Ural_Reammo_UN: CUP_Ural_Reammo_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.05, 0.65};
    };
    class CUP_I_Ural_Empty_UN: CUP_Ural_Empty_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.16, 0.65};
    };
    class CUP_C_Ural_Civ_01: CUP_Ural_Civ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.07, 0.87};
    };
    class CUP_C_Ural_Open_Civ_01: CUP_Ural_Civ_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.15, -1.14};
    };
    class CUP_O_V3S_Open_TKA: CUP_V3S_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.27, 0.62};
    };
    class CUP_O_V3S_Covered_TKA: CUP_V3S_Covered_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.15, 0.62};
    };
    class CUP_O_V3S_Refuel_TKA: CUP_V3S_Refuel_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.3, 0.59};
    };
    class CUP_O_V3S_Repair_TKA: CUP_V3S_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.74, 0.59};
    };
    class CUP_O_V3S_Rearm_TKA: CUP_V3S_Rearm_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.74, 0.59};
    };
    class CUP_O_V3S_Open_TKM: CUP_V3S_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.27, 0.62};
    };
    class CUP_O_V3S_Covered_TKM: CUP_V3S_Covered_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.15, 0.62};
    };
    class CUP_O_V3S_Refuel_TKM: CUP_V3S_Refuel_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.3, 0.59};
    };
    class CUP_O_V3S_Repair_TKM: CUP_V3S_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.74, 0.59};
    };
    class CUP_O_V3S_Rearm_TKM: CUP_V3S_Rearm_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.74, 0.59};
    };
    class CUP_I_V3S_Open_TKG: CUP_V3S_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.27, 0.62};
    };
    class CUP_I_V3S_Covered_TKG: CUP_V3S_Covered_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.15, 0.62};
    };
    class CUP_I_V3S_Refuel_TKG: CUP_V3S_Refuel_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.3, 0.59};
    };
    class CUP_I_V3S_Repair_TKG: CUP_V3S_Repair_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.74, 0.59};
    };
    class CUP_I_V3S_Rearm_TKG: CUP_V3S_Rearm_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.74, 0.59};
    };
    class CUP_C_V3S_Open_TKC: CUP_V3S_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.27, 0.62};
    };
    class CUP_C_V3S_Covered_TKC: CUP_V3S_Covered_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.15, 0.62};
    };
    class CUP_V3S_Open_NAPA: CUP_V3S_Open_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.27, 0.62};
    };
    class CUP_B_Wolfhound_HMG_GB_D: CUP_Wolfhound_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.84, -1.23};
    };
    class CUP_B_Wolfhound_HMG_GB_W: CUP_Wolfhound_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.84, -1.23};
    };
    class CUP_B_Wolfhound_GMG_GB_D: CUP_Wolfhound_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.84, -1.23};
    };
    class CUP_B_Wolfhound_GMG_GB_W: CUP_Wolfhound_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.84, -1.23};
    };
    class CUP_B_Wolfhound_LMG_GB_D: CUP_Wolfhound_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.84, -1.23};
    };
    class CUP_B_Wolfhound_LMG_GB_W: CUP_Wolfhound_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0.84, -1.23};
    };
    class CUP_C_AN2_AEROSCHROT_TK_CIV: CUP_AN2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.01};
    };
    class CUP_C_AN2_CIV: CUP_AN2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.01};
    };
    class CUP_C_AN2_AIRTAK_TK_CIV: CUP_AN2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.01};
    };
    class CUP_O_AN2_TK: CUP_AN2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.01};
    };
    class CUP_B_AV8B_DYN_USMC: CUP_AV8B_DYN_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.84};
    };
    class CUP_B_GR9_DYN_GB: CUP_GR9_DYN_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.67};
    };
    class CUP_B_AW159_Unarmed_GB: CUP_AW159_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, -1.26};
    };
    class CUP_B_AW159_Unarmed_RN_Grey: CUP_AW159_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, -1.26};
    };
    class CUP_B_AW159_Unarmed_RN_Blackcat: CUP_AW159_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, -1.26};
    };
    class CUP_B_AW159_GB: CUP_AW159_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, -1.26};
    };
    class CUP_B_AW159_RN_Grey: CUP_AW159_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, -1.26};
    };
    class CUP_B_AW159_RN_Blackcat: CUP_AW159_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, -1.26};
    };
    class CUP_I_Wildcat_Unarmed_Green_AAF: CUP_AW159_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, -1.26};
    };
    class CUP_I_Wildcat_Unarmed_Digital_AAF: CUP_AW159_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, -1.26};
    };
    class CUP_I_Wildcat_Green_AAF: CUP_AW159_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.21, -1.26};
    };
    class CUP_B_C130J_USMC: CUP_C130J_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 4.34};
    };
    class CUP_B_C130J_Cargo_USMC: CUP_C130J_VIV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 4.34};
    };
    class CUP_B_C130J_GB: CUP_C130J_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 4.34};
    };
    class CUP_B_C130J_Cargo_GB: CUP_C130J_VIV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 4.34};
    };
    class CUP_I_C130J_AAF: CUP_C130J_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 4.34};
    };
    class CUP_I_C130J_Cargo_AAF: CUP_C130J_VIV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 4.34};
    };
    class CUP_I_C130J_RACS: CUP_C130J_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 4.34};
    };
    class CUP_I_C130J_Cargo_RACS: CUP_C130J_VIV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 4.34};
    };
    class CUP_O_C130J_TKA: CUP_C130J_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 4.34};
    };
    class CUP_O_C130J_Cargo_TKA: CUP_C130J_VIV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 4.34};
    };
    class CUP_B_Merlin_HC3_GB: CUP_Merlin_HC3_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.6, -1.3};
    };
    class CUP_B_Merlin_HC3_VIV_GB: CUP_Merlin_HC3_VIV_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.6, -1.3};
    };
    class CUP_B_Merlin_HC3A_GB: CUP_Merlin_HC3A_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.6, -1.3};
    };
    class CUP_B_Merlin_HC3_Armed_GB: CUP_Merlin_HC3_Armed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.6, -1.3};
    };
    class CUP_B_Merlin_HC3A_Armed_GB: CUP_Merlin_HC3A_Armed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.6, -1.3};
    };
    class CUP_B_Merlin_HC4_GB: CUP_Merlin_HM2_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.6, -1.3};
    };
    class CUP_I_Ka60_GL_Blk_ION: CUP_Ka60_GL_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_I_Ka60_Blk_ION: CUP_Ka60_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_I_Ka60_GL_Digi_AAF: CUP_Ka60_GL_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_I_Ka60_Digi_AAF: CUP_Ka60_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_O_Ka60_GL_Hex_CSAT: CUP_Ka60_GL_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_O_Ka60_Hex_CSAT: CUP_Ka60_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_O_Ka60_GL_Blk_CSAT: CUP_Ka60_GL_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_O_Ka60_Blk_CSAT: CUP_Ka60_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_O_Ka60_GL_Whale_CSAT: CUP_Ka60_GL_BASE {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_O_Ka60_Whale_CSAT: CUP_Ka60_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_O_Ka60_Grey_RU: CUP_Ka60_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -1.16, 0.84};
    };
    class CUP_I_L39_AAF: CUP_L39_DYN_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.14};
    };
    class CUP_O_L39_TK: CUP_L39_DYN_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.14};
    };
    class CUP_B_L39_CZ: CUP_L39_DYN_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 1.14};
    };
    class CUP_O_Mi24_P_Dynamic_RU: CUP_Mi24_P_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_O_Mi24_V_Dynamic_RU: CUP_Mi24_V_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_B_Mi24_D_Dynamic_CDF: CUP_Mi24_D_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_B_Mi24_D_MEV_Dynamic_CDF: CUP_Mi24_D_MEV_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_O_Mi24_D_Dynamic_CSAT_T: CUP_Mi24_D_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_O_Mi24_P_Dynamic_CSAT_T: CUP_Mi24_P_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_O_Mi24_V_Dynamic_CSAT_T: CUP_Mi24_V_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_O_Mi24_D_Dynamic_TK: CUP_Mi24_D_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_O_Mi24_D_Dynamic_SLA: CUP_Mi24_D_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_B_Mi35_Dynamic_CZ: CUP_Mi35_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_I_Mi24_D_Dynamic_UN: CUP_Mi24_D_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_I_Mi24_D_Dynamic_AAF: CUP_Mi24_D_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_I_Mi24_D_Dynamic_ION: CUP_Mi24_D_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.5, 1.45};
    };
    class CUP_I_Mi24_Mk3_AAF: CUP_Mi35_TOH_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.24, 1.75};
    };
    class CUP_O_Mi24_Mk3_CSAT_T: CUP_Mi35_TOH_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.24, 1.75};
    };
    class CUP_I_Mi24_Mk3_ION: CUP_Mi35_TOH_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.24, 1.75};
    };
    class CUP_I_Mi24_Mk3_UN: CUP_Mi35_TOH_Dynamic_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.24, 1.75};
    };
    class CUP_O_Mi8_CHDKZ: CUP_Mi8_base {
        EGVAR(heavylifter,attachPos)[] = {0, -3.39, 2};
    };
    class CUP_O_Mi8_medevac_CHDKZ: CUP_Mi8_medevac_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_O_Mi8_VIV_CHDKZ: CUP_Mi8_VIV_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_B_Mi17_CDF: CUP_Mi8_base {
        EGVAR(heavylifter,attachPos)[] = {0, -3.39, 2};
    };
    class CUP_B_Mi17_medevac_CDF: CUP_Mi8_medevac_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_B_Mi17_VIV_CDF: CUP_Mi8_VIV_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_I_Mi17_UN: CUP_Mi8_base {
        EGVAR(heavylifter,attachPos)[] = {0, -3.39, 2};
    };
    class CUP_I_Mi17_VIV_UN: CUP_Mi8_VIV_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_O_Mi17_TK: CUP_Mi8_base {
        EGVAR(heavylifter,attachPos)[] = {0, -3.39, 2};
    };
    class CUP_O_Mi17_VIV_TK: CUP_Mi8_VIV_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_O_Mi8_medevac_RU: CUP_Mi8_medevac_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_O_Mi8_VIV_RU: CUP_Mi8_VIV_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_O_Mi8_RU: CUP_Mi8_MTV3_base {
        EGVAR(heavylifter,attachPos)[] = {0, -3.4, 2};
    };
    class CUP_C_Mi17_Civilian_RU: CUP_Mi8_medevac_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_C_Mi17_VIV_RU: CUP_Mi8_VIV_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_B_Mi171Sh_ACR: CUP_Mi171Sh_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -3.38, 2.03};
    };
    class CUP_B_Mi171Sh_Unarmed_ACR: CUP_Mi171Sh_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -3.38, 2.03};
    };
    class CUP_O_Mi8_SLA_1: CUP_Mi8_base {
        EGVAR(heavylifter,attachPos)[] = {0, -3.39, 2};
    };
    class CUP_O_Mi8_SLA_2: CUP_Mi8_MTV3_base {
        EGVAR(heavylifter,attachPos)[] = {0, -3.4, 2};
    };
    class CUP_O_Mi8_VIV_SLA: CUP_Mi8_VIV_base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.78, 0.61};
    };
    class CUP_B_MV22_USMC: Plane_Base_F {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 2.49};
    };
    class CUP_B_SA330_Puma_HC1_BAF: CUP_SA330_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -2.01, 1.63};
    };
    class CUP_B_FV432_Bulldog_GB_D: CUP_FV432_Bulldog_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.01, -0.38};
    };
    class CUP_C_SUV_TK: CUP_SUV_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.15, -0.28};
    };
    class CUP_C_SUV_CIV: CUP_SUV_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.15, -0.28};
    };
    class CUP_O_SUV_TKA: CUP_SUV_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.15, -0.28};
    };
    class CUP_I_SUV_UNO: CUP_SUV_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.15, -0.28};
    };
    class CUP_I_SUV_ION: CUP_SUV_Unarmed_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.15, -0.28};
    };
    class CUP_I_SUV_Armored_ION: CUP_SUV_Armored_Base {
        EGVAR(heavylifter,attachPos)[] = {0, -0.15, -0.32};
    };
    class CUP_C_A300_CIV: CUP_Ambient_A330_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 6.79};
    };
    class CUP_C_B737_CIV: CUP_Ambient_B737_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 5.9};
    };
    class CUP_C_Cessna_172_CIV: CUP_Ambient_Cessna172_Base {
        EGVAR(heavylifter,attachPos)[] = {0, 0, 0.62};
    };
};
