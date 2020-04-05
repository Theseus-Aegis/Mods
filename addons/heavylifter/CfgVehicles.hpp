#define MACRO_ATTACH \
    class GVAR(Attach) { \
        displayName = CSTRING(Attach); \
        condition = QUOTE(alive _target && {_this call FUNC(canAttach)}); \
        statement = QUOTE(_this call FUNC(progress)); \
        showDisabled = 0; \
        priority = -5.0; \
        icon = QPATHTOF(UI\attach_ca.paa); \
    };

#define MACRO_DETACH \
    class GVAR(Detach) { \
        displayName = CSTRING(Detach); \
        condition = QUOTE(alive _target && {_this call FUNC(canDetach)}); \
        statement = QUOTE(_this call FUNC(progress)); \
        showDisabled = 0; \
        priority = -5.0; \
        icon = QPATHTOF(UI\detach_ca.paa); \
    };

#define MACRO_ATTACH_WRECK \
    class GVAR(AttachWreck) { \
        displayName = CSTRING(Attach); \
        condition = QUOTE(!alive _target && {_this call FUNC(canAttach)}); \
        statement = QUOTE(_this call FUNC(progress)); \
        showDisabled = 0; \
        priority = -5.0; \
        icon = QPATHTOF(UI\attach_ca.paa); \
    };

#define MACRO_DETACH_WRECK \
    class GVAR(DetachWreck) { \
        displayName = CSTRING(Detach); \
        condition = QUOTE(!alive _target && {_this call FUNC(canDetach)}); \
        statement = QUOTE(_this call FUNC(progress)); \
        showDisabled = 0; \
        priority = -5.0; \
        icon = QPATHTOF(UI\detach_ca.paa); \
    };

class CfgVehicles {
// Custom Helper object
    class Land_Pod_Heli_Transport_04_fuel_F;
    class GVAR(Helper): Land_Pod_Heli_Transport_04_fuel_F {
        scope = 1;
        displayName = CSTRING(Helper);
        transportFuel = 0;
        hiddenSelectionsTextures[] = {""};
        class ACE_Actions {};
    };

// ACE Interaction
    class Air;
    class Helicopter: Air {
        class ACE_Actions {
            class ACE_MainActions {
                MACRO_ATTACH
                MACRO_DETACH
                MACRO_ATTACH_WRECK
                MACRO_DETACH_WRECK
            };
        };
    };
    class Plane: Air {
        class ACE_Actions {
            class ACE_MainActions {
                MACRO_ATTACH
                MACRO_DETACH
                MACRO_ATTACH_WRECK
                MACRO_DETACH_WRECK
            };
        };
    };

    class LandVehicle;
    class Car: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                MACRO_ATTACH
                MACRO_DETACH
                MACRO_ATTACH_WRECK
                MACRO_DETACH_WRECK
            };
        };
    };
    class Tank: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                MACRO_ATTACH
                MACRO_DETACH
                MACRO_ATTACH_WRECK
                MACRO_DETACH_WRECK
            };
        };
    };
    class Motorcycle: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                MACRO_ATTACH
                MACRO_DETACH
                MACRO_ATTACH_WRECK
                MACRO_DETACH_WRECK
            };
        };
    };
    class Ship;
    class Ship_F: Ship {
        class ACE_Actions {
            class ACE_MainActions {
                MACRO_ATTACH
                MACRO_DETACH
                MACRO_ATTACH_WRECK
                MACRO_DETACH_WRECK
            };
        };
    };

// Vehicle Configuration - Generated using exportConfig function
    class Heli_Light_01_unarmed_base_F;
    class Heli_Light_01_dynamicLoadout_base_F;
    class Heli_Light_01_civil_base_F;
    class Heli_Light_02_dynamicLoadout_base_F;
    class Heli_Light_02_unarmed_base_F;
    class Heli_Attack_01_dynamicLoadout_base_F;
    class Heli_Transport_01_base_F;
    class Heli_Transport_02_base_F;
    class Boat_Civil_01_base_F;
    class B_Truck_01_transport_F;
    class Truck_02_fuel_base_F;
    class Truck_02_MRL_base_F;
    class Heli_light_03_dynamicLoadout_base_F;
    class Heli_light_03_unarmed_base_F;
    class Plane_CAS_01_dynamicLoadout_base_F;
    class APC_Wheeled_02_base_v2_F;
    class UAV_01_base_F;
    class Truck_03_base_F;
    class Heli_Transport_03_base_F;
    class Heli_Transport_03_unarmed_base_F;
    class Plane_Civil_01_base_F;
    class UAV_03_dynamicLoadout_base_F;
    class Plane_Fighter_02_Base_F;
    class Truck_02_water_base_F;
    class UAV_06_base_F;
    class UAV_06_antimine_base_F;
    class UAV_06_medical_base_F;
    class Tractor_01_base_F;
    class Truck_01_flatbed_base_F;
    class Truck_01_cargo_base_F;

    class B_Heli_Light_01_F: Heli_Light_01_unarmed_base_F {
        GVAR(attachPos)[] = {0, -0.41, 0.46};
    };
    class B_Heli_Light_01_dynamicLoadout_F: Heli_Light_01_dynamicLoadout_base_F {
        GVAR(attachPos)[] = {0, -0.41, 0.46};
    };
    class C_Heli_Light_01_civil_F: Heli_Light_01_civil_base_F {
        GVAR(attachPos)[] = {0, -1.28, -0.72};
    };
    class O_Heli_Light_02_dynamicLoadout_F: Heli_Light_02_dynamicLoadout_base_F {
        GVAR(attachPos)[] = {0, -1.05, 0.85};
    };
    class O_Heli_Light_02_unarmed_F: Heli_Light_02_unarmed_base_F {
        GVAR(attachPos)[] = {0, -1.05, 0.85};
    };
    class B_Heli_Attack_01_dynamicLoadout_F: Heli_Attack_01_dynamicLoadout_base_F {
        GVAR(attachPos)[] = {0, -1.25, 0.6};
    };
    class B_Heli_Transport_01_F: Heli_Transport_01_base_F {
        GVAR(attachPos)[] = {0, -1.76, 0.82};
    };
    class I_Heli_Transport_02_F: Heli_Transport_02_base_F {
        GVAR(attachPos)[] = {0, -1.88, 2.29};
    };
    class C_Boat_Civil_01_F: Boat_Civil_01_base_F {
        GVAR(attachPos)[] = {0, 0.62, 0.24};
    };
    class C_Boat_Civil_01_rescue_F: Boat_Civil_01_base_F {
        GVAR(attachPos)[] = {0, 0.62, 0.24};
    };
    class C_Boat_Civil_01_police_F: Boat_Civil_01_base_F {
        GVAR(attachPos)[] = {0, 0.62, 0.24};
    };
    class B_Truck_01_mover_F: B_Truck_01_transport_F {
        GVAR(attachPos)[] = {0, 0.62, 0.59};
    };
    class B_Truck_01_box_F: B_Truck_01_mover_F {
        GVAR(attachPos)[] = {0, -0.1, 0.99};
    };
    class B_Truck_01_Repair_F: B_Truck_01_mover_F {
        GVAR(attachPos)[] = {0, -0.1, 0.99};
    };
    class B_Truck_01_ammo_F: B_Truck_01_mover_F {
        GVAR(attachPos)[] = {0, 0.23, 0.61};
    };
    class B_Truck_01_fuel_F: B_Truck_01_mover_F {
        GVAR(attachPos)[] = {0, 0.67, 0.6};
    };
    class B_Truck_01_medical_F: B_Truck_01_transport_F {
        GVAR(attachPos)[] = {0, -0.15, 0.89};
    };
    class O_Truck_02_fuel_F: Truck_02_fuel_base_F {
        GVAR(attachPos)[] = {0, 0.16, 1.06};
    };
    class I_Truck_02_fuel_F: Truck_02_fuel_base_F {
        GVAR(attachPos)[] = {0, 0.16, 1.06};
    };
    class I_Truck_02_MRL_F: Truck_02_MRL_base_F {
        GVAR(attachPos)[] = {0, -0.03, 1.33};
    };
    class C_Truck_02_fuel_F: Truck_02_fuel_base_F {
        GVAR(attachPos)[] = {0, 0.16, 1.06};
    };
    class I_Heli_light_03_dynamicLoadout_F: Heli_light_03_dynamicLoadout_base_F {
        GVAR(attachPos)[] = {0, -1.17, 0.21};
    };
    class I_Heli_light_03_unarmed_F: Heli_light_03_unarmed_base_F {
        GVAR(attachPos)[] = {0, -1.18, 0.54};
    };
    class B_Plane_CAS_01_dynamicLoadout_F: Plane_CAS_01_dynamicLoadout_base_F {
        GVAR(attachPos)[] = {0, -0.42, 1.06};
    };
    class O_APC_Wheeled_02_rcws_v2_F: APC_Wheeled_02_base_v2_F {
        GVAR(attachPos)[] = {0, 1.36, 1.09};
    };
    class B_UAV_01_F: UAV_01_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.17};
    };
    class O_UAV_01_F: UAV_01_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.17};
    };
    class I_UAV_01_F: UAV_01_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.17};
    };
    class O_Truck_03_transport_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 0.59, 1.1};
    };
    class O_Truck_03_covered_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 0.57, 1.1};
    };
    class O_Truck_03_repair_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 0.98, 0.83};
    };
    class O_Truck_03_ammo_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 0.86, 0.83};
    };
    class O_Truck_03_fuel_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 1.07, 0.83};
    };
    class O_Truck_03_medical_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 0.57, 1.1};
    };
    class O_Truck_03_device_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 1, 0.83};
    };
    class B_Heli_Transport_03_F: Heli_Transport_03_base_F {
        GVAR(attachPos)[] = {0, 0.06, 2.02};
    };
    class B_Heli_Transport_03_unarmed_F: Heli_Transport_03_unarmed_base_F {
        GVAR(attachPos)[] = {0, 0.06, 2.02};
    };
    class O_T_Truck_02_fuel_F: Truck_02_fuel_base_F {
        GVAR(attachPos)[] = {0, 0.16, 1.06};
    };
    class I_C_Heli_Light_01_civil_F: Heli_Light_01_civil_base_F {
        GVAR(attachPos)[] = {0, -0.41, 0.46};
    };
    class B_CTRG_Heli_Transport_01_sand_F: Heli_Transport_01_base_F {
        GVAR(attachPos)[] = {0, -1.76, 0.82};
    };
    class B_CTRG_Heli_Transport_01_tropic_F: Heli_Transport_01_base_F {
        GVAR(attachPos)[] = {0, -1.76, 0.82};
    };
    class C_Plane_Civil_01_F: Plane_Civil_01_base_F {
        GVAR(attachPos)[] = {0, -1.79, 0.29};
    };
    class C_Plane_Civil_01_racing_F: Plane_Civil_01_base_F {
        GVAR(attachPos)[] = {0, -1.79, 0.29};
    };
    class I_C_Plane_Civil_01_F: Plane_Civil_01_base_F {
        GVAR(attachPos)[] = {0, -1.79, 0.29};
    };
    class B_T_UAV_03_dynamicLoadout_F: UAV_03_dynamicLoadout_base_F {
        GVAR(attachPos)[] = {0, 0.1, 0.22};
    };
    class O_T_APC_Wheeled_02_rcws_v2_ghex_F: APC_Wheeled_02_base_v2_F {
        GVAR(attachPos)[] = {0, 1.36, 1.09};
    };
    class O_Plane_Fighter_02_F: Plane_Fighter_02_Base_F {
        GVAR(attachPos)[] = {0, 1.64, 1.15};
    };
    class O_Plane_Fighter_02_Stealth_F: Plane_Fighter_02_Base_F {
        GVAR(attachPos)[] = {0, 1.64, 1.15};
    };
    class C_IDAP_Truck_02_water_F: Truck_02_water_base_F {
        GVAR(attachPos)[] = {0, 0.16, 1.06};
    };
    class C_IDAP_Heli_Transport_02_F: Heli_Transport_02_base_F {
        GVAR(attachPos)[] = {0, -1.88, 2.29};
    };
    class C_IDAP_UAV_01_F: UAV_01_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.17};
    };
    class B_UAV_06_F: UAV_06_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class O_UAV_06_F: UAV_06_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class I_UAV_06_F: UAV_06_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class C_IDAP_UAV_06_F: UAV_06_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class C_UAV_06_F: UAV_06_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class C_IDAP_UAV_06_antimine_F: UAV_06_antimine_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class B_UAV_06_medical_F: UAV_06_medical_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class O_UAV_06_medical_F: UAV_06_medical_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class I_UAV_06_medical_F: UAV_06_medical_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class C_IDAP_UAV_06_medical_F: UAV_06_medical_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class C_UAV_06_medical_F: UAV_06_medical_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class C_Tractor_01_F: Tractor_01_base_F {
        GVAR(attachPos)[] = {0, -0.16, 0.43};
    };
    class B_Truck_01_flatbed_F: Truck_01_flatbed_base_F {
        GVAR(attachPos)[] = {0, -0.81, 1.38};
    };
    class B_T_Truck_01_flatbed_F: Truck_01_flatbed_base_F {
        GVAR(attachPos)[] = {0, -0.81, 1.38};
    };
    class B_Truck_01_cargo_F: Truck_01_cargo_base_F {
        GVAR(attachPos)[] = {0, -0.8, 0.99};
    };
    class B_T_Truck_01_cargo_F: Truck_01_cargo_base_F {
        GVAR(attachPos)[] = {0, -0.8, 0.99};
    };
    class I_E_Truck_02_fuel_F: Truck_02_fuel_base_F {
        GVAR(attachPos)[] = {0, 0.16, 1.06};
    };
    class I_E_Truck_02_MRL_F: Truck_02_MRL_base_F {
        GVAR(attachPos)[] = {0, -0.03, 1.33};
    };
    class I_E_Heli_light_03_dynamicLoadout_F: Heli_light_03_dynamicLoadout_base_F {
        GVAR(attachPos)[] = {0, -1.17, 0.21};
    };
    class I_E_Heli_light_03_unarmed_F: Heli_light_03_unarmed_base_F {
        GVAR(attachPos)[] = {0, -1.18, 0.54};
    };
    class I_E_UAV_01_F: UAV_01_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.17};
    };
    class I_E_UAV_06_F: UAV_06_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
    class I_E_UAV_06_medical_F: UAV_06_medical_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.07};
    };
};

