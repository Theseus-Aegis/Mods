class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore;

    class GVAR(painkillers): ACE_ItemCore {
        scope = 2;
        author = "Alganthe";
        model = "\A3\Structures_F_EPA\Items\Medical\PainKillers_F.p3d";
        picture = QPATHTOF(data\painkillers_inventory.paa);
        displayName = CSTRING(DisplayName);
        descriptionShort = ACECSTRING(Medical,Morphine_Desc_Short);
        descriptionUse = ACECSTRING(Medical,Morphine_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
