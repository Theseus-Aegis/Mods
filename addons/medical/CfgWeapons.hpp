class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore;

    class GVAR(painkillers): ACE_ItemCore {
        scope = 2;
        author = "Alganthe";
        model = "\A3\Structures_F_EPA\Items\Medical\PainKillers_F.p3d";
        picture = QPATHTOF(ui\painkillers_inventory_ca.paa);
        displayName = CSTRING(DisplayName);
        descriptionShort = ACECSTRING(Medical_Treatment,Morphine_Desc_Short);
        descriptionUse = ACECSTRING(Medical_Treatment,Morphine_Desc_Use);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
