#include "\a3\3DEN\UI\macros.inc"
#include "\a3\3DEN\UI\resincl.inc"

class ctrlDefault;
class ctrlDefaultText;
class ctrlStatic;
class ctrlListNBox;
class ctrlTree;
class ctrlEdit;

class RscButtonMenu;
class RscText;
class RscPicture;

class Cfg3DEN {
    class Mission {
        class ADDON { // Custom section class, everything inside will be opened in one window (MySection)
            displayName = CSTRING(TAC_Autotest); // Text visible in the window title as "Edit <displayName>"
            class AttributeCategories {
                class PREFIX {
                    displayName = CSTRING(Autotest); // Category name visible in Edit Attributes window
                    class Attributes {
                        class missionName {
                            property = "missionName";
                            displayName = CSTRING(Name);
                            tooltip = CSTRING(NameDesc);
                            control = QGVAR(missionName);
                            defaultValue = "true";
                            condition = "true";
                        };
                        class missionDescription {
                            property = "missionDescription";
                            displayName = CSTRING(Description);
                            tooltip = CSTRING(DescriptionDesc);
                            control = QGVAR(missionDescription);
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
        class GVAR(missionName): Title {
            attributeLoad = QUOTE( \
                private _value = 'Scenario' get3DENMissionAttribute 'IntelBriefingName'; \
                (_this controlsGroupCtrl 100) ctrlSetText _value; \
                if (_value == '') then { \
                    (_this controlsGroupCtrl 101) ctrlSetText QUOTE(QPATHTOF(UI\error.paa)); \
                } else { \
                    (_this controlsGroupCtrl 101) ctrlSetText QUOTE(QPATHTOF(UI\pass.paa)); \
                };);
            attributeSave = "true";
            class Controls: Controls {
                class Title: Title {};
                class Value: ctrlEdit {
                    idc = 100;
                    type = CT_EDIT; // Type
                    colorBackground[] = {COLOR_OVERLAY_RGBA}; // Background color

                    text = ""; // Displayed text
                    colorText[] = {COLOR_TEXT_RGBA}; // Text and frame color
                    colorDisabled[] = {COLOR_TEXT_RGB, 0.25}; // Disabled text and frame color
                    colorSelection[] = {COLOR_ACTIVE_RGBA}; // Text selection color
                    canModify = 0; // True (1) to allow text editing, 0 to disable it
                    autocomplete = ""; // Text autocomplete, can be "scripting" (scripting commands) or "general" (previously typed text)
                    y = 0 * SIZE_M * GRID_H;
                    x = ATTRIBUTE_TITLE_W * GRID_W;
                    h = SIZE_M * GRID_H;
                    w = (ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W;

                };
                class Picture: RscPicture {
                    text = QPATHTOF(UI\pass.paa); // Default
                    idc = 101;
                    y = 0;
                    h = SIZE_M * GRID_H;
                    x = (ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W;
                    w = 1.25 * SIZE_M * GRID_W;
                };
            };
        };
        class GVAR(missionDescription): Title {
            attributeLoad = QUOTE( \
                private _value = 'Multiplayer' get3DENMissionAttribute 'IntelOverviewText'; \
                (_this controlsGroupCtrl 100) ctrlSetText _value; \
                if (_value == '' || {_value == '*** Insert mission description here. ***'}) then { \
                    (_this controlsGroupCtrl 101) ctrlSetText QUOTE(QPATHTOF(UI\error.paa)); \
                } else { \
                    (_this controlsGroupCtrl 101) ctrlSetText QUOTE(QPATHTOF(UI\pass.paa)); \
                };);
            attributeSave = "true";
            class Controls: Controls {
                class Title: Title {};
                class Value: ctrlEdit {
                    idc = 100;
                    type = CT_EDIT; // Type
                    colorBackground[] = {COLOR_OVERLAY_RGBA}; // Background color

                    text = ""; // Displayed text
                    colorText[] = {COLOR_TEXT_RGBA}; // Text and frame color
                    colorDisabled[] = {COLOR_TEXT_RGB, 0.25}; // Disabled text and frame color
                    colorSelection[] = {COLOR_ACTIVE_RGBA}; // Text selection color
                    canModify = 0; // True (1) to allow text editing, 0 to disable it
                    autocomplete = ""; // Text autocomplete, can be "scripting" (scripting commands) or "general" (previously typed text)
                    y = 0 * SIZE_M * GRID_H;
                    x = ATTRIBUTE_TITLE_W * GRID_W;
                    h = SIZE_M * GRID_H;
                    w = (ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W;

                };
                class Picture: RscPicture {
                    text = QPATHTOF(UI\pass.paa); // Default
                    idc = 101;
                    y = 0;
                    h = SIZE_M * GRID_H;
                    x = (ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W;
                    w = 1.25 * SIZE_M * GRID_W;
                };
            };
        };
        class GVAR(author): Title {
            attributeLoad = QUOTE( \
                private _value = 'Scenario' get3DENMissionAttribute 'Author'; \
                (_this controlsGroupCtrl 100) ctrlSetText _value; \
                if (_value find profileName  == -1) then { \
                    (_this controlsGroupCtrl 101) ctrlSetText QUOTE(QPATHTOF(UI\error.paa)); \
                } else { \
                    (_this controlsGroupCtrl 101) ctrlSetText QUOTE(QPATHTOF(UI\pass.paa)); \
                };);
            attributeSave = "true";
            class Controls: Controls {
                class Title: Title {};
                class Value: ctrlEdit {
                    idc = 100;
                    type = CT_EDIT; // Type
                    colorBackground[] = {COLOR_OVERLAY_RGBA}; // Background color

                    text = ""; // Displayed text
                    colorText[] = {COLOR_TEXT_RGBA}; // Text and frame color
                    colorDisabled[] = {COLOR_TEXT_RGB, 0.25}; // Disabled text and frame color
                    colorSelection[] = {COLOR_ACTIVE_RGBA}; // Text selection color
                    canModify = 0; // True (1) to allow text editing, 0 to disable it
                    autocomplete = ""; // Text autocomplete, can be "scripting" (scripting commands) or "general" (previously typed text)
                    y = 0 * SIZE_M * GRID_H;
                    x = ATTRIBUTE_TITLE_W * GRID_W;
                    h = SIZE_M * GRID_H;
                    w = (ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W;
                };
                class Picture: RscPicture {
                    text = QPATHTOF(UI\pass.paa); // Default
                    idc = 101;
                    x = (ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W;
                    w = 1.25 * SIZE_M * GRID_W;
                    h = SIZE_M * GRID_H;
                    y = 0;
                };
            };
        };
        class GVAR(minPlayers): Title {
            attributeLoad = QUOTE( \
                private _value = 'Multiplayer' get3DENMissionAttribute 'minplayers'; \
                private _playerCount = count playableUnits; \
                (_this controlsGroupCtrl 100) ctrlSetText (str _value); \
                if (_value >= 0 && {_value <= _playerCount}) then { \
                    (_this controlsGroupCtrl 101) ctrlSetText QUOTE(QPATHTOF(UI\pass.paa)); \
                } else { \
                    (_this controlsGroupCtrl 101) ctrlSetText QUOTE(QPATHTOF(UI\error.paa)); \
                };);
            attributeSave = "true";
            class Controls: Controls {
                class Title: Title {};
                class Value: ctrlEdit {
                    idc = 100;
                    type = CT_EDIT; // Type
                    colorBackground[] = {COLOR_OVERLAY_RGBA}; // Background color

                    text = ""; // Displayed text
                    colorText[] = {COLOR_TEXT_RGBA}; // Text and frame color
                    colorDisabled[] = {COLOR_TEXT_RGB, 0.25}; // Disabled text and frame color
                    colorSelection[] = {COLOR_ACTIVE_RGBA}; // Text selection color
                    canModify = 0; // True (1) to allow text editing, 0 to disable it
                    autocomplete = ""; // Text autocomplete, can be "scripting" (scripting commands) or "general" (previously typed text)
                    y = 0 * SIZE_M * GRID_H;
                    x = ATTRIBUTE_TITLE_W * GRID_W;
                    h = SIZE_M * GRID_H;
                    w = (ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W;
                };
                class Picture: RscPicture {
                    text = QPATHTOF(UI\pass.paa); // Default
                    idc = 101;
                    x = (ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W;
                    w = 1.25 * SIZE_M * GRID_W;
                    h = SIZE_M * GRID_H;
                    y = 0;
                };
            };
        };
        class GVAR(maxPlayers): Title {
            attributeLoad = QUOTE( \
                private _value = 'Multiplayer' get3DENMissionAttribute 'maxplayers'; \
                private _playerCount = count playableUnits; \
                (_this controlsGroupCtrl 100) ctrlSetText (str _value); \
                if (_value != _playerCount) then { \
                    (_this controlsGroupCtrl 101) ctrlSetText QUOTE(QPATHTOF(UI\error.paa)); \
                    (_this controlsGroupCtrl 100) ctrlSetText (format [ARR_4('%1 (%2: %3)',_value,localize QUOTE(LSTRING(ShouldBe)),_playerCount)]); \
                } else { \
                    (_this controlsGroupCtrl 101) ctrlSetText QUOTE(QPATHTOF(UI\pass.paa)); \
                };);
            attributeSave = "true";
            class Controls: Controls {
                class Title: Title {};
                class Value: ctrlEdit {
                    idc = 100;
                    type = CT_EDIT; // Type
                    colorBackground[] = {COLOR_OVERLAY_RGBA}; // Background color

                    text = ""; // Displayed text
                    colorText[] = {COLOR_TEXT_RGBA}; // Text and frame color
                    colorDisabled[] = {COLOR_TEXT_RGB, 0.25}; // Disabled text and frame color
                    colorSelection[] = {COLOR_ACTIVE_RGBA}; // Text selection color
                    canModify = 0; // True (1) to allow text editing, 0 to disable it
                    autocomplete = ""; // Text autocomplete, can be "scripting" (scripting commands) or "general" (previously typed text)
                    y = 0 * SIZE_M * GRID_H;
                    x = ATTRIBUTE_TITLE_W * GRID_W;
                    h = SIZE_M * GRID_H;
                    w = (ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W;
                };
                class Picture: RscPicture {
                    text = QPATHTOF(UI\pass.paa); // Default
                    idc = 101;
                    x = (ATTRIBUTE_TITLE_W+ATTRIBUTE_CONTENT_W - (1.5 * SIZE_M)) * GRID_W;
                    w = 1.25 * SIZE_M * GRID_W;
                    h = SIZE_M * GRID_H;
                    y = 0;
                };
            };
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
                    w = ATTRIBUTE_TITLE_W * GRID_W;
                    x = SIZE_M * GRID_H;
                    h = 1 * SIZE_M * GRID_H;
                    y = 0;
                    colorBackground[] = {0, 0, 0, 0};
                };
                class ActionListBackground: ctrlStatic {
                    idc = -1;
                    x = SIZE_M * GRID_H;
                    y = 1 * SIZE_M * GRID_H;
                    w = ((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W) - (2 * SIZE_M)) * GRID_W;
                    h = 23 * SIZE_M * GRID_H;
                    colorBackground[] = {0.33, 0.33, 0.33, 1};
                };
                class ActionList: ctrlListNBox {
                    idc = 101;
                    x = SIZE_M * GRID_H;
                    y = 1 * SIZE_M * GRID_H;
                    w = ((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W) - (2 * SIZE_M) ) * GRID_W;
                    h = 23 * SIZE_M * GRID_H;
                    drawSideArrows = 0;
                    idcLeft = -1;
                    idcRight = -1;
                    columns[] = {COLUMN_SIZE};
                    disableOverflow = 1;
                };
            };
        };
    };
};
