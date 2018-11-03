/*
UH1Y Flir camera handling script
handles monitor stuff

a: reyhard
*/

systemChat "flir handle start";
diag_log "start";

disableSerialization;

uiNameSpace setVariable ["MELB_FLIRCtrl",_this select 0];

/*
gunner
high refresh rate loop [0.1 sec]
*/
[] spawn
{
    diag_log "spawn";
    _MELB_aberr_ppEffect = ppEffectCreate ["ChromAberration", 200];
    _MELB_aberr_ppEffect ppEffectAdjust [0.002,0.002,200];
    _MELB_aberr_ppEffect ppEffectCommit 0;
    _MELB_NV_ppEffect = ppEffectCreate ["colorCorrections", 1500];
    _MELB_NV_ppEffect ppEffectAdjust [0.5,0.9,-0.01,[1,1,1,0],[0.5,1,0.5,0],[1,1,1,0], false];
    _MELB_NV_ppEffect ppEffectForceInNVG true;
    _MELB_NV_ppEffect ppEffectCommit 0;
    _MELB_noise_ppEffect = ppEffectCreate ["FilmGrain", 2000];
    _MELB_noise_ppEffect ppEffectAdjust [0.025,0.075,8,0.5,1,0];
    _MELB_noise_ppEffect ppEffectCommit 0;

    disableSerialization;
    _p=call MELB_fnc_findPlayer;
    _v=vehicle _p;

    _c = uiNamespace getVariable "MELB_FLIRCtrl";

    _z = (_c displayCtrl 180);
    _d = (_c displayCtrl 151);

    _zoom=(_c displayCtrl 2);
    _time=(_c displayCtrl 4);
    _time2=(_c displayCtrl 41);
    _gun=(_c displayCtrl 5);
    _tur=(_c displayCtrl 6);


    _gridaA="";
    _change=true;

    systemChat "loop start";
    while{not(isNull _d)}do
    {
        /*
            camera mode handler
        */
        if(cameraView == "gunner")then{
            if(currentVisionMode _p isEqualTo 0) then
            {
                _v setVariable ["MELB_mode",currentVisionMode _p,true];
                {_x ppEffectEnable true}foreach [_MELB_aberr_ppEffect];
                {_x ppEffectEnable false}foreach [_MELB_noise_ppEffect,_MELB_NV_ppEffect];
            }else{
                if(currentVisionMode _p isEqualTo 1) then{
                _v setVariable ["MELB_mode",currentVisionMode _p,true];
                {_x ppEffectEnable true}foreach [_MELB_noise_ppEffect,_MELB_aberr_ppEffect,_MELB_NV_ppEffect];
                }else {
                    _v setVariable ["MELB_mode",currentVisionMode _p,true];
                    {_x ppEffectEnable true}foreach [_MELB_noise_ppEffect];
                    {_x ppEffectEnable false}foreach [_MELB_NV_ppEffect,_MELB_aberr_ppEffect];};
            };
            if(_v animationPhase "MFD_CoPilot" == 0)then{
                _v animate ["copilotpip",1];
                _v animate ["MFD_CoPilot",1];
                systemChat "open mfd copilot";
            };
        }else{
            {_x ppEffectEnable false}foreach [_MELB_noise_ppEffect,_MELB_aberr_ppEffect,_MELB_NV_ppEffect];
        };
        /*
            cam zoom handler - gui part
        */
        _zoomLevel=(parseNumber  (ctrlText _z))*70;

        _zoomLevel=(if (_zoomLevel <= 99) then {"0"} else {""})+ str _zoomLevel;
        _gridA=toArray _zoomLevel;
        _gridaA=toString (call compile (format["[%1,%2,32,%3]",_gridA select 0,_gridA select 1,_gridA select 2]));

        _zoom ctrlSetText _gridaA;


        sleep 0.07;
    };
    ppEffectDestroy _MELB_noise_ppEffect;
    ppEffectDestroy _MELB_aberr_ppEffect;
    ppEffectDestroy _MELB_NV_ppEffect;
    uiNameSpace setVariable ["MELB_FLIRCtrl",displayNull];
};
/*
gunner
low refresh rate loop [1 sec]
*/
[] spawn
{
    disableSerialization;
    _p=call MELB_fnc_findPlayer;
    _v=vehicle _p;

    _c = uiNamespace getVariable "MELB_FLIRCtrl";

    _z = (_c displayCtrl 180);
    _d = (_c displayCtrl 151);

    _oldZoom=0.3;

    while{not(isNull _d)}do
    {
        /*
            cam zoom handler - gui part
        */
        //visible in gunner cam
        _zoomLevel=(parseNumber (ctrlText _z))*70;
        /*
            zoom is refreshed at low rate to avoid excessive mp traffic + data is transfered only in case of change
        */

        if(_oldZoom != _zoomLevel)then{_v setVariable ["MELB_zoom",_zoomLevel,true];_oldZoom=_zoomLevel;};

        sleep 1;
    };
};
