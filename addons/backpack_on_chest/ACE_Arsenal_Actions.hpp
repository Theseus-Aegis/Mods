class ace_arsenal_actions {
    class ADDON {
        displayName = CSTRING(DisplayName);
        condition = QUOTE((_this select 0) call FUNC(canMovePack) && {backpack (_this select 0) != '' || {(_this select 0) call FUNC(chestpack) != ''}});
        scopeEditor = 0;
        tabs[] = {5};
        class GVAR(chestpack) {
            condition = QUOTE((_this select 0) call FUNC(chestpack) != '');
            textStatement = QUOTE(getText (configFile >> 'CfgVehicles' >> (_this select 0) call FUNC(chestpack) >> 'displayName'));
        };
        class GVAR(onChest) {
            label = CSTRING(OnChest);
            condition = QUOTE((_this select 0) call FUNC(canMovePack) && {backpack (_this select 0) != ''} && {(_this select 0) call FUNC(chestpack) == ''});
            statement = QUOTE((_this select 0) call FUNC(actionOnChest));
        };
        class GVAR(onBack) {
            label = CSTRING(OnBack);
            condition = QUOTE((_this select 0) call FUNC(canMovePack) && {backpack (_this select 0) == ''} && {(_this select 0) call FUNC(chestpack) != ''});
            statement = QUOTE((_this select 0) call FUNC(actionOnBack));
        };
        class GVAR(swap) {
            label = CSTRING(Swap);
            condition = QUOTE((_this select 0) call FUNC(canMovePack) && {backpack (_this select 0) != ''} && {(_this select 0) call FUNC(chestpack) != ''});
            statement = QUOTE((_this select 0) call FUNC(actionSwap));
        };
    };
};
