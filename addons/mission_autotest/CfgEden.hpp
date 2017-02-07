#include "\a3\3den\ui\macros.inc"
#include "\a3\3den\ui\resincl.inc"

class ctrlDefault;
class ctrlDefaultText;
class ctrlStatic;
class ctrlListNBox;
class ctrlTree;
class ctrlEdit;

class RscButtonMenu;
class RscText;
class RscPicture;

#define ATTRIBUTE_CONTROLS \
    class Controls: Controls { \
        class Title: Title {}; \
        class Value: ctrlEdit { \
            idc = CTRL_VALUE; \
            type = CT_EDIT; \
            colorBackground[] = {COLOR_OVERLAY_RGBA}; \
            text = ""; \
            colorText[] = {COLOR_TEXT_RGBA}; \
            colorDisabled[] = {COLOR_TEXT_RGB, 0.25}; \
            colorSelection[] = {COLOR_ACTIVE_RGBA}; \
            canModify = 0; \
            autocomplete = ""; \
            x = ATTRIBUTE_TITLE_W * GRID_W; \
            y = 0 * SIZE_M * GRID_H; \
            w = (ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W; \
            h = SIZE_M * GRID_H; \
        }; \
        class Picture: RscPicture { \
            text = QPATHTOF(UI\pass.paa); \
            idc = CTRL_PICTURE; \
            x = (ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W; \
            y = 0; \
            w = SIZE_M * GRID_W; \
            h = SIZE_M * GRID_H; \
        }; \
    };


class Cfg3DEN {
    class Mission {
        class ADDON { // Custom section class, everything inside will be opened in one window (MySection)
            displayName = CSTRING(TAC_Autotest); // Text visible in the window title as "Edit <displayName>"
            class AttributeCategories {
                class PREFIX {
                    displayName = CSTRING(Autotest); // Category name visible in Edit Attributes window
                    class Attributes {
                        class name {
                            property = "missionName";
                            displayName = CSTRING(Name);
                            tooltip = CSTRING(NameDesc);
                            control = QGVAR(name);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class description {
                            property = "missionDescription";
                            displayName = CSTRING(Description);
                            tooltip = CSTRING(DescriptionDesc);
                            control = QGVAR(description);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class gameType {
                            property = "gameType";
                            displayName = CSTRING(GameType);
                            tooltip = CSTRING(GameTypeDesc);
                            control = QGVAR(gameType);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class author {
                            property = "author";
                            displayName = CSTRING(Author);
                            tooltip = CSTRING(AuthorDesc);
                            control = QGVAR(author);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class minPlayers {
                            property = "minPlayers";
                            displayName = CSTRING(MinPlayers);
                            tooltip = CSTRING(MinPlayersDesc);
                            control = QGVAR(minPlayers);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class maxPlayers {
                            property = "maxPlayers";
                            displayName = CSTRING(MaxPlayers);
                            tooltip = CSTRING(MaxPlayersDesc);
                            control = QGVAR(maxPlayers);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class hcAmount {
                            property = "hcAmount";
                            displayName = CSTRING(HCAmount);
                            tooltip = CSTRING(HCAmountDesc);
                            control = QGVAR(hcAmount);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class aiAmount {
                            property = "aiAmount";
                            displayName = CSTRING(AIAmount);
                            tooltip = CSTRING(AIAmountDesc);
                            control = QGVAR(aiAmount);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class respawnMode {
                            property = "respawnMode";
                            displayName = CSTRING(RespawnMode);
                            tooltip = CSTRING(RespawnModeDesc);
                            control = QGVAR(respawnMode);
                            defaultValue = "true";
                        };
                        class respawnButton {
                            property = "respawnButton";
                            displayName = CSTRING(RespawnButton);
                            tooltip = CSTRING(RespawnButtonDesc);
                            control = QGVAR(respawnButton);
                            defaultValue = "true";
                        };
                        class respawnDelay {
                            property = "respawnDelay";
                            displayName = CSTRING(RespawnDelay);
                            tooltip = CSTRING(RespawnDelayDesc);
                            control = QGVAR(respawnDelay);
                            defaultValue = "true";
                        };
                        class respawnDialog {
                            property = "respawnDialog";
                            displayName = CSTRING(RespawnDialog);
                            tooltip = CSTRING(RespawnDialogDesc);
                            control = QGVAR(respawnDialog);
                            defaultValue = "true";
                        };
                        class aiPosession {
                            property = "aiPosession";
                            displayName = CSTRING(AIPosession);
                            tooltip = CSTRING(AIPosessionDesc);
                            control = QGVAR(aiPosession);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class debugConsole {
                            property = "debugConsole";
                            displayName = CSTRING(DebugConsole);
                            tooltip = CSTRING(DebugConsoleDesc);
                            control = QGVAR(debugConsole);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class apollo {
                            property = "apollo";
                            displayName = CSTRING(Apollo);
                            tooltip = CSTRING(ApolloDesc);
                            control = QGVAR(apollo);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class findings {
                            property = "findings";
                            displayName = "";
                            control = QGVAR(findings);
                            defaultValue = "true";
                            condition = "true";
                        };
                    };
                };
            };
        };
    };

    class Attributes {
        class Default;
        class Title: Default {
            class Controls {
                class Title;
            };
        };
        class GVAR(name): Title {
            attributeLoad = QUOTE(_this call FUNC(testName));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(description): Title {
            attributeLoad = QUOTE(_this call FUNC(testDescription));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(gameType): Title {
            attributeLoad = QUOTE(_this call FUNC(testGameType));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(author): Title {
            attributeLoad = QUOTE(_this call FUNC(testAuthor));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(minPlayers): Title {
            attributeLoad = QUOTE(_this call FUNC(testMinPlayers));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(maxPlayers): Title {
            attributeLoad = QUOTE(_this call FUNC(testMaxPlayers));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(hcAmount): Title {
            attributeLoad = QUOTE(_this call FUNC(testHCAmount));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(aiAmount): Title {
            attributeLoad = QUOTE(_this call FUNC(testAIAmount));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(respawnMode): Title {
            attributeLoad = QUOTE(_this call FUNC(testRespawnMode));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(respawnButton): Title {
            attributeLoad = QUOTE(_this call FUNC(testRespawnButton));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(respawnDelay): Title {
            attributeLoad = QUOTE(_this call FUNC(testRespawnDelay));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(respawnDialog): Title {
            attributeLoad = QUOTE(_this call FUNC(testRespawnDialog));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(aiPosession): Title {
            attributeLoad = QUOTE(_this call FUNC(testAIPosession));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(debugConsole): Title {
            attributeLoad = QUOTE(_this call FUNC(testDebugConsole));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };
        class GVAR(apollo): Title {
            attributeLoad = QUOTE(_this call FUNC(testApollo));
            attributeSave = "true";
            ATTRIBUTE_CONTROLS
        };

        class Toolbox;
        class GVAR(findings): Toolbox {
            attributeLoad = QUOTE(_this call FUNC(autotest));
            attributeSave = "true";

            w = (ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W) * GRID_W;
            h = 24 * SIZE_M * GRID_H;
            class Controls {
                class ActionTitle: ctrlStatic {
                    text = CSTRING(Findings);
                    tooltip = "";
                    x = SIZE_M * GRID_H;
                    y = 0;
                    w = ATTRIBUTE_TITLE_W * GRID_W;
                    h = 1 * SIZE_M * GRID_H;
                    colorBackground[] = {0, 0, 0, 0};
                };
                class ActionListBackground: ctrlStatic {
                    idc = -1;
                    x = SIZE_M * GRID_H;
                    y = 1 * SIZE_M * GRID_H;
                    h = 23 * SIZE_M * GRID_H;
                    w = ((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W) - (2 * SIZE_M)) * GRID_W;
                    colorBackground[] = {0.33, 0.33, 0.33, 1};
                };
                class ActionList: ctrlListNBox {
                    idc = CTRL_PICTURE;
                    x = SIZE_M * GRID_H;
                    y = 1 * SIZE_M * GRID_H;
                    h = 23 * SIZE_M * GRID_H;
                    w = ((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W) - (2 * SIZE_M) ) * GRID_W;
                    drawSideArrows = 0;
                    idcLeft = -1;
                    idcRight = -1;
                    columns[] = {FINDINGS_COLUMN_SIZE};
                    disableOverflow = 1;
                };
            };
        };
    };
};
