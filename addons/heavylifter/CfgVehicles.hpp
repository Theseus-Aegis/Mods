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
    class Heli_Light_01_armed_base_F;
    class Heli_Light_01_civil_base_F;
    class Heli_Light_02_base_F;
    class Heli_Light_02_unarmed_base_F;
    class Heli_Attack_01_base_F;
    class Heli_Transport_01_base_F;
    class Heli_Transport_02_base_F;
    class Boat_Civil_01_base_F;
    class B_Truck_01_transport_F;
    class Truck_02_box_base_F;
    class Truck_02_medical_base_F;
    class Truck_02_Ammo_base_F;
    class Truck_02_fuel_base_F;
    class Heli_light_03_base_F;
    class Heli_light_03_unarmed_base_F;
    class Plane_CAS_01_base_F;
    class O_APC_Wheeled_02_base_F;
    class UAV_01_base_F;
    class Truck_03_base_F;
    class Heli_Transport_03_base_F;
    class Heli_Transport_03_unarmed_base_F;
    class Plane_Civil_01_base_F;
    class UAV_03_base_F;
    class Scooter_Transport_01_base_F;

    class B_Heli_Light_01_F: Heli_Light_01_unarmed_base_F {
        GVAR(attachPos)[] = {0, -0.41, 0.8};
    };
    class B_Heli_Light_01_armed_F: Heli_Light_01_armed_base_F {
        GVAR(attachPos)[] = {0, -0.41, 0.8};
    };
    class C_Heli_Light_01_civil_F: Heli_Light_01_civil_base_F {
        GVAR(attachPos)[] = {0, -1.28, -0.75};
    };
    class O_Heli_Light_02_F: Heli_Light_02_base_F {
        GVAR(attachPos)[] = {0, -1.05, 0.92};
    };
    class O_Heli_Light_02_unarmed_F: Heli_Light_02_unarmed_base_F {
        GVAR(attachPos)[] = {0, -1.05, 0.92};
    };
    class O_Heli_Light_02_v2_F: Heli_Light_02_base_F {
        GVAR(attachPos)[] = {0, -1.05, 0.92};
    };
    class B_Heli_Attack_01_F: Heli_Attack_01_base_F {
        GVAR(attachPos)[] = {0, -1.25, 0.48};
    };
    class B_Heli_Transport_01_F: Heli_Transport_01_base_F {
        GVAR(attachPos)[] = {0, -1.69, 1.01};
    };
    class I_Heli_Transport_02_F: Heli_Transport_02_base_F {
        GVAR(attachPos)[] = {0, -1.88, 2.1};
    };
    class C_Boat_Civil_01_F: Boat_Civil_01_base_F {
        GVAR(attachPos)[] = {0, 0.62, 0.08};
    };
    class C_Boat_Civil_01_rescue_F: Boat_Civil_01_base_F {
        GVAR(attachPos)[] = {0, 0.62, 0.08};
    };
    class C_Boat_Civil_01_police_F: Boat_Civil_01_base_F {
        GVAR(attachPos)[] = {0, 0.62, 0.08};
    };
    class B_Truck_01_mover_F: B_Truck_01_transport_F {
        GVAR(attachPos)[] = {0, 0.19, 0.33};
    };
    class B_Truck_01_box_F: B_Truck_01_mover_F {
        GVAR(attachPos)[] = {0, -0.1, 0.73};
    };
    class B_Truck_01_Repair_F: B_Truck_01_mover_F {
        GVAR(attachPos)[] = {0, -0.1, 0.73};
    };
    class B_Truck_01_ammo_F: B_Truck_01_mover_F {
        GVAR(attachPos)[] = {0, 0.15, 0.34};
    };
    class B_Truck_01_fuel_F: B_Truck_01_mover_F {
        GVAR(attachPos)[] = {0, 0.56, 0.33};
    };
    class B_Truck_01_medical_F: B_Truck_01_transport_F {
        GVAR(attachPos)[] = {0, -0.22, 0.63};
    };
    class O_Truck_02_box_F: Truck_02_box_base_F {
        GVAR(attachPos)[] = {0, -0.17, 0.69};
    };
    class O_Truck_02_medical_F: Truck_02_medical_base_F {
        GVAR(attachPos)[] = {0, -0.28, 0.69};
    };
    class O_Truck_02_Ammo_F: Truck_02_Ammo_base_F {
        GVAR(attachPos)[] = {0, -0.17, 0.69};
    };
    class O_Truck_02_fuel_F: Truck_02_fuel_base_F {
        GVAR(attachPos)[] = {0, 0.02, 0.69};
    };
    class I_Truck_02_ammo_F: Truck_02_Ammo_base_F {
        GVAR(attachPos)[] = {0, -0.17, 0.69};
    };
    class I_Truck_02_box_F: Truck_02_box_base_F {
        GVAR(attachPos)[] = {0, -0.17, 0.69};
    };
    class I_Truck_02_medical_F: Truck_02_medical_base_F {
        GVAR(attachPos)[] = {0, -0.28, 0.69};
    };
    class I_Truck_02_fuel_F: Truck_02_fuel_base_F {
        GVAR(attachPos)[] = {0, 0.02, 0.69};
    };
    class C_Truck_02_fuel_F: Truck_02_fuel_base_F {
        GVAR(attachPos)[] = {0, 0.02, 0.69};
    };
    class C_Truck_02_box_F: Truck_02_box_base_F {
        GVAR(attachPos)[] = {0, -0.17, 0.69};
    };
    class I_Heli_light_03_F: Heli_light_03_base_F {
        GVAR(attachPos)[] = {0, -1.17, 1};
    };
    class I_Heli_light_03_unarmed_F: Heli_light_03_unarmed_base_F {
        GVAR(attachPos)[] = {0, -1.18, 0.81};
    };
    class B_Plane_CAS_01_F: Plane_CAS_01_base_F {
        GVAR(attachPos)[] = {0, -0.67, 0.9};
    };
    class O_APC_Wheeled_02_rcws_F: O_APC_Wheeled_02_base_F {
        GVAR(attachPos)[] = {0, 1.38, 1.01};
    };
    class B_UAV_01_F: UAV_01_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.35};
    };
    class O_UAV_01_F: UAV_01_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.35};
    };
    class I_UAV_01_F: UAV_01_base_F {
        GVAR(attachPos)[] = {0, -0.01, -1.35};
    };
    class O_Truck_03_transport_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 0.59, 0.81};
    };
    class O_Truck_03_covered_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 0.57, 0.81};
    };
    class O_Truck_03_repair_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 0.98, 0.54};
    };
    class O_Truck_03_ammo_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 0.86, 0.54};
    };
    class O_Truck_03_fuel_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 1.07, 0.54};
    };
    class O_Truck_03_medical_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 0.57, 0.82};
    };
    class O_Truck_03_device_F: Truck_03_base_F {
        GVAR(attachPos)[] = {0, 1, 0.54};
    };
    class B_Heli_Transport_03_F: Heli_Transport_03_base_F {
        GVAR(attachPos)[] = {0, 0.06, 2.02};
    };
    class B_Heli_Transport_03_unarmed_F: Heli_Transport_03_unarmed_base_F {
        GVAR(attachPos)[] = {0, 0.06, 2.02};
    };
    class I_C_Heli_Light_01_civil_F: Heli_Light_01_civil_base_F {
        GVAR(attachPos)[] = {0, -0.41, 0.8};
    };
    class B_CTRG_Heli_Transport_01_sand_F: Heli_Transport_01_base_F {
        GVAR(attachPos)[] = {0, -1.69, 1.01};
    };
    class B_CTRG_Heli_Transport_01_tropic_F: Heli_Transport_01_base_F {
        GVAR(attachPos)[] = {0, -1.69, 1.01};
    };
    class C_Plane_Civil_01_F: Plane_Civil_01_base_F {
        GVAR(attachPos)[] = {0, -1.79, 0.1};
    };
    class C_Plane_Civil_01_racing_F: Plane_Civil_01_base_F {
        GVAR(attachPos)[] = {0, -1.79, 0.1};
    };
    class I_C_Plane_Civil_01_F: Plane_Civil_01_base_F {
        GVAR(attachPos)[] = {0, -1.79, 0.1};
    };
    class B_T_UAV_03_F: UAV_03_base_F {
        GVAR(attachPos)[] = {0, 0.1, 0.13};
    };
    class O_T_APC_Wheeled_02_rcws_ghex_F: O_APC_Wheeled_02_base_F {
        GVAR(attachPos)[] = {0, 1.38, 1.01};
    };
    class C_Scooter_Transport_01_F: Scooter_Transport_01_base_F {
        GVAR(attachPos)[] = {0, 0.14, -0.06};
    };
};
