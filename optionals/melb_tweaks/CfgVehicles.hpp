class CfgVehicles {
    class Helicopter_Base_H;
    class MELB_base: Helicopter_Base_H {
        class UserActions {
            class MFD_Toggle {
                condition = QUOTE(this call FUNC(canToggleMFD));
                statement = QUOTE(this call FUNC(toggleMFD));
            };
        };
    };
};
