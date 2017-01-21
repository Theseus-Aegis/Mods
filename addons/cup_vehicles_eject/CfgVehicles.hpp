class CfgVehicles {
    class Air;
    class Helicopter_Base_F;
    class CUP_AH1Z_Base;
    class CUP_B_UH1Y_Base;

    class Plane: Air {
        class Turrets;
    };
    class Helicopter_Base_H: Helicopter_Base_F {
        class Turrets;
    };
    class CUP_B_AH1Z_USMC: CUP_AH1Z_Base {
        class Turrets;
    };
    class CUP_B_AH1Z_AT_USMC: CUP_AH1Z_Base {
        class Turrets;
    };
    class CUP_B_AH1Z_Escort_USMC: CUP_AH1Z_Base {
        class Turrets;
    };
    class CUP_CH53E_Base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_KA50_Base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_MH60S_Base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_Su25_base: Plane {
        class Turrets;
    };
    class CUP_SU34_BASE: Plane {
        class Turrets;
    };
    class CUP_UH1H_base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_B_UH1Y_UNA_USMC: CUP_B_UH1Y_Base {
        class Turrets;
    };
    class CUP_Uh60_Base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_Uh60_FFV_Base: CUP_Uh60_Base {
        class Turrets;
    };
    class CUP_UH60_Unarmed_Base: CUP_Uh60_Base {
        class Turrets;
    };
    class CUP_Uh60_Unarmed_FFV_Base: CUP_UH60_Unarmed_Base {
        class Turrets;
    };
    class CUP_CH47F_base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_Merlin_HC3_Base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_Merlin_HC3_Armed_Base: CUP_Merlin_HC3_Base {
        class Turrets;
    };
    class CUP_Ka60_Base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_Mi24_Base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_MI35_TOH_Base: CUP_Mi24_Base {
        class Turrets;
    };
    class CUP_MI6A_Base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_Mi8_base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_Mi171Sh_Base: CUP_Mi8_base {
        class Turrets;
    };

    class CUP_A10_Base: Plane {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_B_AH1Z: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_B_AH1Z_AT: CUP_B_AH1Z_USMC {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_B_AH1Z_Escort: CUP_B_AH1Z_AT_USMC {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_AH6_BASE: CUP_B_AH1Z_Escort_USMC {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_CH53E_VIV_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_F35B_base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_KA50_AA_Base: CUP_CH53E_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Ka52_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_MH60S_FFV_Base: CUP_KA50_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Su25_GBU_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Su25_AT_Base: CUP_MH60S_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_SU34_LGB_Base: CUP_Su25_base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_SU34_AGM_Base: CUP_SU34_BASE {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_UH1H_slick_base: CUP_SU34_BASE {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_B_UH1Y_UNA_F: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Uh60L_Base: CUP_UH1H_base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Uh60L_FFV_Base: CUP_B_UH1Y_UNA_USMC {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Uh60L_Unarmed_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Uh60L_Unarmed_FFV_Base: CUP_Uh60_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_AH64D_Base: CUP_Uh60_FFV_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_AV8B_Base: CUP_UH60_Unarmed_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_AW159_Unarmed_Base: CUP_Uh60_Unarmed_FFV_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_CH47F_VIV_Base: Plane {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Merlin_HC3_VIV_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Merlin_HC3A_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Merlin_HC3A_Armed_Base: CUP_CH47F_base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Merlin_HM2_Base: CUP_Merlin_HC3_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Ka60_GL_BASE: CUP_Merlin_HC3_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi24_P_Base: CUP_Merlin_HC3_Armed_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi24_V_Base: CUP_Ka60_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi24_D_Base: CUP_Mi24_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi24_D_MEV_Base: CUP_Mi24_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi35_Base: CUP_Mi24_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi35_S8_Base: CUP_Mi24_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi35_AT_Base: CUP_Mi24_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi35_FAB_Base: CUP_MI35_TOH_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi35_Empty_Base: CUP_MI35_TOH_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi35_S8_GSh_Base: CUP_MI35_TOH_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_MI6T_Base: CUP_MI35_TOH_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi8_medevac_base: CUP_MI35_TOH_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi8_VIV_base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi8_MTV3_base: CUP_MI6A_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi171Sh_Unarmed_Base: CUP_Mi8_base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class Plane_Base_F: CUP_Mi8_base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_SA330_Base: CUP_Mi8_base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };

    class CUP_B_A10_CAS_USA: CUP_A10_Base { // Sources: ["CUP_AirVehicles_A10"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_A10_AT_USA: CUP_A10_Base { // Sources: ["CUP_AirVehicles_A10"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_USMC: CUP_AH1Z_Base { // Sources: ["CUP_AirVehicles_AH1Z"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_NoWeapons_USMC: CUP_AH1Z_Base { // Sources: ["CUP_AirVehicles_AH1Z"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_AT_USMC: CUP_AH1Z_Base { // Sources: ["CUP_AirVehicles_AH1Z"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_Escort_USMC: CUP_AH1Z_Base { // Sources: ["CUP_AirVehicles_AH1Z"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_7RndHydra_USMC: CUP_AH1Z_Base { // Sources: ["CUP_AirVehicles_AH1Z"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_14RndHydra_USMC: CUP_AH1Z_Base { // Sources: ["CUP_AirVehicles_AH1Z"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_NOAA_USMC: CUP_AH1Z_Base { // Sources: ["CUP_AirVehicles_AH1Z"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH1Z_AAF: CUP_B_AH1Z { // Sources: ["CUP_AirVehicles_AH1Z"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH1Z_AT_AAF: CUP_B_AH1Z_AT { // Sources: ["CUP_AirVehicles_AH1Z"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH1Z_Escort_AAF: CUP_B_AH1Z_Escort { // Sources: ["CUP_AirVehicles_AH1Z"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH6J_Escort_USA: CUP_AH6_BASE { // Sources: ["CUP_AirVehicles_AH6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH6J_AT_USA: CUP_B_AH6J_Escort_USA { // Sources: ["CUP_AirVehicles_AH6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH6J_MP_USA: CUP_B_AH6J_Escort_USA { // Sources: ["CUP_AirVehicles_AH6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH6J_Escort19_USA: CUP_AH6_BASE { // Sources: ["CUP_AirVehicles_AH6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MH6J_USA: CUP_AH6_BASE { // Sources: ["CUP_AirVehicles_AH6","CUP_Vehicles_ACE_compat"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH6X_USA: CUP_AH6_BASE { // Sources: ["CUP_AirVehicles_AH6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH6J_Escort_RACS: CUP_AH6_BASE { // Sources: ["CUP_AirVehicles_AH6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH6J_AT_RACS: CUP_I_AH6J_Escort_RACS { // Sources: ["CUP_AirVehicles_AH6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH6J_MP_RACS: CUP_I_AH6J_Escort_RACS { // Sources: ["CUP_AirVehicles_AH6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH6J_Escort19_RACS: CUP_I_AH6J_Escort_RACS { // Sources: ["CUP_AirVehicles_AH6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_MH6J_RACS: CUP_AH6_BASE { // Sources: ["CUP_AirVehicles_AH6","CUP_Vehicles_ACE_compat"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH53E_USMC: CUP_CH53E_Base { // Sources: ["CUP_AirVehicles_CH53E"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH53E_VIV_USMC: CUP_CH53E_VIV_Base { // Sources: ["CUP_AirVehicles_CH53E"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH53E_GER: CUP_CH53E_Base { // Sources: ["CUP_AirVehicles_CH53E"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH53E_VIV_GER: CUP_CH53E_VIV_Base { // Sources: ["CUP_AirVehicles_CH53E"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_F35B_AA_USMC: CUP_F35B_base { // Sources: ["CUP_AirVehicles_F35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_F35B_CAS_USMC: CUP_F35B_base { // Sources: ["CUP_AirVehicles_F35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_F35B_LGB_USMC: CUP_F35B_base { // Sources: ["CUP_AirVehicles_F35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_F35B_AA_BAF: CUP_B_F35B_AA_USMC { // Sources: ["CUP_AirVehicles_F35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_F35B_CAS_BAF: CUP_B_F35B_CAS_USMC { // Sources: ["CUP_AirVehicles_F35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_F35B_LGB_BAF: CUP_B_F35B_LGB_USMC { // Sources: ["CUP_AirVehicles_F35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka50_SLA: CUP_KA50_Base { // Sources: ["CUP_AirVehicles_Ka50"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka50_AA_SLA: CUP_KA50_AA_Base { // Sources: ["CUP_AirVehicles_Ka50"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka50_RU: CUP_KA50_Base { // Sources: ["CUP_AirVehicles_Ka50"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka50_AA_RU: CUP_KA50_AA_Base { // Sources: ["CUP_AirVehicles_Ka50"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka52_RU: CUP_Ka52_Base { // Sources: ["CUP_AirVehicles_Ka52"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka52_Blk_RU: CUP_Ka52_Base { // Sources: ["CUP_AirVehicles_Ka52"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka52_GreyCamo_RU: CUP_Ka52_Base { // Sources: ["CUP_AirVehicles_Ka52"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka52_Grey_RU: CUP_Ka52_Base { // Sources: ["CUP_AirVehicles_Ka52"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MH60S_USMC: CUP_MH60S_Base { // Sources: ["CUP_AirVehicles_MH60S"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MH60S_FFV_USMC: CUP_MH60S_FFV_Base { // Sources: ["CUP_AirVehicles_MH60S"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Su25_CDF: CUP_Su25_base { // Sources: ["CUP_AirVehicles_Su25"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Su25_TKA: CUP_Su25_base { // Sources: ["CUP_AirVehicles_Su25"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Su25_SLA: CUP_Su25_base { // Sources: ["CUP_AirVehicles_Su25"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Su25_RU_1: CUP_Su25_GBU_Base { // Sources: ["CUP_AirVehicles_Su25"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Su25_RU_2: CUP_Su25_AT_Base { // Sources: ["CUP_AirVehicles_Su25"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Su25_RU_3: CUP_Su25_base { // Sources: ["CUP_AirVehicles_Su25"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_SU34_LGB_CSAT: CUP_SU34_LGB_Base { // Sources: ["CUP_AirVehicles_SU34"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_SU34_AGM_CSAT: CUP_SU34_AGM_Base { // Sources: ["CUP_AirVehicles_SU34"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_SU34_LGB_RU: CUP_SU34_LGB_Base { // Sources: ["CUP_AirVehicles_SU34"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_SU34_AGM_RU: CUP_SU34_AGM_Base { // Sources: ["CUP_AirVehicles_SU34"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_SU34_LGB_SLA: CUP_SU34_LGB_Base { // Sources: ["CUP_AirVehicles_SU34"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_SU34_AGM_SLA: CUP_SU34_AGM_Base { // Sources: ["CUP_AirVehicles_SU34"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_SU34_LGB_AAF: CUP_SU34_LGB_Base { // Sources: ["CUP_AirVehicles_SU34"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_SU34_AGM_AAF: CUP_SU34_AGM_Base { // Sources: ["CUP_AirVehicles_SU34"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_SU34_LGB_CDF: CUP_SU34_LGB_Base { // Sources: ["CUP_AirVehicles_SU34"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_SU34_AGM_CDF: CUP_SU34_AGM_Base { // Sources: ["CUP_AirVehicles_SU34"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_UH1H_TKA: CUP_UH1H_base { // Sources: ["CUP_AirVehicles_UH1H"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_UH1H_slick_TKA: CUP_UH1H_slick_base { // Sources: ["CUP_AirVehicles_UH1H"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_UH1H_SLA: CUP_UH1H_base { // Sources: ["CUP_AirVehicles_UH1H"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_UH1H_slick_SLA: CUP_UH1H_slick_base { // Sources: ["CUP_AirVehicles_UH1H"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH1H_TK_GUE: CUP_UH1H_base { // Sources: ["CUP_AirVehicles_UH1H"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH1H_slick_TK_GUE: CUP_UH1H_slick_base { // Sources: ["CUP_AirVehicles_UH1H"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1D_GER_KSK: CUP_UH1H_base { // Sources: ["CUP_AirVehicles_UH1H"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1D_slick_GER_KSK: CUP_UH1H_slick_base { // Sources: ["CUP_AirVehicles_UH1H"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1D_GER_KSK_Des: CUP_UH1H_base { // Sources: ["CUP_AirVehicles_UH1H"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1D_slick_GER_KSK_Des: CUP_UH1H_slick_base { // Sources: ["CUP_AirVehicles_UH1H"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1Y_UNA_USMC: CUP_B_UH1Y_Base { // Sources: ["CUP_AirVehciles_UH1Y","CUP_Vehicles_ACE_compat"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1Y_MEV_USMC: CUP_B_UH1Y_UNA_F { // Sources: ["CUP_AirVehciles_UH1Y"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1Y_GUNSHIP_USMC: CUP_B_UH1Y_Base { // Sources: ["CUP_AirVehciles_UH1Y"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60M_US: CUP_Uh60_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60L_US: CUP_Uh60L_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60M_FFV_US: CUP_Uh60_FFV_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60L_FFV_US: CUP_Uh60L_FFV_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60M_Unarmed_US: CUP_UH60_Unarmed_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60L_Unarmed_US: CUP_Uh60L_Unarmed_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60M_Unarmed_FFV_US: CUP_Uh60_Unarmed_FFV_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60L_Unarmed_FFV_US: CUP_Uh60L_Unarmed_FFV_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60M_Unarmed_FFV_MEV_US: CUP_Uh60_Unarmed_FFV_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60L_Unarmed_FFV_MEV_US: CUP_Uh60L_Unarmed_FFV_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH60L_RACS: CUP_Uh60L_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH60L_FFV_RACS: CUP_Uh60L_FFV_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH60L_Unarmed_RACS: CUP_Uh60L_Unarmed_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH60L_Unarmed_FFV_Racs: CUP_Uh60L_Unarmed_FFV_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH60L_Unarmed_FFV_MEV_Racs: CUP_Uh60L_Unarmed_FFV_Base { // Sources: ["CUP_AirVehicles_UH60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH64D_NO_USA: CUP_AH64D_Base { // Sources: ["CUP_AirVehicles_AH64"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH64D_AT_USA: CUP_AH64D_Base { // Sources: ["CUP_AirVehicles_AH64"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH64D_ES_USA: CUP_AH64D_Base { // Sources: ["CUP_AirVehicles_AH64"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH64D_USA: CUP_AH64D_Base { // Sources: ["CUP_AirVehicles_AH64"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH64D_MR_USA: CUP_AH64D_Base { // Sources: ["CUP_AirVehicles_AH64"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1_NO_BAF: CUP_B_AH64D_NO_USA { // Sources: ["CUP_AirVehicles_AH64"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1_AT_BAF: CUP_B_AH64D_AT_USA { // Sources: ["CUP_AirVehicles_AH64"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1_ES_BAF: CUP_B_AH64D_ES_USA { // Sources: ["CUP_AirVehicles_AH64"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1_BAF: CUP_B_AH64D_USA { // Sources: ["CUP_AirVehicles_AH64"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1_MR_BAF: CUP_B_AH64D_MR_USA { // Sources: ["CUP_AirVehicles_AH64"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AV8B_CAP_USMC: CUP_AV8B_Base { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AV8B_CAP_AAF: CUP_B_AV8B_CAP_USMC { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AV8B_MK82_USMC: CUP_AV8B_Base { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AV8B_MK82_AAF: CUP_B_AV8B_MK82_USMC { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AV8B_GBU12_USMC: CUP_AV8B_Base { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AV8B_GBU12_AAF: CUP_B_AV8B_GBU12_USMC { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AV8B_AGM_USMC: CUP_AV8B_Base { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AV8B_AGM_AAF: CUP_B_AV8B_AGM_USMC { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_GR9_CAP_GB: CUP_AV8B_Base { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_GR9_Mk82_GB: CUP_AV8B_Base { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_GR9_GBU12_GB: CUP_AV8B_Base { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_GR9_AGM_GB: CUP_AV8B_Base { // Sources: ["CUP_AirVehicles_AV8B"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Unarmed_GB: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Unarmed_RN_Grey: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Unarmed_RN_Blackcat: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Hellfire_GB: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Hellfire_RN_Grey: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Hellfire_RN_Blackcat: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Cannon_GB: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Cannon_RN_Grey: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Cannon_RN_Blackcat: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Unarmed_Green_AAF: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Hellfire_Armed_Green_AAF: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Cannon_Armed_Green_AAF: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Unarmed_Digital_AAF: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Hellfire_Armed_Digital_AAF: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Cannon_Armed_Digital_AAF: CUP_AW159_Unarmed_Base { // Sources: ["CUP_AirVehciles_AW159"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH47F_USA: CUP_CH47F_base { // Sources: ["CUP_AirVehicles_CH47"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH47F_VIV_USA: CUP_CH47F_VIV_Base { // Sources: ["CUP_AirVehicles_CH47"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH47F_GB: CUP_CH47F_base { // Sources: ["CUP_AirVehicles_CH47"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH47F_VIV_GB: CUP_CH47F_VIV_Base { // Sources: ["CUP_AirVehicles_CH47"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC3_GB: CUP_Merlin_HC3_Base { // Sources: ["CUP_AirVehicles_HC3"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC3_VIV_GB: CUP_Merlin_HC3_VIV_Base { // Sources: ["CUP_AirVehicles_HC3"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC3A_GB: CUP_Merlin_HC3A_Base { // Sources: ["CUP_AirVehicles_HC3"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC3_Armed_GB: CUP_Merlin_HC3_Armed_Base { // Sources: ["CUP_AirVehicles_HC3"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC3A_Armed_GB: CUP_Merlin_HC3A_Armed_Base { // Sources: ["CUP_AirVehicles_HC3"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC4_GB: CUP_Merlin_HM2_Base { // Sources: ["CUP_AirVehicles_HC3"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Ka60_GL_Blk_ION: CUP_Ka60_GL_BASE { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Ka60_Blk_ION: CUP_Ka60_Base { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Ka60_GL_Digi_AAF: CUP_Ka60_GL_BASE { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Ka60_Digi_AAF: CUP_Ka60_Base { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_GL_Hex_CSAT: CUP_Ka60_GL_BASE { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_Hex_CSAT: CUP_Ka60_Base { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_GL_Blk_CSAT: CUP_Ka60_GL_BASE { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_Blk_CSAT: CUP_Ka60_Base { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_GL_Whale_CSAT: CUP_Ka60_GL_BASE { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_Whale_CSAT: CUP_Ka60_Base { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_Grey_RU: CUP_Ka60_Base { // Sources: ["CUP_AirVehciles_KA60"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi24_P_RU: CUP_Mi24_P_Base { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi24_V_RU: CUP_Mi24_V_Base { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi24_D_CDF: CUP_Mi24_D_Base { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi24_D_MEV_CDF: CUP_Mi24_D_MEV_Base { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi24_D_TK: CUP_Mi24_D_Base { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi24_D_SLA: CUP_Mi24_D_Base { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi35_CZ: CUP_Mi35_Base { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi35_CZ_Des: CUP_B_Mi35_CZ { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi35_CZ_Ram: CUP_B_Mi35_CZ { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi35_CZ_Tiger: CUP_B_Mi35_CZ { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi35_CZ_Dark: CUP_B_Mi35_CZ { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_D_UN: CUP_Mi24_D_Base { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_D_AAF: CUP_Mi24_D_Base { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_D_ION: CUP_Mi24_D_Base { // Sources: ["CUP_AirVehicles_Mi24"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_AAF: CUP_Mi35_S8_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_AAF: CUP_I_Mi24_Mk3_AAF { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_AT_AAF: CUP_Mi35_AT_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_AT_AAF: CUP_I_Mi24_Mk3_AT_AAF { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_FAB_AAF: CUP_Mi35_FAB_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_FAB_AAF: CUP_I_Mi24_Mk3_FAB_AAF { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_Empty_AAF: CUP_Mi35_Empty_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_Empty_AAF: CUP_I_Mi24_Mk3_Empty_AAF { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_S8_GSh_AAF: CUP_Mi35_S8_GSh_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_S8_GSh_AAF: CUP_I_Mi24_Mk3_S8_GSh_AAF { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_ION: CUP_Mi35_S8_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_ION: CUP_I_Mi24_Mk3_ION { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_AT_ION: CUP_Mi35_AT_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_AT_ION: CUP_I_Mi24_Mk3_AT_ION { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_FAB_ION: CUP_Mi35_FAB_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_FAB_ION: CUP_I_Mi24_Mk3_FAB_ION { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_Empty_ION: CUP_Mi35_Empty_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_Empty_ION: CUP_I_Mi24_Mk3_Empty_ION { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_S8_GSh_ION: CUP_Mi35_S8_GSh_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_S8_GSh_ION: CUP_I_Mi24_Mk3_S8_GSh_ION { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_UN: CUP_Mi35_S8_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_UN: CUP_I_Mi24_Mk3_UN { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_AT_UN: CUP_Mi35_AT_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_AT_UN: CUP_I_Mi24_Mk3_AT_UN { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_FAB_UN: CUP_Mi35_FAB_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_FAB_UN: CUP_I_Mi24_Mk3_FAB_UN { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_Empty_UN: CUP_Mi35_Empty_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_Empty_UN: CUP_I_Mi24_Mk3_Empty_UN { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_S8_GSh_UN: CUP_Mi35_S8_GSh_Base { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_S8_GSh_UN: CUP_I_Mi24_Mk3_S8_GSh_UN { // Sources: ["CUP_AirVehicles_Mi35"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MI6A_CDF: CUP_MI6A_Base { // Sources: ["CUP_AirVehicles_MI6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MI6T_CDF: CUP_MI6T_Base { // Sources: ["CUP_AirVehicles_MI6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6A_CHDKZ: CUP_MI6A_Base { // Sources: ["CUP_AirVehicles_MI6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6T_CHDKZ: CUP_MI6T_Base { // Sources: ["CUP_AirVehicles_MI6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6A_TKA: CUP_MI6A_Base { // Sources: ["CUP_AirVehicles_MI6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6T_TKA: CUP_MI6T_Base { // Sources: ["CUP_AirVehicles_MI6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6A_RU: CUP_MI6A_Base { // Sources: ["CUP_AirVehicles_MI6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6T_RU: CUP_MI6T_Base { // Sources: ["CUP_AirVehicles_MI6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_MI6A_RU: CUP_MI6A_Base { // Sources: ["CUP_AirVehicles_MI6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_MI6T_RU: CUP_MI6T_Base { // Sources: ["CUP_AirVehicles_MI6"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_CHDKZ: CUP_Mi8_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_medevac_CHDKZ: CUP_Mi8_medevac_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_VIV_CHDKZ: CUP_Mi8_VIV_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi17_CDF: CUP_Mi8_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi17_medevac_CDF: CUP_Mi8_medevac_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi17_VIV_CDF: CUP_Mi8_VIV_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi17_UN: CUP_Mi8_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi17_VIV_UN: CUP_Mi8_VIV_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi17_TK: CUP_Mi8_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi17_VIV_TK: CUP_Mi8_VIV_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_medevac_RU: CUP_Mi8_medevac_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_VIV_RU: CUP_Mi8_VIV_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_RU: CUP_Mi8_MTV3_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_Mi17_Civilian_RU: CUP_Mi8_medevac_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_Mi17_VIV_RU: CUP_Mi8_VIV_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi171Sh_ACR: CUP_Mi171Sh_Base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi171Sh_Unarmed_ACR: CUP_Mi171Sh_Unarmed_Base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_SLA_1: CUP_Mi8_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_SLA_2: CUP_Mi8_MTV3_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_VIV_SLA: CUP_Mi8_VIV_base { // Sources: ["CUP_AirVehicles_Mi8"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MV22_USMC: Plane_Base_F { // Sources: ["CUP_AirVehicles_MV22"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MV22_VIV_USMC: CUP_B_MV22_USMC { // Sources: ["CUP_AirVehicles_MV22"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MV22_USMC_RAMPGUN: CUP_B_MV22_USMC { // Sources: ["CUP_AirVehicles_MV22"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_SA330_Puma_HC1_BAF: CUP_SA330_Base { // Sources: ["CUP_AirVehciles_SA330"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_SA330_Puma_HC2_BAF: CUP_B_SA330_Puma_HC1_BAF { // Sources: ["CUP_AirVehciles_SA330"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_SA330_Puma_HC1_RACS: CUP_B_SA330_Puma_HC1_BAF { // Sources: ["CUP_AirVehciles_SA330"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_SA330_Puma_HC2_RACS: CUP_B_SA330_Puma_HC2_BAF { // Sources: ["CUP_AirVehciles_SA330"]
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
};
