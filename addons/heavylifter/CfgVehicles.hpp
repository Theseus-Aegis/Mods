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

// Vehicle Configuration
  /* Air */
    class Helicopter_Base_F;
    class Helicopter_Base_H: Helicopter_Base_F {};

    // Little Bird
    class Heli_Light_01_base_F: Helicopter_Base_H {
        GVAR(attachPos[]) = {0, 0, 0.1};
    };
    // M-900
    class Heli_Light_01_unarmed_base_F;
    class Heli_Light_01_civil_base_F: Heli_Light_01_unarmed_base_F {
        GVAR(attachPos[]) = {0, -1, -0.7};
    };
    // PO-30 Orca
    class Heli_Light_02_base_F: Helicopter_Base_H {
        GVAR(attachPos[]) = {0, 0, 1};
    };
    // WY-55 Hellcat
    class Heli_light_03_base_F: Helicopter_Base_F {
        GVAR(attachPos[]) = {0, -1.5, 0.2};
    };
    // UH-80 Ghost Hawk
    class Heli_Transport_01_base_F: Helicopter_Base_H {
        GVAR(attachPos[]) = {0, -2, 0.9};
    };
    // CH-49 Mohawk
    class Heli_Transport_02_base_F: Helicopter_Base_H {
        GVAR(attachPos[]) = {0, -1.5, 2.25};
    };
    // CH-67 Huron
    class Heli_Transport_03_base_F: Helicopter_Base_H {
        GVAR(attachPos[]) = {0, -1, 1.75};
    };
    // AH-99 Blackfoot
    class Heli_Attack_01_base_F: Helicopter_Base_F {
        GVAR(attachPos[]) = {0, 0, 0.65};
    };
    // Mi-48 Kajman
    class Heli_Attack_02_base_F: Helicopter_Base_F {
        GVAR(attachPos[]) = {0, 0, 1.9};
    };

    // A-164 Wipeout
    class Plane_Base_F;
    class Plane_CAS_01_base_F: Plane_Base_F {
        GVAR(attachPos[]) = {0, 0.5, 0.9};
    };


    /* Cars */
    // HEMTT
    class B_Truck_01_transport_F;
    class B_Truck_01_medical_F: B_Truck_01_transport_F {
        GVAR(attachPos[]) = {0, 0, 0.7};
    };
    class B_Truck_01_mover_F: B_Truck_01_transport_F {
        GVAR(attachPos[]) = {0, -2, 0.4};
    };
    class B_Truck_01_Repair_F: B_Truck_01_mover_F {
        GVAR(attachPos[]) = {0, 0, 0.8};
    };
    class B_Truck_01_ammo_F: B_Truck_01_mover_F {
        GVAR(attachPos[]) = {0, 0, 0.4};
    };
    class B_Truck_01_box_F: B_Truck_01_mover_F {
        GVAR(attachPos[]) = {0, 0, 0.8};
    };
    class B_Truck_01_fuel_F: B_Truck_01_mover_F {
        GVAR(attachPos[]) = {0, 0, 0.4};
    };

    class Truck_F;
    // Zamak
    class Truck_02_base_F: Truck_F {
        GVAR(attachPos[]) = {-0.1, 1.5, 0.8};
    };
    // Tempest
    class Truck_03_base_F: Truck_F {
        GVAR(attachPos[]) = {-0.1, 1, 1};
    };
    class O_Truck_03_repair_F: Truck_03_base_F {
        GVAR(attachPos[]) = {-0.1, 1, 0.7};
    };
    class O_Truck_03_fuel_F: Truck_03_base_F {
        GVAR(attachPos[]) = {-0.1, 1, 0.7};
    };
    class O_Truck_03_ammo_F: Truck_03_base_F {
        GVAR(attachPos[]) = {-0.1, 1, 0.7};
    };
    class O_Truck_03_device_F: Truck_03_base_F {
        GVAR(attachPos[]) = {-0.1, 1, 0.7};
    };

    class Wheeled_APC_F;
    // AMV-7 Marshall
    class APC_Wheeled_01_base_F: Wheeled_APC_F {
        GVAR(attachPos[]) = {0, 2, 1.05};
    };
    // MSE-3 Marid
    class APC_Wheeled_02_base_F: Wheeled_APC_F {
        GVAR(attachPos[]) = {-0.4, 2, 1.1};
    };

    /* Tanks */
    class Tank_F;

    // IFV-6, CRV-6
    class B_APC_Tracked_01_base_F;
    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        GVAR(attachPos[]) = {0, 2, 1.5};
    };
    class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
        GVAR(attachPos[]) = {0, 2.25, 1.15};
    };
    class B_APC_Tracked_01_rcws_F: B_APC_Tracked_01_base_F {
        GVAR(attachPos[]) = {0, 2, 1.15};
    };
    // ZSU-39 Tigris
    class APC_Tracked_02_base_F;
    class O_APC_Tracked_02_base_F: APC_Tracked_02_base_F {
        GVAR(attachPos[]) = {-0.1, 3, 1.3};
    };
    // BTR-K Kamysh
    class O_APC_Tracked_02_cannon_F: O_APC_Tracked_02_base_F {
        GVAR(attachPos[]) = {-0.1, 2, 1.1};
    };
    // FV-720 Mora
    class APC_Tracked_03_base_F: Tank_F {
        GVAR(attachPos[]) = {-0.1, 1, 0.95};
    };

    // M2A1 Slammer
    class MBT_01_base_F: Tank_F {
        GVAR(attachPos[]) = {0, 2.25, 0.85};
    };
    // M2A4 Slammer UP
    class B_MBT_01_cannon_F;
    class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
        GVAR(attachPos[]) = {0, 2.25, 1.2};
    };
    // M4
    class MBT_01_arty_base_F: MBT_01_base_F {
        GVAR(attachPos[]) = {0, 4, 1.6};
    };
    // M5
    class MBT_01_mlrs_base_F: MBT_01_base_F {
        GVAR(attachPos[]) = {0, 2, 0.35};
    };
    // T-100 Varsuk
    class MBT_02_base_F: Tank_F {
        GVAR(attachPos[]) = {-0.1, 2, 0.9};
    };
    // MBT-52 Kuma
    class MBT_03_base_F: Tank_F {
        GVAR(attachPos[]) = {-0.1, 1.5, 1.25};
    };
};
