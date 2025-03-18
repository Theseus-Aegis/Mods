class Cfg3DEN {
    class Compositions {
        // Contracts
        class GVAR(Contract_Template) {
            displayName = "Contract Template";
            editorCategory = QGVAR(Theseus);
            editorSubcategory = QGVAR(Contracts);
            icon = "\a3\ui_f\data\map\markers\nato\b_inf.paa";
            path = "x\tac\addons\mission\compositions\contract_template";
            side = 8;
            useSideColorOnIcon = 1;
        };
        class GVAR(Contract_Helios): GVAR(Contract_Template) {
            displayName = "Helios Template";
            path = "x\tac\addons\mission\compositions\contract_helios";
        };

        // Extra
        class GVAR(Extra_Arcadian_Black): GVAR(Contract_Helios) {
            displayName = "Arcadian Black";
            editorSubcategory = QGVAR(Extra);
            path = "x\tac\addons\mission\compositions\extra_arcadian_black";
        };
        class GVAR(Extra_Arcadian_Green): GVAR(Contract_Helios) {
            displayName = "Arcadian Green";
            editorSubcategory = QGVAR(Extra);
            path = "x\tac\addons\mission\compositions\extra_arcadian_green";
        };
        class GVAR(Extra_Arcadian_Tan): GVAR(Contract_Helios) {
            displayName = "Arcadian Tan";
            editorSubcategory = QGVAR(Extra);
            path = "x\tac\addons\mission\compositions\extra_arcadian_tan";
        };

        // SOG
        class GVAR(SOG_Arsenal): GVAR(Contract_Helios) {
            displayName = "Arsenal";
            editorSubcategory = QGVAR(SOG);
            path = "x\tac\addons\mission\compositions\sog_full_arsenal";
        };
        class GVAR(SOG_Template): GVAR(SOG_Arsenal) {
            displayName = "SOG Template";
            path = "x\tac\addons\mission\compositions\sog_template";
        };
        class GVAR(SOG_Zeus): GVAR(SOG_Arsenal) {
            displayName = "SOG Zeus";
            path = "x\tac\addons\mission\compositions\sog_zeus";
        };
    };
};
