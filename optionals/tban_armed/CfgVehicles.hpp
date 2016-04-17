class CfgVehicles {
    // Backpacks
    class B_FieldPack_blk;
    class GVAR(FieldPack_Black_Filled): B_FieldPack_blk {
        scope = 1;
        class TransportMagazines {
            class _xx_rpg32_f {
                magazine = "rpg32_f";
                count = 2;
            };
        };
    };

    // Units
    class O_Soldier_base_F;
    class TBan_Fighter1: O_Soldier_base_F {
        weapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        magazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
		respawnMagazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
    };
    class TBan_Fighter1NH: O_Soldier_base_F {
        weapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        magazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
		respawnMagazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
    };
    class TBan_Fighter2: TBan_Fighter1 {
        backpack = QGVAR(FieldPack_Black_Filled); // Required to be able to hold RPG rounds without RPT warnings
        weapons[] = {MOD_WEAPONS, "hlc_rifle_ak74", "launch_RPG32_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_ak74", "launch_RPG32_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(hlc_30Rnd_545x39_B_AK)};
		respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(hlc_30Rnd_545x39_B_AK)};
    };
    class TBan_Fighter2NH: TBan_Fighter1 {
        backpack = QGVAR(FieldPack_Black_Filled); // Required to be able to hold RPG rounds without RPT warnings
        weapons[] = {MOD_WEAPONS, "hlc_rifle_ak74", "launch_RPG32_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_ak74", "launch_RPG32_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(hlc_30Rnd_545x39_B_AK)};
		respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(hlc_30Rnd_545x39_B_AK)};
    };
    class TBan_Fighter3: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        magazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
		respawnMagazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
    };
    class TBan_Fighter3NH: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        magazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
		respawnMagazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
    };
    class TBan_Fighter4: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        magazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
		respawnMagazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
    };
    class TBan_Fighter5: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hlc_rifle_rpk12"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_rpk12"};
        magazines[] = {MOD_MAGAZINES, ITEMS_4(hlc_45Rnd_545x39_t_rpk)};
		respawnMagazines[] = {MOD_MAGAZINES, ITEMS_4(hlc_45Rnd_545x39_t_rpk)};
    };
    class TBan_Fighter6: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hlc_rifle_rpk12"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_rpk12"};
        magazines[] = {MOD_MAGAZINES, ITEMS_4(hlc_45Rnd_545x39_t_rpk)};
		respawnMagazines[] = {MOD_MAGAZINES, ITEMS_4(hlc_45Rnd_545x39_t_rpk)};
    };
    class TBan_Fighter6NH: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hlc_rifle_rpk12"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_rpk12"};
        magazines[] = {MOD_MAGAZINES, ITEMS_4(hlc_45Rnd_545x39_t_rpk)};
		respawnMagazines[] = {MOD_MAGAZINES, ITEMS_4(hlc_45Rnd_545x39_t_rpk)};
    };
    class TBan_Warlord: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        respawnWeapons[] = {MOD_WEAPONS, "hlc_rifle_ak74"};
        magazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_3(hlc_30Rnd_545x39_B_AK), ITEMS_2(hlc_30Rnd_545x39_T_AK)};
    };
    class TBan_Recruit: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
    };
    class TBan_Recruit1NH: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
    };
    class TBan_Recruit2: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
    };
    class TBan_Recruit2NH: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
    };
    class TBan_Recruit3: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
    };
    class TBan_Recruit3NH: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
    };
    class TBan_Recruit4: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
    };
    class TBan_Recruit5: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
    };
    class TBan_Recruit6: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
    };
    class TBan_Recruit6NH: TBan_Fighter1 {
        weapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        respawnWeapons[] = {MOD_WEAPONS, "hgun_PDW2000_F"};
        magazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
        respawnMagazines[] = {MOD_MAGAZINES, ITEMS_5(30rnd_9x21_mag)};
    };

    // Vehicles
    class B_G_Offroad_01_armed_F;
    class Tban_O_Offroad_01_F: B_G_Offroad_01_armed_F {
        _generalMacro = "Tban_O_Offroad_01_F";
        scopeCurator = 2;
    };

    class B_G_Offroad_01_F;
    class GVAR(offroad): B_G_Offroad_01_F {
        _generalMacro = QGVAR(offroad);
        MACRO_VEHICLE_TBAN_ARMED
        displayName = "Taliban Offroad";
    };

    class B_G_Van_01_transport_F;
    class GVAR(truck): B_G_Van_01_transport_F {
        _generalMacro = QGVAR(truck);
        MACRO_VEHICLE_TBAN_ARMED
        displayname = "Taliban Truck";
    };
};
