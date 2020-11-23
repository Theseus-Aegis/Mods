class CfgMainMenuSpotlight {
    class GVAR(joinContracts) {
        text = CSTRING(contractsText);
        picture = QPATHTOF(ui\spotlight_contracts.paa);
        action = '["213.239.214.39", 2302] call (uiNamespace getVariable QFUNC(joinServer))';
        actionText = CSTRING(contractsActionText);
        condition = "true";
    };
    class GVAR(joinTraining) {
        text = CSTRING(trainingText);
        picture = QPATHTOF(ui\spotlight_olympus.paa);
        action = '["213.239.214.39", 2502] call (uiNamespace getVariable QFUNC(joinServer))';
        actionText = CSTRING(trainingActionText);
        condition = "true";
    };

    delete ApexProtocol;
    delete BootCamp;
    delete EastWind;

    delete Orange_CampaignGerman;
    delete Orange_Showcase_IDAP;
    delete Orange_Showcase_LoW;
    delete Orange_Campaign;

    delete Showcase_TankDestroyers;

    delete Tacops_Campaign_03;
    delete Tacops_Campaign_02;
    delete Tacops_Campaign_01;

    delete Tanks_Campaign_01;

    delete OldMan;

    delete Contact_Campaign;

    delete gm_campaign_01;

    delete SP_FD14;
};
