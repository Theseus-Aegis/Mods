class CBA_Extended_EventHandlers;

class CfgVehicles {

    class Items_base_F;
    class Land_SurvivalRadio_F: Items_base_F {
        GVAR(isRadio) = 1;
        class ACE_Actions {
            class ACE_MainActions {
                selection = "";
                distance = 5;
                condition = "true";
            };
        };
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
    class Land_FMradio_F: Items_base_F {
        GVAR(isRadio) = 1;
        class ACE_Actions {
            class ACE_MainActions {
                selection = "";
                distance = 5;
                condition = "true";
            };
        };
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
};
