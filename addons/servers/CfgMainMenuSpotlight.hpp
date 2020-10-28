class CfgMainMenuSpotlight {
    class GVAR(joinContracts) {
        text = CSTRING(contractsText);
        picture = QPATHTOF(ui\spotlight_theseus.paa);
        action = '["213.239.214.39", 2302] call (uiNamespace getVariable QFUNC(joinServer))';
        actionText = CSTRING(contractsActionText);
        condition = "true";
    };
    class GVAR(joinTraining) {
        text = CSTRING(trainingText);
        picture = QPATHTOF(ui\spotlight_theseus.paa);
        action = '["213.239.214.39", 2502] call (uiNamespace getVariable QFUNC(joinServer))';
        actionText = CSTRING(trainingActionText);
        condition = "true";
    };
};
