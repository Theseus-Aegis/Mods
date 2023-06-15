#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tac_heavylifter",
            // Heavy Lifter - Generated using heavylifter_exportConfig function
            "Air_F_lxWS",
            "Air_1_F_lxWS",
            "vehicles_1_F_lxWS_APC_Wheeled_02",
            "A3_Aegis_Soft_F_Aegis_Truck_01",
            "A3_Aegis_Soft_F_Aegis_Truck_02",
            "A3_Aegis_Air_F_Aegis_Plane_Fighter_05",
            "A3_Aegis_Air_F_Aegis_Heli_Attack_03",
            "A3_Aegis_Air_F_Aegis_Heli_Light_02",
            "A3_Aegis_Air_F_Aegis_Heli_Light_03",
            "A3_Aegis_Air_F_Aegis_Heli_Transport_01",
            "A3_Aegis_Air_F_Aegis_Heli_Transport_02",
            "A3_Aegis_Air_F_Aegis_UAV_01",
            "A3_Aegis_Air_F_Aegis_UAV_03",
            "A3_Aegis_Air_F_Aegis_UAV_06",
            "A3_Aegis_Armor_F_Aegis_APC_Wheeled_02",
            "A3_Aegis_Boat_F_Aegis_Boat_Civil_02",
            "A3_Athena_Soft_F_Athena_Truck_01",
            "A3_Atlas_Soft_F_Atlas_Truck_01",
            "A3_Athena_Air_F_Athena_Heli_Attack_03",
            "A3_Athena_Air_F_Athena_Heli_Transport_01",
            "A3_Athena_Air_F_Athena_Plane_Fighter_05",
            "A3_Athena_Armor_F_Athena_APC_Wheeled_02",
            "A3_Atlas_Air_F_Atlas_Heli_Attack_01",
            "A3_Atlas_Air_F_Atlas_Heli_Attack_03",
            "A3_Atlas_Air_F_Atlas_Heli_Light_01",
            "A3_Atlas_Air_F_Atlas_Heli_Light_03",
            "A3_Atlas_Air_F_Atlas_Heli_Transport_01",
            "A3_Atlas_Air_F_Atlas_Heli_Transport_02",
            "A3_Atlas_Air_F_Atlas_Plane_Fighter_05",
            "A3_Atlas_Air_F_Atlas_UAV_01",
            "A3_Atlas_Air_F_Atlas_UAV_03",
            "A3_Atlas_Air_F_Atlas_UAV_06",
            "A3_Atlas_Armor_F_Atlas_APC_Wheeled_02",
            "A3_revolucion_Air_F_revolucion_Heli_Light_02",
            "A3_Revolucion_Air_F_Revolucion_UAV_01"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
