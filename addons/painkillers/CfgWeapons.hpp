class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore;

    class TAC_painkillers: ACE_ItemCore {
        scope = 2;
        author = "Alganthe";
        model = "\A3\Structures_F_EPA\Items\Medical\PainKillers_F.p3d";
        displayName = CSTRING(displayName);
        descriptionShort = "$STR_ACE_Medical_Morphine_Desc_Short";
        descriptionUse = "$STR_ACE_Medical_Morphine_Desc_Use";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
