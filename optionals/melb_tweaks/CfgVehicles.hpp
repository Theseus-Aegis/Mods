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
        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                class OpticsIn {
                    class Wide {
                        directionStabilized = 1;
                    };
                };
            };
        };

        class UserActions {
            class MFD_Toggle {
                condition = QUOTE(this call FUNC(canToggleMFD));
                statement = QUOTE(this call FUNC(toggleMFD));
            };
        };
    };
};
