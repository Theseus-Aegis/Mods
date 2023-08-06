class CfgVehicles {
    class Helicopter;
    class Helicopter_Base_F: Helicopter {
        class Turrets;
    };
    class Helicopter_Base_H: Helicopter_Base_F {
        class Turrets: Turrets {
            class CopilotTurret;
        };
    };

    class MELB_base: Helicopter_Base_H {
        EGVAR(heavyLifter,attachPos[]) = {0, 0, 0.6};
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                class OpticsIn {
                    class Wide {
                        directionStabilized = 1; // allow stabilization (required for GEOLOCK)
                        thermalMode[] = {0, 1}; // allow BHOT in addition to WHOT
                    };
                };
            };
        };

        class UserActions {
            class MFD_Toggle {
                condition = QUOTE(this call FUNC(canToggleMFD)); // use custom function
                statement = QUOTE(this call FUNC(toggleMFD)); // use custom function
            };
        };
    };

    class MELB_MH6M: MELB_base {
        ACEGVAR(fastroping,enabled) = 1;
        ACEGVAR(fastroping,ropeOrigins)[] = {{1.166, 0.79, -0.01}, {-1.166, 0.79, -0.01}};
    };
};
