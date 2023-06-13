class RscInGameUI {
    class RscUnitInfo;
    class Rsc_MELB_Turret_UnitInfo: RscUnitInfo {
        onLoad = QUOTE([ARR_4('onLoad',_this,'RscUnitInfo','IGUI')] call (uiNamespace getVariable 'BIS_fnc_initDisplay'); _this call FUNC(handleFLIR));
    };

    class RscUnitInfoAir_NoRadar_MELB;
    class Rsc_MELB_UnitInfo: RscUnitInfoAir_NoRadar_MELB {
        onLoad = QUOTE([ARR_4('onLoad',_this,'RscUnitInfo','IGUI')] call (uiNamespace getVariable 'BIS_fnc_initDisplay'); _this call FUNC(handleMFD));
    };

    class RscUnitInfoAirRTD_NoRadar_MELB;
    class Rsc_MELB_RTD_UnitInfo: RscUnitInfoAirRTD_NoRadar_MELB {
        onLoad = QUOTE([ARR_4('onLoad',_this,'RscUnitInfoAirRTD_NoRadar_MELB','IGUI')] call (uiNamespace getVariable 'BIS_fnc_initDisplay'); _this call FUNC(handleMFD));
    };
};
