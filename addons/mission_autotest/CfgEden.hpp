// a3\3den\ui\macros.inc
#define pixelScale 0.50

#define GRID_W (pixelW * pixelGrid * pixelScale)
#define GRID_H (pixelH * pixelGrid * pixelScale)

#define SIZE_M 5

#define ATTRIBUTE_TITLE_W 48
#define ATTRIBUTE_CONTENT_W 82

#define COLOR_TEXT_RGB 1, 1, 1
#define COLOR_TEXT_RGBA COLOR_TEXT_RGB, 1

#define COLOR_OVERLAY_RGB 0, 0, 0
#define COLOR_OVERLAY_RGBA COLOR_OVERLAY_RGB, 0.5

#define COLOR_ACTIVE_RGB_R "(profilenamespace getvariable ['GUI_BCG_RGB_R', 0.77])"
#define COLOR_ACTIVE_RGB_G "(profilenamespace getvariable ['GUI_BCG_RGB_G', 0.51])"
#define COLOR_ACTIVE_RGB_B "(profilenamespace getvariable ['GUI_BCG_RGB_B', 0.08])"
#define COLOR_ACTIVE_RGB_A 1
#define COLOR_ACTIVE_RGB COLOR_ACTIVE_RGB_R, COLOR_ACTIVE_RGB_G, COLOR_ACTIVE_RGB_B
#define COLOR_ACTIVE_RGBA COLOR_ACTIVE_RGB,COLOR_ACTIVE_RGB_A

// a3\3den\ui\resincl.inc
#define CT_EDIT 2


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
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W); \
            y = QUOTE(0 * SIZE_M * GRID_H); \
            w = QUOTE((ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W); \
            h = QUOTE(SIZE_M * GRID_H); \
        }; \
        class Picture: RscPicture { \
            text = QPATHTOF(UI\pass.paa); \
            idc = CTRL_PICTURE; \
            x = QUOTE((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W); \
            y = QUOTE(0); \
            w = QUOTE(SIZE_M * GRID_W); \
            h = QUOTE(SIZE_M * GRID_H); \
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
                        };
                        class description {
                            property = "missionDescription";
                            displayName = CSTRING(Description);
                            tooltip = CSTRING(DescriptionDesc);
                            control = QGVAR(description);
                            defaultValue = "true";
                        };
                        class gameType {
                            property = "gameType";
                            displayName = CSTRING(GameType);
                            tooltip = CSTRING(GameTypeDesc);
                            control = QGVAR(gameType);
                            defaultValue = "true";
                        };
                        class author {
                            property = "author";
                            displayName = CSTRING(Author);
                            tooltip = CSTRING(AuthorDesc);
                            control = QGVAR(author);
                            defaultValue = "true";
                        };
                        class minPlayers {
                            property = "minPlayers";
                            displayName = CSTRING(MinPlayers);
                            tooltip = CSTRING(MinPlayersDesc);
                            control = QGVAR(minPlayers);
                            defaultValue = "true";
                        };
                        class maxPlayers {
                            property = "maxPlayers";
                            displayName = CSTRING(MaxPlayers);
                            tooltip = CSTRING(MaxPlayersDesc);
                            control = QGVAR(maxPlayers);
                            defaultValue = "true";
                        };
                        class hcAmount {
                            property = "hcAmount";
                            displayName = CSTRING(HCAmount);
                            tooltip = CSTRING(HCAmountDesc);
                            control = QGVAR(hcAmount);
                            defaultValue = "true";
                        };
                        class aiAmount {
                            property = "aiAmount";
                            displayName = CSTRING(AIAmount);
                            tooltip = CSTRING(AIAmountDesc);
                            control = QGVAR(aiAmount);
                            defaultValue = "true";
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
                        };
                        class debugConsole {
                            property = "debugConsole";
                            displayName = CSTRING(DebugConsole);
                            tooltip = CSTRING(DebugConsoleDesc);
                            control = QGVAR(debugConsole);
                            defaultValue = "true";
                        };
                        class targetDebug {
                            property = "targetDebug";
                            displayName = CSTRING(TargetDebug);
                            tooltip = CSTRING(TargetDebugDesc);
                            control = QGVAR(targetDebug);
                            defaultValue = "true";
                        };
                        class apollo {
                            property = "apollo";
                            displayName = CSTRING(Apollo);
                            tooltip = CSTRING(ApolloDesc);
                            control = QGVAR(apollo);
                            defaultValue = "true";
                        };
                        class findings {
                            property = "findings";
                            displayName = "";
                            control = QGVAR(findings);
                            defaultValue = "true";
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
        class GVAR(targetDebug): Title {
            attributeLoad = QUOTE(_this call FUNC(testTargetDebug));
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

            w = QUOTE((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W) * GRID_W);
            h = QUOTE(24 * SIZE_M * GRID_H);
            class Controls {
                class ActionTitle: ctrlStatic {
                    text = CSTRING(Findings);
                    tooltip = "";
                    x = QUOTE(SIZE_M * GRID_H);
                    y = QUOTE(0);
                    w = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
                    h = QUOTE(1 * SIZE_M * GRID_H);
                    colorBackground[] = {0, 0, 0, 0};
                };
                class ActionListBackground: ctrlStatic {
                    idc = -1;
                    x = QUOTE(SIZE_M * GRID_H);
                    y = QUOTE(1 * SIZE_M * GRID_H);
                    h = QUOTE(23 * SIZE_M * GRID_H);
                    w = QUOTE(((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W) - (2 * SIZE_M)) * GRID_W);
                    colorBackground[] = {0.33, 0.33, 0.33, 1};
                };
                class ActionList: ctrlListNBox {
                    idc = CTRL_PICTURE;
                    x = QUOTE(SIZE_M * GRID_H);
                    y = QUOTE(1 * SIZE_M * GRID_H);
                    h = QUOTE(23 * SIZE_M * GRID_H);
                    w = QUOTE(((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W) - (2 * SIZE_M) ) * GRID_W);
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
