class CfgVehicles {
    class Box_NATO_WpsLaunch_F;
    class Box_AAF_Uniforms_F;

    class tac_Supply_Launchers: Box_NATO_WpsLaunch_F {
        author = "Tyrone";
        displayName = CSTRING(Supply_Launchers_Name);
        EDITOR_CATEGORY
        scope = 2;
        scopeCurator = 2;
        maximumLoad = 3000;
        transportMaxWeapons = 15;
        editorPreview = QPATHTOF(ui\supply_launchers_ca.jpg);
        hiddenSelections[] = {
            "Camo_Signs",
            "Camo"
        };
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\launchers_sign_co.paa),
            QPATHTOF(data\launchers_texture_co.paa)
        };

        class TransportMagazines {
            MACRO_ADDMAGAZINE(RPG7_F,6);
            MACRO_ADDMAGAZINE(MRAWS_HEAT_F,6);
            MACRO_ADDMAGAZINE(RPG32_HE_F,6);
            
        };

        class TransportWeapons {
            MACRO_ADDWEAPON(launch_RPG7_F,3);
            MACRO_ADDWEAPON(launch_RPG32_green_F,3);
            MACRO_ADDWEAPON(CUP_launch_M136,3);
            MACRO_ADDWEAPON(launch_MRAWS_green_rail_F,3);
            MACRO_ADDWEAPON(launch_NLAW_F,3);
        };
        class TransportBackpacks {};
    };

    class tac_Supply_Engineer: Box_AAF_Uniforms_F {
        author = "Tyrone";
        displayName = CSTRING(Supply_Engineer_Name);
        EDITOR_CATEGORY
        scope = 2;
        scopeCurator = 2;
        maximumLoad = 3000;
//        editorPreview = QPATHTOF(ui\supply_engineer_ca.jpg); Waiting for texture
        hiddenSelections[] = {
            "camo",
            "camo_signs"
        };
        hiddenSelectionsTextures[] = { // Placeholder for Textures
            "\A3\Supplies_F_Exp\Ammoboxes\Data\uniforms_box_indep_co.paa",
            "\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_indep_ca.paa"
        };

        class TransportMagazines {
            MACRO_ADDMAGAZINE(SatchelCharge_Remote_Mag,6);
            MACRO_ADDMAGAZINE(DemoCharge_Remote_Mag,6);
            MACRO_ADDMAGAZINE(AMP_Breaching_Charge_Mag,12);
        };
        class TransportItems {
            MACRO_ADDITEM(B_UavTerminal,1);
        };
        class TransportBackpacks {
            MACRO_ADDBACKPACK(B_UGV_02_Demining_backpack_F,1); // Placeholder until new one is created.
        };
    };

    class tac_Supply_Medic: tac_Supply_Engineer {
        displayName = CSTRING(Supply_Medic_Name);
        EDITOR_CATEGORY
//        editorPreview = QPATHTOF(ui\supply_medic_ca.jpg); Waiting for texture
        hiddenSelections[] = {
            "camo",
            "camo_signs"
        };
        hiddenSelectionsTextures[] = { // Placeholder for Textures
            "\A3\Supplies_F_Exp\Ammoboxes\Data\uniforms_box_indep_co.paa",
            "\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_indep_ca.paa"
        };
        class TransportBackpacks {};
        class TransportItems {};
        class TransportMagazines {};
        class TransportWeapons {};

        class EventHandlers: EventHandlers {
            class tac_events {
                init = "if (local (_this select 0)) then { [_this select 0, ['ACE_packingBandage','ACE_elasticBandage','ACE_fieldDressing','ACE_bloodIV','ACE_bloodIV_250','ACE_bloodIV_500','ACE_bodyBag','ACE_epinephrine','ACE_morphine','tac_medical_painkillers','ACE_plasmaIV','ACE_plasmaIV_250','ACE_plasmaIV_500','ACE_salineIV','ACE_salineIV_250','ACE_salineIV_500','ACE_splint','ACE_surgicalKit','ACE_tourniquet','ACE_adenosine','ACE_quikclot'], true] call ace_arsenal_fnc_initBox; };";
            };
        };
    };
};
