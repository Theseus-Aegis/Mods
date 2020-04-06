/*class RscInGameUI {
    class RscUnitInfo;
    class Rsc_MELB_Turret_UnitInfo: RscUnitInfo {
        onLoad = "['onLoad', _this, 'RscUnitInfo', 'IGUI'] call (uiNamespace getVariable 'BIS_fnc_initDisplay'); _this spawn tac_melb_pilotcam_fnc_handleFlir";
    };
};*/

class CfgVehicles {
    class Helicopter_Base_F;
    class Helicopter_Base_H: Helicopter_Base_F {
        class Turrets;
    };
    class MELB_base: Helicopter_Base_H {
        class Turrets: Turrets {
            class CopilotTurret;
        };

        memoryPointDriverOptics = "commanderview";

        class pilotCamera {
            class OpticsIn {
                class Wide {
                    opticsDisplayName = "----";
                    initAngleX = 0;
                    minAngleX = -360;
                    maxAngleX = 360;
                    initAngleY = 0;
                    minAngleY = -15;
                    maxAngleY = 85;
                    initFov = 0.3;
                    minFov = 0.3;
                    maxFov = 0.3;
                    visionMode[] = {"Normal", "NVG", "Ti"};
                    thermalMode[] = {0};
                    directionStabilized = 1;
                    horizontallyStabilized = 1;
                    gunnerOpticsModel = "melb\data\optics\melb_flir_wf.p3d";
                    opticsPPEffects[] = {"OpticsCHAbera3", "OpticsBlur3"};
                    gunnerOpticsEffect[] = {"TankCommanderOptics2"};
                };
                class WideT: Wide {
                    initFov = 0.2;
                    minFov = 0.2;
                    maxFov = 0.2;
                    gunnerOpticsModel = "melb\data\optics\melb_flir_w2.p3d";
                };
                class MediumT: WideT {
                    initFov = 0.1;
                    minFov = 0.1;
                    maxFov = 0.1;
                    gunnerOpticsModel = "melb\data\optics\melb_flir_m.p3d";
                };
                class NarrowT: WideT {
                    initFov = 0.022;
                    minFov = 0.022;
                    maxFov = 0.022;
                    gunnerOpticsModel = "melb\data\optics\melb_flir_n.p3d";
                };
                class NarrowT2: WideT {
                    initFov = 0.0092;
                    minFov = 0.0092;
                    maxFov = 0.0092;
                    gunnerOpticsModel = "melb\data\optics\melb_flir_n2.p3d";
                };
            };

            minTurn = -180;
            maxTurn = 180;
            initTUrn = 0;
            minElev = -180;
            maxElev = 180;
            initElev = 0;
            maxXRotSpeed = 1;
            maxYRotSpeed = 1;
            maxMouseXRotSpeed = 0.5;
            maxMouseYRotSpeed = 0.5;
            pilotOpticsShowCursor = 1;
            controllable = 1;
        };
    };

    class MELB_AH6M: MELB_base {
        weapons[] += {"Laserdesignator_MELB"};
        magazines[] += {"Laserbatteries"};

        class Turrets: Turrets {
            class CopilotTurret: CopilotTurret {
                weapons[] = {"LWIRCM_MELB"};
                magazines[] = {
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB",
                    "LWIRCM_Magazine_MELB"
                };
            };
        };
    };
};
