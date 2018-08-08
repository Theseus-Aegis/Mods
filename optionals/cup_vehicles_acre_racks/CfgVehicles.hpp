class CfgVehicles {
    class CUP_LR_Base;
    class CUP_LR_Transport_Base: CUP_LR_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"cargo", 2}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
    class CUP_LR_MG_Base: CUP_LR_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"turret", {0}}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
    class CUP_LR_Ambulance_Base: CUP_LR_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"cargo", 0}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
    class CUP_LR_Special_Base: CUP_LR_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", "commander"};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
    class CUP_LR_SPG9_Base: CUP_LR_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"turret", {1}}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };

    class CUP_SUV_Base;
    class CUP_SUV_Unarmed_Base: CUP_SUV_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"cargo", 1}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
    class CUP_SUV_Armored_Base: CUP_SUV_Base {
        class AcreRacks {
            class Rack_1 {
                displayName = "$STR_ACRE_sys_rack_dash";
                shortName = "$STR_ACRE_sys_rack_dashShort";
                componentName = "ACRE_VRC103";
                allowedPositions[] = {"driver", {"cargo", 0}};
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";
                isRadioRemovable = 0;
                intercom[] = {};
            };
        };
    };
};
