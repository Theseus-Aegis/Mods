class CfgMainMenuSpotlight
{
    class JoinContractServer
    {
        text = CSTRING(contractsText);
        picture = QPATHTOF(ui\spotlight_theseus.paa);
        action = "private _passwordCache = profileNamespace getVariable ['cba_ui_ServerPasswords', [[], []]];  private _index = (_passwordCache select 0) find '213.239.214.39:2302';  private _password = (_passwordCache select 1) param [_index, ''];  connectToServer ['213.239.214.39', 2302, _password];";
        actionText = CSTRING(contractsActionText);
        condition = "true";
    };
    class JoinTrainingServer
    {
        text = CSTRING(trainingText);
        picture = QPATHTOF(ui\spotlight_theseus.paa);
        action = "private _passwordCache = profileNamespace getVariable ['cba_ui_ServerPasswords', [[], []]];  private _index = (_passwordCache select 0) find '213.239.214.39:2502';  private _password = (_passwordCache select 1) param [_index, ''];  connectToServer ['213.239.214.39', 2502, _password];";
        actionText = CSTRING(trainingActionText);
        condition = "true";
    };
};
