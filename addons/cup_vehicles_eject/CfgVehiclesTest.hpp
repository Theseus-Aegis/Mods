class CfgVehicles {
    class Helicopter;
    class Air;

    class Helicopter_Base_F: Helicopter {
        class Turrets;
    };
    class Helicopter_Base_H: Helicopter_Base_F {
        class Turrets;
    };
    class Plane: Air {
        class Turrets;
    };
    class CUP_AH64_base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_Mi24_Base: Helicopter_Base_H {
        class Turrets;
    };
    class CUP_MI35_TOH_Base: CUP_Mi24_Base {
        class Turrets;
    };

    class Heli_light_03_base_F: Helicopter_Base_F {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class Heli_light_03_unarmed_base_F: Heli_light_03_base_F {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class Heli_Transport_03_base_F: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class Heli_Transport_03_unarmed_base_F: Heli_Transport_03_base_F {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class UAV_03_base_F: Helicopter_Base_F {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_AH1Z_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_AH6_BASE: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_CH53E_Base;
    class CUP_CH53E_VIV_Base;
    class Plane_Base_F: Plane {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_DC3_Base: Plane_Base_F {
        class Turrets: Turrets {
            class NewTurret;
        };
    };
    class CUP_C47_Base: CUP_DC3_Base {
        class Turrets: Turrets {
            class NewTurret;
        };
    };
    class CUP_AC47_Spooky_Base: CUP_DC3_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_F35B_base;
    class CUP_KA50_Base;
    class CUP_KA50_AA_Base;
    class CUP_Ka52_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_MH60S_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_MH60S_FFV_Base: CUP_MH60S_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_UH1H_base: Helicopter_Base_H {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_UH1H_slick_base: CUP_UH1H_base {
        class Turrets: Turrets {
            class MainTurret;
            class LeftDoorGun;
            class CopilotTurret;
        };
    };
    class CUP_B_UH1Y_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Uh60_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Uh60L_Base: CUP_Uh60_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Uh60_FFV_Base: CUP_Uh60_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Uh60L_FFV_Base: CUP_Uh60_FFV_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_UH60_Unarmed_Base: CUP_Uh60_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Uh60L_Unarmed_Base: CUP_UH60_Unarmed_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Uh60_Unarmed_FFV_Base: CUP_UH60_Unarmed_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Uh60L_Unarmed_FFV_Base: CUP_Uh60_Unarmed_FFV_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_AH64D_Base: CUP_AH64_base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_AN2_Base: Plane_Base_F {
        class Turrets: Turrets {
            class NewTurret;
        };
    };
    class CUP_AV8B_Base;
    class CUP_AW159_Unarmed_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_C130J_Base: Plane_Base_F {
        class Turrets: Turrets {
            class NewTurret;
        };
    };
    class CUP_C130J_VIV_Base: CUP_C130J_Base {
        class Turrets: Turrets {
            class NewTurret;
        };
    };
    class CUP_CH47F_base: Helicopter_Base_H {
        class Turrets: Turrets {
            class MainTurret;
            class CopilotTurret;
        };
    };
    class CUP_CH47F_VIV_Base: CUP_CH47F_base {
        class Turrets: Turrets {
            class MainTurret;
            class RightDoorGun;
            class CopilotTurret;
        };
    };
    class CUP_Merlin_HC3_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Merlin_HC3_VIV_Base: CUP_Merlin_HC3_Base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Merlin_HC3A_Base: CUP_Merlin_HC3_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Merlin_HC3_Armed_Base: CUP_Merlin_HC3_Base {
        class Turrets: Turrets {
            class CopilotTurret;
            class MainTurret;
        };
    };
    class CUP_Merlin_HC3A_Armed_Base: CUP_Merlin_HC3_Armed_Base {
        class Turrets: Turrets {
            class CopilotTurret;
            class MainTurret;
        };
    };
    class CUP_Merlin_HM2_Base: CUP_Merlin_HC3_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Ka60_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Ka60_GL_BASE: CUP_Ka60_Base {
        class Turrets: Turrets {
            class MainTurret;
            class CopilotTurret;
        };
    };
    class CUP_Mi24_P_Base: CUP_Mi24_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Mi24_V_Base: CUP_Mi24_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Mi24_D_Base: CUP_Mi24_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Mi24_D_MEV_Base: CUP_Mi24_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Mi35_Base: CUP_Mi24_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Mi35_S8_Base: CUP_MI35_TOH_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Mi35_AT_Base: CUP_MI35_TOH_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Mi35_FAB_Base: CUP_MI35_TOH_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Mi35_Empty_Base: CUP_MI35_TOH_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_Mi35_S8_GSh_Base: CUP_MI35_TOH_Base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_MI6A_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
            class MainTurret;
        };
    };
    class CUP_MI6T_Base: CUP_MI6A_Base {
        class Turrets: Turrets {
            class CopilotTurret;
            class MainTurret;
        };
    };
    class CUP_Mi8_base: Helicopter_Base_H {
        class Turrets: Turrets {
            class MainTurret;
            class CopilotTurret;
        };
    };
    class CUP_Mi8_medevac_base: CUP_Mi8_base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi8_VIV_base: CUP_Mi8_medevac_base {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };
    class CUP_Mi8_MTV3_base: CUP_Mi8_base {
        class Turrets: Turrets {
            class MainTurret;
            class BackTurret;
            class CopilotTurret;
        };
    };
    class CUP_Mi171Sh_Base: CUP_Mi8_base {
        class Turrets: Turrets {
            class MainTurret;
            class BackTurret;
            class CopilotTurret;
        };
    };
    class CUP_Mi171Sh_Unarmed_Base: CUP_Mi171Sh_Base {
        class Turrets: Turrets {
            class MainTurret;
            class BackTurret;
            class CopilotTurret;
        };
    };
    class CUP_SA330_Base: Helicopter_Base_H {
        class Turrets: Turrets {
            class MainTurret;
        };
    };

    class I_Heli_light_03_F: Heli_light_03_base_F {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class I_Heli_light_03_unarmed_F: Heli_light_03_unarmed_base_F {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class B_Heli_Transport_03_F: Heli_Transport_03_base_F {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class B_Heli_Transport_03_unarmed_F: Heli_Transport_03_unarmed_base_F {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class B_T_UAV_03_F: UAV_03_base_F {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_USMC: CUP_AH1Z_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z: CUP_B_AH1Z_USMC {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_B_AH1Z_NoWeapons_USMC: CUP_AH1Z_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_AT_USMC: CUP_AH1Z_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_AT: CUP_B_AH1Z_AT_USMC {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_B_AH1Z_Escort_USMC: CUP_AH1Z_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_Escort: CUP_B_AH1Z_Escort_USMC {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_B_AH1Z_7RndHydra_USMC: CUP_AH1Z_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_14RndHydra_USMC: CUP_AH1Z_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1Z_NOAA_USMC: CUP_AH1Z_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH1Z_AAF: CUP_B_AH1Z {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH1Z_AT_AAF: CUP_B_AH1Z_AT {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH1Z_Escort_AAF: CUP_B_AH1Z_Escort {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH6J_Escort_USA: CUP_AH6_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH6J_AT_USA: CUP_B_AH6J_Escort_USA {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH6J_MP_USA: CUP_B_AH6J_Escort_USA {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH6J_Escort19_USA: CUP_AH6_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MH6J_USA: CUP_AH6_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH6X_USA: CUP_AH6_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class UAVTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH6J_Escort_RACS: CUP_AH6_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH6J_AT_RACS: CUP_I_AH6J_Escort_RACS {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH6J_MP_RACS: CUP_I_AH6J_Escort_RACS {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_AH6J_Escort19_RACS: CUP_I_AH6J_Escort_RACS {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_MH6J_RACS: CUP_AH6_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH53E_USMC: CUP_CH53E_Base {
        driverCanEject = 1;
    };
    class CUP_B_CH53E_VIV_USMC: CUP_CH53E_VIV_Base {
        driverCanEject = 1;
    };
    class CUP_B_CH53E_GER: CUP_CH53E_Base {
        driverCanEject = 1;
    };
    class CUP_B_CH53E_VIV_GER: CUP_CH53E_VIV_Base {
        driverCanEject = 1;
    };
    class CUP_C_DC3_CIV: CUP_DC3_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_DC3_TanoAir_CIV: CUP_DC3_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_C47_CIV: CUP_C47_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_C47_SLA: CUP_C47_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_C47_USA: CUP_C47_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AC47_Spooky_USA: CUP_AC47_Spooky_Base {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class Minigun_3_Turret: MainTurret {
                canEject = 1;
            };
            class Observer: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_F35B_AA_USMC: CUP_F35B_base {
        driverCanEject = 1;
    };
    class CUP_B_F35B_CAS_USMC: CUP_F35B_base {
        driverCanEject = 1;
    };
    class CUP_B_F35B_LGB_USMC: CUP_F35B_base {
        driverCanEject = 1;
    };
    class CUP_B_F35B_AA_BAF: CUP_B_F35B_AA_USMC {
        driverCanEject = 1;
    };
    class CUP_B_F35B_CAS_BAF: CUP_B_F35B_CAS_USMC {
        driverCanEject = 1;
    };
    class CUP_B_F35B_LGB_BAF: CUP_B_F35B_LGB_USMC {
        driverCanEject = 1;
    };
    class CUP_O_Ka50_SLA: CUP_KA50_Base {
        driverCanEject = 1;
    };
    class CUP_O_Ka50_AA_SLA: CUP_KA50_AA_Base {
        driverCanEject = 1;
    };
    class CUP_O_Ka50_RU: CUP_KA50_Base {
        driverCanEject = 1;
    };
    class CUP_O_Ka50_AA_RU: CUP_KA50_AA_Base {
        driverCanEject = 1;
    };
    class CUP_O_Ka52_RU: CUP_Ka52_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka52_Blk_RU: CUP_Ka52_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka52_GreyCamo_RU: CUP_Ka52_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka52_Grey_RU: CUP_Ka52_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MH60S_USMC: CUP_MH60S_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MH60S_FFV_USMC: CUP_MH60S_FFV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_UH1H_TKA: CUP_UH1H_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class LeftDoorGun: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_UH1H_slick_TKA: CUP_UH1H_slick_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class LeftDoorGun: LeftDoorGun {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_UH1H_SLA: CUP_UH1H_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class LeftDoorGun: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_UH1H_slick_SLA: CUP_UH1H_slick_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class LeftDoorGun: LeftDoorGun {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH1H_TK_GUE: CUP_UH1H_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class LeftDoorGun: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH1H_slick_TK_GUE: CUP_UH1H_slick_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class LeftDoorGun: LeftDoorGun {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1D_GER_KSK: CUP_UH1H_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class LeftDoorGun: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1D_slick_GER_KSK: CUP_UH1H_slick_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class LeftDoorGun: LeftDoorGun {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1D_GER_KSK_Des: CUP_UH1H_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class LeftDoorGun: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1D_slick_GER_KSK_Des: CUP_UH1H_slick_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class LeftDoorGun: LeftDoorGun {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1Y_UNA_USMC: CUP_B_UH1Y_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CoPilotObs: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1Y_UNA_F: CUP_B_UH1Y_UNA_USMC {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class CUP_B_UH1Y_MEV_USMC: CUP_B_UH1Y_UNA_F {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CoPilotObs: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH1Y_GUNSHIP_USMC: CUP_B_UH1Y_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class RightDoorGun: MainTurret {
                canEject = 1;
            };
            class CoPilotObs: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60M_US: CUP_Uh60_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60L_US: CUP_Uh60L_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60M_FFV_US: CUP_Uh60_FFV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60L_FFV_US: CUP_Uh60L_FFV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60M_Unarmed_US: CUP_UH60_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60L_Unarmed_US: CUP_Uh60L_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60M_Unarmed_FFV_US: CUP_Uh60_Unarmed_FFV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60L_Unarmed_FFV_US: CUP_Uh60L_Unarmed_FFV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60M_Unarmed_FFV_MEV_US: CUP_Uh60_Unarmed_FFV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_UH60L_Unarmed_FFV_MEV_US: CUP_Uh60L_Unarmed_FFV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH60L_RACS: CUP_Uh60L_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH60L_FFV_RACS: CUP_Uh60L_FFV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH60L_Unarmed_RACS: CUP_Uh60L_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH60L_Unarmed_FFV_Racs: CUP_Uh60L_Unarmed_FFV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_UH60L_Unarmed_FFV_MEV_Racs: CUP_Uh60L_Unarmed_FFV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH64D_NO_USA: CUP_AH64D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH64D_AT_USA: CUP_AH64D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH64D_ES_USA: CUP_AH64D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH64D_USA: CUP_AH64D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH64D_MR_USA: CUP_AH64D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1_NO_BAF: CUP_B_AH64D_NO_USA {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1_AT_BAF: CUP_B_AH64D_AT_USA {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1_ES_BAF: CUP_B_AH64D_ES_USA {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1_BAF: CUP_B_AH64D_USA {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AH1_MR_BAF: CUP_B_AH64D_MR_USA {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_AN2_AEROSCHROT_TK_CIV: CUP_AN2_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_AN2_CIV: CUP_AN2_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_AN2_AIRTAK_TK_CIV: CUP_AN2_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_AN2_TK: CUP_AN2_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AV8B_CAP_USMC: CUP_AV8B_Base {
        driverCanEject = 1;
    };
    class CUP_I_AV8B_CAP_AAF: CUP_B_AV8B_CAP_USMC {
        driverCanEject = 1;
    };
    class CUP_B_AV8B_MK82_USMC: CUP_AV8B_Base {
        driverCanEject = 1;
    };
    class CUP_I_AV8B_MK82_AAF: CUP_B_AV8B_MK82_USMC {
        driverCanEject = 1;
    };
    class CUP_B_AV8B_GBU12_USMC: CUP_AV8B_Base {
        driverCanEject = 1;
    };
    class CUP_I_AV8B_GBU12_AAF: CUP_B_AV8B_GBU12_USMC {
        driverCanEject = 1;
    };
    class CUP_B_AV8B_AGM_USMC: CUP_AV8B_Base {
        driverCanEject = 1;
    };
    class CUP_I_AV8B_AGM_AAF: CUP_B_AV8B_AGM_USMC {
        driverCanEject = 1;
    };
    class CUP_B_GR9_CAP_GB: CUP_AV8B_Base {
        driverCanEject = 1;
    };
    class CUP_B_GR9_Mk82_GB: CUP_AV8B_Base {
        driverCanEject = 1;
    };
    class CUP_B_GR9_GBU12_GB: CUP_AV8B_Base {
        driverCanEject = 1;
    };
    class CUP_B_GR9_AGM_GB: CUP_AV8B_Base {
        driverCanEject = 1;
    };
    class CUP_B_AW159_Unarmed_GB: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Unarmed_RN_Grey: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Unarmed_RN_Blackcat: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Hellfire_GB: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Hellfire_RN_Grey: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Hellfire_RN_Blackcat: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Cannon_GB: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Cannon_RN_Grey: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_AW159_Cannon_RN_Blackcat: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Unarmed_Green_AAF: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Hellfire_Armed_Green_AAF: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Cannon_Armed_Green_AAF: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Unarmed_Digital_AAF: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Hellfire_Armed_Digital_AAF: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Wildcat_Cannon_Armed_Digital_AAF: CUP_AW159_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_C130J_USMC: CUP_C130J_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_C130J_Cargo_USMC: CUP_C130J_VIV_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_C130J_GB: CUP_C130J_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_C130J_Cargo_GB: CUP_C130J_VIV_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_C130J_AAF: CUP_C130J_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_C130J_Cargo_AAF: CUP_C130J_VIV_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_C130J_RACS: CUP_C130J_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_C130J_Cargo_RACS: CUP_C130J_VIV_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_C130J_TKA: CUP_C130J_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_C130J_Cargo_TKA: CUP_C130J_VIV_Base {
        class Turrets: Turrets {
            class MainTurret: NewTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH47F_USA: CUP_CH47F_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class RightDoorGun: MainTurret {
                canEject = 1;
            };
            class BackDoorGun: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH47F_VIV_USA: CUP_CH47F_VIV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class RightDoorGun: RightDoorGun {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH47F_GB: CUP_CH47F_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class RightDoorGun: MainTurret {
                canEject = 1;
            };
            class BackDoorGun: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_CH47F_VIV_GB: CUP_CH47F_VIV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class RightDoorGun: RightDoorGun {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC3_GB: CUP_Merlin_HC3_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC3_VIV_GB: CUP_Merlin_HC3_VIV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC3A_GB: CUP_Merlin_HC3A_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC3_Armed_GB: CUP_Merlin_HC3_Armed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC3A_Armed_GB: CUP_Merlin_HC3A_Armed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Merlin_HC4_GB: CUP_Merlin_HM2_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Ka60_GL_Blk_ION: CUP_Ka60_GL_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Ka60_Blk_ION: CUP_Ka60_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Ka60_GL_Digi_AAF: CUP_Ka60_GL_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Ka60_Digi_AAF: CUP_Ka60_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_GL_Hex_CSAT: CUP_Ka60_GL_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_Hex_CSAT: CUP_Ka60_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_GL_Blk_CSAT: CUP_Ka60_GL_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_Blk_CSAT: CUP_Ka60_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_GL_Whale_CSAT: CUP_Ka60_GL_BASE {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_Whale_CSAT: CUP_Ka60_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Ka60_Grey_RU: CUP_Ka60_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi24_P_RU: CUP_Mi24_P_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi24_V_RU: CUP_Mi24_V_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi24_D_CDF: CUP_Mi24_D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi24_D_MEV_CDF: CUP_Mi24_D_MEV_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi24_D_TK: CUP_Mi24_D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi24_D_SLA: CUP_Mi24_D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi35_CZ: CUP_Mi35_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi35_CZ_Des: CUP_B_Mi35_CZ {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi35_CZ_Ram: CUP_B_Mi35_CZ {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi35_CZ_Tiger: CUP_B_Mi35_CZ {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi35_CZ_Dark: CUP_B_Mi35_CZ {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_D_UN: CUP_Mi24_D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_D_AAF: CUP_Mi24_D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_D_ION: CUP_Mi24_D_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_AAF: CUP_Mi35_S8_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_AAF: CUP_I_Mi24_Mk3_AAF {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_AT_AAF: CUP_Mi35_AT_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_AT_AAF: CUP_I_Mi24_Mk3_AT_AAF {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_FAB_AAF: CUP_Mi35_FAB_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_FAB_AAF: CUP_I_Mi24_Mk3_FAB_AAF {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_Empty_AAF: CUP_Mi35_Empty_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_Empty_AAF: CUP_I_Mi24_Mk3_Empty_AAF {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_S8_GSh_AAF: CUP_Mi35_S8_GSh_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_S8_GSh_AAF: CUP_I_Mi24_Mk3_S8_GSh_AAF {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_ION: CUP_Mi35_S8_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_ION: CUP_I_Mi24_Mk3_ION {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_AT_ION: CUP_Mi35_AT_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_AT_ION: CUP_I_Mi24_Mk3_AT_ION {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_FAB_ION: CUP_Mi35_FAB_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_FAB_ION: CUP_I_Mi24_Mk3_FAB_ION {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_Empty_ION: CUP_Mi35_Empty_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_Empty_ION: CUP_I_Mi24_Mk3_Empty_ION {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_S8_GSh_ION: CUP_Mi35_S8_GSh_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_S8_GSh_ION: CUP_I_Mi24_Mk3_S8_GSh_ION {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_UN: CUP_Mi35_S8_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_UN: CUP_I_Mi24_Mk3_UN {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_AT_UN: CUP_Mi35_AT_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_AT_UN: CUP_I_Mi24_Mk3_AT_UN {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_FAB_UN: CUP_Mi35_FAB_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_FAB_UN: CUP_I_Mi24_Mk3_FAB_UN {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_Empty_UN: CUP_Mi35_Empty_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_Empty_UN: CUP_I_Mi24_Mk3_Empty_UN {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk3_S8_GSh_UN: CUP_Mi35_S8_GSh_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi24_Mk4_S8_GSh_UN: CUP_I_Mi24_Mk3_S8_GSh_UN {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MI6A_CDF: CUP_MI6A_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class Radiooperator: MainTurret {
                canEject = 1;
            };
            class Mechanic: MainTurret {
                canEject = 1;
            };
            class Navigator: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MI6T_CDF: CUP_MI6T_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class Radiooperator: MainTurret {
                canEject = 1;
            };
            class Mechanic: MainTurret {
                canEject = 1;
            };
            class Navigator: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6A_CHDKZ: CUP_MI6A_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class Radiooperator: MainTurret {
                canEject = 1;
            };
            class Mechanic: MainTurret {
                canEject = 1;
            };
            class Navigator: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6T_CHDKZ: CUP_MI6T_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class Radiooperator: MainTurret {
                canEject = 1;
            };
            class Mechanic: MainTurret {
                canEject = 1;
            };
            class Navigator: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6A_TKA: CUP_MI6A_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class Radiooperator: MainTurret {
                canEject = 1;
            };
            class Mechanic: MainTurret {
                canEject = 1;
            };
            class Navigator: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6T_TKA: CUP_MI6T_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class Radiooperator: MainTurret {
                canEject = 1;
            };
            class Mechanic: MainTurret {
                canEject = 1;
            };
            class Navigator: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6A_RU: CUP_MI6A_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class Radiooperator: MainTurret {
                canEject = 1;
            };
            class Mechanic: MainTurret {
                canEject = 1;
            };
            class Navigator: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_MI6T_RU: CUP_MI6T_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class Radiooperator: MainTurret {
                canEject = 1;
            };
            class Mechanic: MainTurret {
                canEject = 1;
            };
            class Navigator: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_MI6A_RU: CUP_MI6A_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class Radiooperator: MainTurret {
                canEject = 1;
            };
            class Mechanic: MainTurret {
                canEject = 1;
            };
            class Navigator: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_MI6T_RU: CUP_MI6T_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
            class Radiooperator: MainTurret {
                canEject = 1;
            };
            class Mechanic: MainTurret {
                canEject = 1;
            };
            class Navigator: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_CHDKZ: CUP_Mi8_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class BackTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_medevac_CHDKZ: CUP_Mi8_medevac_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_VIV_CHDKZ: CUP_Mi8_VIV_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi17_CDF: CUP_Mi8_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class BackTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi17_medevac_CDF: CUP_Mi8_medevac_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi17_VIV_CDF: CUP_Mi8_VIV_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi17_UN: CUP_Mi8_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class BackTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_Mi17_VIV_UN: CUP_Mi8_VIV_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi17_TK: CUP_Mi8_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class BackTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi17_VIV_TK: CUP_Mi8_VIV_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_medevac_RU: CUP_Mi8_medevac_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_VIV_RU: CUP_Mi8_VIV_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_RU: CUP_Mi8_MTV3_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class SideTurret: MainTurret {
                canEject = 1;
            };
            class BackTurret: BackTurret {
                canEject = 1;
            };
            class FrontTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_Mi17_Civilian_RU: CUP_Mi8_medevac_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_C_Mi17_VIV_RU: CUP_Mi8_VIV_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi171Sh_ACR: CUP_Mi171Sh_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class LeftTurret: MainTurret {
                canEject = 1;
            };
            class BackTurret: BackTurret {
                canEject = 1;
            };
            class RightTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_Mi171Sh_Unarmed_ACR: CUP_Mi171Sh_Unarmed_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class LeftTurret: MainTurret {
                canEject = 1;
            };
            class BackTurret: BackTurret {
                canEject = 1;
            };
            class RightTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_SLA_1: CUP_Mi8_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                canEject = 1;
            };
            class BackTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_SLA_2: CUP_Mi8_MTV3_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class SideTurret: MainTurret {
                canEject = 1;
            };
            class BackTurret: BackTurret {
                canEject = 1;
            };
            class FrontTurret: MainTurret {
                canEject = 1;
            };
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_O_Mi8_VIV_SLA: CUP_Mi8_VIV_base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MV22_USMC: Plane_Base_F {
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MV22_VIV_USMC: CUP_B_MV22_USMC {
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_MV22_USMC_RAMPGUN: CUP_B_MV22_USMC {
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_SA330_Puma_HC1_BAF: CUP_SA330_Base {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_B_SA330_Puma_HC2_BAF: CUP_B_SA330_Puma_HC1_BAF {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_SA330_Puma_HC1_RACS: CUP_B_SA330_Puma_HC1_BAF {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
    class CUP_I_SA330_Puma_HC2_RACS: CUP_B_SA330_Puma_HC2_BAF {
        driverCanEject = 1;
        class Turrets: Turrets {
            class CopilotTurret: MainTurret {
                canEject = 1;
            };
        };
    };
};
