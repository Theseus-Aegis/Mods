class RscInGameUI {
    class RscUnitInfo;
    class Rsc_MELB_Turret_UnitInfo: RscUnitInfo {
        onLoad = QUOTE([ARR_4('onLoad',_this,'RscUnitInfo','IGUI')] call (uiNamespace getVariable 'BIS_fnc_initDisplay'); _this call FUNC(handleFLIR)); // switched to custom function
    };

    class RscUnitInfoAir_NoRadar_MELB;
    class Rsc_MELB_UnitInfo: RscUnitInfoAir_NoRadar_MELB {
        controls[] = {"CA_BackgroundVehicle", "CA_BackgroundVehicleTitle", "CA_BackgroundVehicleTitleDark", "CA_BackgroundFuel", "CA_Vehicle", "CA_VehicleRole", "CA_HitZones", "CA_VehicleTogglesBackground", "CA_VehicleToggles", "CA_SpeedBackground", "CA_SpeedUnits", "CA_Speed", "CA_ValueFuel", "CA_AltBackground", "CA_AltUnits", "CA_Alt", "WeaponInfoControlsGroupRight"}; // removed "CA_Radar"
        onLoad = QUOTE([ARR_4('onLoad',_this,'RscUnitInfo','IGUI')] call (uiNamespace getVariable 'BIS_fnc_initDisplay'); _this call FUNC(loadMFD)); // switched to custom function
    };

    class RscUnitInfoAirRTD_NoRadar_MELB;
    class Rsc_MELB_RTD_UnitInfo: RscUnitInfoAirRTD_NoRadar_MELB {
        controls[] = {"CA_BackgroundVehicle", "CA_BackgroundVehicleTitle", "CA_BackgroundVehicleTitleDark", "CA_BackgroundFuel", "CA_Vehicle", "CA_VehicleRole", "CA_HitZones", "CA_VehicleTogglesBackground", "CA_VehicleToggles", "CA_SpeedBackground", "CA_SpeedUnits", "CA_Speed", "CA_ValueFuel", "CA_AltBackground", "CA_AltUnits", "CA_Alt", "CA_Horizon_Lite", "CA_Speed_Analogue", "CA_Altitude_Analogue", "CA_Horizon_Analogue", "CA_Stability_Analogue", "CA_Compass_Analogue", "WeaponInfoControlsGroupRight"}; // removed "CA_Radar"
        onLoad = QUOTE([ARR_4('onLoad',_this,'RscUnitInfoAirRTD_NoRadar_MELB','IGUI')] call (uiNamespace getVariable 'BIS_fnc_initDisplay'); _this call FUNC(loadMFD)); // switched to custom function
    };
};
