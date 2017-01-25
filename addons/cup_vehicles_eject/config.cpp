#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tac_main",
            "A3_Air_F_EPB_Heli_Light_03",
            "A3_Air_F_Heli_Heli_Transport_03",
            "A3_Air_F_Exp_UAV_03",
            "CUP_AirVehicles_AH1Z",
            "CUP_AirVehicles_AH6",
            "CUP_AirVehicles_CH53E",
            "CUP_AirVehicles_DC3",
            "CUP_AirVehicles_F35",
            "CUP_AirVehicles_Ka50",
            "CUP_AirVehicles_Ka52",
            "CUP_AirVehicles_MH60S",
            "CUP_AirVehicles_UH1H",
            "CUP_AirVehciles_UH1Y",
            "CUP_AirVehicles_UH60",
            "CUP_AirVehicles_AH64",
            "CUP_AirVehicles_AN2",
            "CUP_AirVehicles_AV8B",
            "CUP_AirVehciles_AW159",
            "CUP_AirVehicles_C130J",
            "CUP_AirVehicles_CH47",
            "CUP_AirVehicles_HC3",
            "CUP_AirVehciles_KA60",
            "CUP_AirVehicles_Mi24",
            "CUP_AirVehicles_Mi35",
            "CUP_AirVehicles_MI6",
            "CUP_AirVehicles_Mi8",
            "CUP_AirVehicles_MV22",
            "CUP_AirVehciles_SA330"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
