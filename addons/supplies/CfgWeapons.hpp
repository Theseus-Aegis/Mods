class CfgWeapons {
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;
    class GVAR(randomizedBox): CBA_MiscItem {
        author = "Tyrone";
        scope = 0;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
    class GVAR(replacementBase): CBA_MiscItem {
        author = "Tyrone";
        scope = 0;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
