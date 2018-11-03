class RscInGameUI {
    class RscUnitInfo;
    class Rsc_MELB_Turret_UnitInfo: RscUnitInfo {
        onLoad = "['onLoad', _this, 'RscUnitInfo', 'IGUI'] call (uiNamespace getVariable 'BIS_fnc_initDisplay'); _this spawn tac_melb_pilotcam_fnc_handleFlir";
    };
};

class CfgVehicles {
    class Helicopter_Base_H;
    class MELB_base: Helicopter_Base_H {
        class pilotCamera {
            class OpticsIn {
                class Wide {
                    opticsDisplayName = "----";
                    initAngleX = 0;
                    minAngleX = 0;
                    maxAngleX = 0;
                    initAngleY = 0;
                    minAngleY = 0;
                    maxAngleY = 0;
                    initFov = 0.30000001;
                    minFov = 0.30000001;
                    maxFov = 0.30000001;
                    visionMode[] = {"Normal", "NVG", "Ti"};
                    thermalMode[] = {0};
                    gunnerOpticsModel = "melb\data\optics\melb_flir_wf.p3d";
                    opticsPPEffects[] = {"OpticsCHAbera2", "OpticsBlur2"};
                    gunnerOpticsEffect[] = {"TankCommanderOptics2"};
                    //directionStabilized = 1;
                };
                class WideT2: Wide {
                    initFov = 0.2;
                    minFov = 0.2;
                    maxFov = 0.2;
                    gunnerOpticsModel = "melb\data\optics\melb_flir_w2.p3d";
                };
                class MediumT: Wide {
                    initFov = 0.1;
                    minFov = 0.1;
                    maxFov = 0.1;
                    gunnerOpticsModel = "melb\data\optics\melb_flir_m.p3d";
                };
                class NarrowT: Wide {
                    initFov = 0.022;
                    minFov = 0.022;
                    maxFov = 0.022;
                    gunnerOpticsModel = "melb\data\optics\melb_flir_n.p3d";
                };
                class NarrowT2: Wide {
                    initFov = 0.0092000002;
                    minFov = 0.0092000002;
                    maxFov = 0.0092000002;
                    gunnerOpticsModel = "melb\data\optics\melb_flir_n2.p3d";
                };

                showMiniMapInOptics = 1;
                showUAVViewInOptics = 0;
                showSlingLoadManagerInOptics = 0;
            };

            initAngleX = 0;
            minAngleX = -30;
            maxAngleX = 30;
            initAngleY = 0;
            minAngleY = -100;
            maxAngleY = 100;
            initFov = 1.1;
            minFov = 0.133;
            maxFov = 1.1;
            maxXRotSpeed = 0.30000001;
            maxYRotSpeed = 0.30000001;
            pilotOpticsShowCursor = 0;
            controllable = 1;
            turretInfoType = "Rsc_MELB_Turret_UnitInfo";
        };
        memoryPointDriverOptics = "commanderview";
    };

    class MELB_AH6M: MELB_base {
        weapons[] += {"Laserdesignator_MELB"};
    };
};
