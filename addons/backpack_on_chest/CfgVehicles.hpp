class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(onChest) {
                    displayName = CSTRING(OnChest);
                    condition = QUOTE([_player] call FUNC(canMovePack) && {!(backpack _player isEqualTo '') && (([_player] call FUNC(chestpack)) isEqualTo '')});
                    exceptions[] = {"isNotInside"};
                    statement = QUOTE([_player] call FUNC(actionOnChest));
                    showDisabled = 0;
                    priority = 2.5;
                    icon = QPATHTOF(ui\onchest_ca.paa);
                };
                class GVAR(onBack) : GVAR(onChest) {
                    displayName = CSTRING(OnBack);
                    condition = QUOTE([_player] call FUNC(canMovePack) && {(backpack _player isEqualTo '') && !(([_player] call FUNC(chestpack)) isEqualTo '')});
                    statement = QUOTE([_player] call FUNC(actionOnBack));
                    icon = QPATHTOF(ui\onback_ca.paa);
                };
                class GVAR(swap) : GVAR(onChest) {
                    displayName = CSTRING(Swap);
                    condition = QUOTE([_player] call FUNC(canMovePack) && {!(backpack _player isEqualTo '') && !(([_player] call FUNC(chestpack)) isEqualTo '')});
                    statement = QUOTE([_player] call FUNC(actionSwap));
                    icon = QPATHTOF(ui\swap_ca.paa);
                };
                class GVAR(lower) : GVAR(onChest) {
                    displayName = CSTRING(lower);
                    condition = QUOTE([_player] call FUNC(canLower));
                    statement = QUOTE([_player] call FUNC(actionLower));
                };
                class GVAR(cutLoweringLine) : GVAR(onChest) {
                    displayName = CSTRING(cutLoweringLine);
                    condition = QUOTE([_player] call FUNC(canCutLoweringLine));
                    statement = QUOTE([_player] call FUNC(actionCutLoweringLine));
                };
            };
        };
    };
};
