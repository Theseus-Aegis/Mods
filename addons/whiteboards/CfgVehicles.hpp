class CfgVehicles {
    class ACE_Module;
    class GVAR(module): ACE_Module {
        author = ECSTRING(common,Author);
        category = "TAC";
        displayName = CSTRING(DisplayName);
        function = QFUNC(setupWhiteboard);
        scope = 2;
        isGlobal = 0; // Server only
        isTriggerActivated = 0;
        isDisposable = 0;
        //icon = QUOTE(PATHTOF(UI\Icon_Module_Whiteboards_ca.paa));
        class Arguments {
            class Whiteboard {
                displayName = CSTRING(Whiteboard_DisplayName);
                description = CSTRING(Whiteboard_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Controller {
                displayName = CSTRING(Controller_DisplayName);
                description = CSTRING(Controller_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Images {
                displayName = CSTRING(Images_DisplayName);
                description = CSTRING(Images_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Names {
                displayName = CSTRING(Names_DisplayName);
                description = CSTRING(Names_Description);
                typeName = "STRING";
                defaultValue = "";
            };
        };
        class ModuleDescription {
            description = CSTRING(Description);

            #define MACRO_SYNC \
                optional = 1; \
                duplicate = 1;
            #define CONTROLLER description = "Controller";
            #define WHITEBOARD description = "Controller";
            #define BOTH description = "Whiteboard AND Controller";

            sync[] = {
                "Land_MapBoard_F", // Whiteboards
                "Land_Laptop_unfolded_F", "Land_Laptop_device_F", "Land_PCSet_01_screen_F", // Both
                "Land_HandyCam_F", "Land_MobilePhone_smart_F", "Land_Tablet_01_F", "Land_PCSet_01_keyboard_F", "Land_PCSet_01_mouse_F", "Land_GamingSet_01_controller_F" // Controllers
            };

            class Land_MapBoard_F {MACRO_SYNC WHITEBOARD};

            class Land_Laptop_unfolded_F {MACRO_SYNC BOTH};
            class Land_Laptop_device_F {MACRO_SYNC BOTH};
            class Land_PCSet_01_screen_F {MACRO_SYNC BOTH};

            class Land_HandyCam_F {MACRO_SYNC CONTROLLER};
            class Land_MobilePhone_smart_F {MACRO_SYNC CONTROLLER};
            class Land_Tablet_01_F {MACRO_SYNC CONTROLLER};
            class Land_PCSet_01_keyboard_F {MACRO_SYNC CONTROLLER};
            class Land_PCSet_01_mouse_F {MACRO_SYNC CONTROLLER};
            class Land_GamingSet_01_controller_F {MACRO_SYNC CONTROLLER};
        };
    };

    #define MACRO_SLIDES \
        class GVAR(Slides) { \
            displayName = CSTRING(Interaction); \
            condition = QUOTE(_this call FUNC(hasSlides)); \
            insertChildren = QUOTE(_this call DFUNC(addSlideActions)); \
        };

    #define MACRO_ACE_INTERACT_INIT \
        XEH_ENABLED; \
        class ACE_Actions { \
            class ACE_MainActions { \
                displayName = $STR_ACE_Interaction_MainAction; \
                selection = ""; \
                condition = "true"; \
                distance = 2; \
                MACRO_SLIDES \
            }; \
        };

    class ThingX;
    class Land_MapBoard_F: ThingX {
        MACRO_ACE_INTERACT_INIT
    };

    class Land_Laptop_F;
    class Land_Laptop_unfolded_F: Land_Laptop_F {
        MACRO_ACE_INTERACT_INIT
    };
    //class Land_Laptop_device_F: Land_Laptop_unfolded_F;

    class Items_base_F;
    class Land_PCSet_01_screen_F: Items_base_F {
        MACRO_ACE_INTERACT_INIT
    };
    class Land_HandyCam_F: Items_base_F {
        MACRO_ACE_INTERACT_INIT
    };
    class Land_MobilePhone_smart_F: Items_base_F {
        MACRO_ACE_INTERACT_INIT
    };
    class Land_Tablet_01_F: Items_base_F {
        MACRO_ACE_INTERACT_INIT
    };
    class Land_PCSet_01_keyboard_F: Items_base_F {
        MACRO_ACE_INTERACT_INIT
    };
    class Land_PCSet_01_mouse_F: Items_base_F {
        MACRO_ACE_INTERACT_INIT
    };
    class Land_GamingSet_01_controller_F: Items_base_F {
        MACRO_ACE_INTERACT_INIT
    };
};
