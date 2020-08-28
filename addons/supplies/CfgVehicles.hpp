class CfgVehicles {
    class Box_NATO_WpsLaunch_F;
    class Box_AAF_Uniforms_F;

    class GVAR(Launchers): Box_NATO_WpsLaunch_F {
        author = "Tyrone";
        displayName = CSTRING(Supply_Launchers_Name);
        EDITOR_CATEGORY
        scope = 2;
        scopeCurator = 2;
        maximumLoad = 3000;
        transportMaxWeapons = 15;
        ace_dragging_canDrag = 0;
        ace_dragging_canCarry = 0;
        editorPreview = QPATHTOF(ui\supplies_launchers.jpg);
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

    class GVAR(Engineer): Box_AAF_Uniforms_F {
        author = "Tyrone";
        displayName = CSTRING(Supply_Engineer_Name);
        EDITOR_CATEGORY
        scope = 2;
        scopeCurator = 2;
        maximumLoad = 3000;
        ace_dragging_canDrag = 0;
        ace_dragging_canCarry = 0;
        editorPreview = QPATHTOF(ui\supplies_engineer.jpg);
        hiddenSelections[] = {
            "camo",
            "camo_signs"
        };
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\supply_base_texture_co.paa),
            QPATHTOF(data\supply_engineer_ca.paa)
        };

        class TransportMagazines {
            MACRO_ADDMAGAZINE(SatchelCharge_Remote_Mag,6);
            MACRO_ADDMAGAZINE(DemoCharge_Remote_Mag,6);
        };
        class TransportItems {
            MACRO_ADDITEM(B_UavTerminal,1);
            MACRO_ADDITEM(ACE_UAVBattery,3);
        };
        class TransportBackpacks {
            MACRO_ADDBACKPACK(B_UGV_02_Demining_backpack_F,1);
        };
    };

    class GVAR(Medic): GVAR(Engineer) {
        displayName = CSTRING(Supply_Medic_Name);
        EDITOR_CATEGORY
        editorPreview = QPATHTOF(ui\supplies_medic.jpg);
        hiddenSelections[] = {
            "camo",
            "camo_signs"
        };
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\supply_base_texture_co.paa),
            QPATHTOF(data\supply_medical_ca.paa)
        };

        class TransportBackpacks {};
        class TransportItems {
            MACRO_ADDITEM(ACE_salineIV_500,20);
            MACRO_ADDITEM(ACE_salineIV_250,20);
        };
        class TransportMagazines {};
        class TransportWeapons {};
    };

    class GVAR(Recruit): GVAR(Engineer) {
        displayName = CSTRING(Supply_Recruit_Name);
        EDITOR_CATEGORY
        editorPreview = QPATHTOF(ui\supplies_Recruit.jpg);
        hiddenSelections[] = {
            "camo",
            "camo_signs"
        };
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\supply_base_texture_co.paa),
            QPATHTOF(data\supply_recruit_ca.paa)
        };

        class TransportMagazines {};
        class TransportItems {
            MACRO_ADDITEM(muzzle_snds_m,5);
        };
        class TransportBackpacks {};
    };
};
