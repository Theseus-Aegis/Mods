#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tac_heavylifter",
            // Heavy Lifter - Generated using heavylifter_exportConfig function
            "CUP_WaterVehicles_LCVP",
            "CUP_WheeledVehicles_Lada",
            "CUP_WheeledVehicles_S1203",
            "CUP_WheeledVehicles_Volha",
            "CUP_AirVehicles_MQ9",
            "CUP_AirVehicles_Pchela1T",
            "CUP_TrackedVehicles_MTLB",
            "CUP_WheeledVehicles_Coyote",
            "CUP_WheeledVehicles_Jackal",
            "CUP_WheeledVehicles_Mastiff",
            "CUP_wheeledvehicles_Octaiva",
            "CUP_WheeledVehicles_Ridgeback",
            "CUP_WheeledVehicles_Skoda",
            "CUP_Wheeledvehicles_VWGolf",
            "CUP_WheeledVehicles_Wolfhound",
            "CUP_AirVehicles_HC3",
            "CUP_WheeledVehicles_BTR80",
            "CUP_AirVehciles_AW159",
            "CUP_TrackedVehicles_BMP3",
            "CUP_WheeledVehicles_Kamaz",
            "CUP_WheeledVehicles_LR",
            "CUP_WheeledVehicles_M1030",
            "CUP_WheeledVehicles_Stryker",
            "CUP_AirVehicles_A10",
            "CUP_AirVehicles_AH1Z",
            "CUP_AirVehicles_AH64",
            "CUP_AirVehicles_AH6",
            "CUP_AirVehicles_AV8B",
            "CUP_AirVehicles_C130J",
            "CUP_AirVehicles_CH53E",
            "CUP_AirVehicles_DC3",
            "CUP_AirVehicles_F35",
            "CUP_AirVehicles_Ka50",
            "CUP_AirVehicles_Ka52",
            "CUP_AirVehicles_MH60S",
            "CUP_AirVehicles_MV22",
            "CUP_AirVehciles_SA330",
            "CUP_AirVehicles_Su25",
            "CUP_AirVehicles_SU34",
            "CUP_AirVehicles_UH1H",
            "CUP_AirVehciles_UH1Y",
            "CUP_AirVehicles_UH60",
            "CUP_TrackedVehicles_BMP",
            "CUP_TrackedVehicles_Bulldog",
            "CUP_WaterVehicles_Fishing_Boat",
            "CUP_WheeledVehicles_Ikarus",
            "CUP_WheeledVehicles_TT650",
            "CUP_AirVehicles_AN2",
            "CUP_AirVehciles_KA60",
            "CUP_AirVehicles_L39",
            "CUP_AirVehicles_Mi24",
            "CUP_AirVehicles_Mi35",
            "CUP_AirVehicles_Mi8",
            "CUP_AirVehicles_AmbientPlanes"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
