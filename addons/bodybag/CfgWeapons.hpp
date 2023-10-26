class CfgWeapons {
    class ACE_bodyBag;
    class GVAR(OrangeLogo): ACE_bodyBag {
        displayName = CSTRING(Orange_DisplayName);
        picture = QPATHTOF(ui\bodybag_orangelogo_ca.paa);
        //hiddenSelections[] = {"camo"};
        //hiddenSelectionsTextures[] = {QPATHTOF(data\bodybagItem_orange_co.paa)};
        ACEGVAR(medical_treatment,bodyBagObject) = QGVAR(Object_OrangeLogo);
    };
};
