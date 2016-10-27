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
        driverCanEject = 1;

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                canEject = 1;
            };
        };
    };
};
