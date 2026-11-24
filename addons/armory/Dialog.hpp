// Size definitions
// Grid width (from aspect ratio, 1.2 clamp for the largest possible size)
#define SIZEX ((safeZoneW / safeZoneH) min 1.2)
// Grid height (from width)
#define SIZEY (SIZEX / 1.2)
// Split grid into 40 columns
#define W_PART(num) (num * (SIZEX / 40))
// Split grid into 25 rows
#define H_PART(num) (num * (SIZEY / 25))
// Translate by columns and find left of grid
#define X_PART(num) (W_PART(num) + (safeZoneX + (safeZoneW - SIZEX) / 2))
// Translate by rows and find top of grid
#define Y_PART(num) (H_PART(num) + (safeZoneY + (safeZoneH - SIZEY) / 2))

// The pad's screen grid (background.paa, 1024 px over 34 parts): a column every 40 px from 208 px across, a row every
// 20 px from 123 px down. Its lines are at GRID_X(0) to GRID_X(15) and GRID_Y(0) to GRID_Y(38).
#define PAD_PX(px) ((px) * 34 / 1024)
#define GRID_X(col) X_PART((3 + PAD_PX(208 + 40 * (col))))
#define GRID_Y(row) Y_PART((-4.5 + PAD_PX(123 + 20 * (row))))
#define GRID_W(cols) W_PART(PAD_PX(40 * (cols)))
#define GRID_H(rows) H_PART(PAD_PX(20 * (rows)))

// Buttons: 6 columns by 3 rows, in two columns a column in from the screen's edges and a column apart
#define BTN_W GRID_W(6)
#define BTN_H GRID_H(3)
#define BTN_X_C1 GRID_X(1)
#define BTN_X_C2 GRID_X(8)
// Main menu rows 1 to 6, every 4 rows from row 5
#define BTN_Y_R(num) GRID_Y((1 + 4 * (num)))
// Bottom row (Exit/Back, Take/Stash/Camera) and the one above it (Stash All, left of the amount)
#define BTN_Y_RE GRID_Y(34)
#define BTN_Y_RE2 GRID_Y(30)
// The camera icon: square, in the middle of its button
#define ICON_X(x) (x + (BTN_W - BTN_H) / 2)
#define ICON_W BTN_H

// Messages (FUNC(showMessage)): a panel over the list, with OK in the middle of its bottom
#define MSG_X GRID_X(1)
#define MSG_Y GRID_Y(8)
#define MSG_W GRID_W(13)
#define MSG_H GRID_H(21)
#define MSG_OK_X GRID_X(6)
#define MSG_OK_Y GRID_Y(25)
#define MSG_OK_W GRID_W(3)

// Text: Arma's 14-segment LCD font, black on the pad's screen, no shadow
#define TEXT_FONT "LCD14"
#define TEXT_COLOR {0, 0, 0, 0.9}
#define TEXT_COLOR_DISABLED {0, 0, 0, 0.4}
#define BTN_TEXT_SIZE H_PART(1.4)
#define TITLE_TEXT_SIZE H_PART(1.8)
#define LABEL_TEXT_SIZE H_PART(0.9)
// Messages: about 29 characters a line (their titles 1.33 times bigger, FUNC(showMessage))
#define MSG_TEXT_SIZE H_PART(1.2)

// Type definitions
#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_COMBO 4
#define CT_STRUCTURED_TEXT 13
#define CT_LISTNBOX 102
// Style definitions
#define ST_MULTI 16
#define ST_PICTURE 48
#define ST_LEFT 0x00
#define ST_VCENTER 0x0C
#define LB_TEXTURES 0x10

class ctrlStatic;

class GVAR(RscPicture) {
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    text = "";
    colorText[] = {1, 1, 1, 1};
    colorBackground[] = {1, 1, 1, 0};
    font = "RobotoCondensed";
    sizeEx = 0.02;
};

// Text on the pad's screen (titles, labels)
class GVAR(RscText) {
    idc = -1;
    type = CT_STATIC;
    style = ST_LEFT;
    text = "";
    colorText[] = TEXT_COLOR;
    colorBackground[] = {0, 0, 0, 0};
    font = TEXT_FONT;
    sizeEx = QUOTE(LABEL_TEXT_SIZE);
    shadow = 0;
};

// A button's frame: a 1 px rectangle in colorText, where its button is
class GVAR(RscFrame) {
    idc = -1;
    type = CT_STATIC;
    style = ST_FRAME;
    text = "";
    colorText[] = {0, 0, 0, 0.76};
    colorBackground[] = {0, 0, 0, 0};
    font = TEXT_FONT;
    sizeEx = QUOTE(H_PART(0.5));
    shadow = 0;
    w = QUOTE(BTN_W);
    h = QUOTE(BTN_H);
};

// Over its frame (GVAR(RscFrame)) or icon (GVAR(RscPicture)): the label as text, or none
class GVAR(RscButton) {
    idc = -1;
    type = CT_BUTTON;
    style = QUOTE(ST_LEFT + ST_VCENTER);
    colorText[] = TEXT_COLOR;
    colorFocused[] = TEXT_COLOR;
    colorDisabled[] = TEXT_COLOR_DISABLED;
    colorBackground[] = {1, 1, 1, 0};
    colorBackgroundDisabled[] = {0, 0, 0, 0};
    colorBackgroundActive[] = {0, 0, 0, 0.25};
    colorShadow[] = {0, 0, 0, 0};
    colorBorder[] = {0, 0, 0, 0};
    borderSize = 0;
    soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush", 0.09, 1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick", 0.09, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape", 0.09, 1};
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
    font = TEXT_FONT;
    sizeEx = QUOTE(BTN_TEXT_SIZE);
    shadow = 0;
    text = "";
    w = QUOTE(BTN_W);
    h = QUOTE(BTN_H);
};

// A message's text (FUNC(showMessage)): centred lines, the first one bigger
class GVAR(RscMessage) {
    idc = -1;
    type = CT_STRUCTURED_TEXT;
    style = 0;
    text = "";
    size = QUOTE(MSG_TEXT_SIZE);
    colorBackground[] = {0, 0, 0, 0};
    shadow = 0;
    class Attributes {
        font = TEXT_FONT;
        color = "#e6000000";
        align = "center";
        valign = "middle";
        shadow = 0;
        size = 1;
    };
};

class GVAR(RscCombo) {
    idc = -1;
    type = CT_COMBO;
    style = QUOTE(ST_LEFT + LB_TEXTURES);
    font = "RobotoCondensed";
    sizeEx = 0.04;
    shadow = 0;
    colorText[] = {0, 0, 0, 1};
    colorDisabled[] = {0, 0, 0, 0.25};
    colorBackground[] = {0.5, 0.5, 0.4, 1};
    colorSelect[] = {0, 0, 0, 1};
    colorSelectBackground[] = {0.8, 0.8, 0.8, 0.75};
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1, 1};
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1, 1};
    soundSelect[] = {"\a3\ui_f\data\Sound\RscListbox\soundSelect", 0.09, 1};
    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
    wholeHeight = QUOTE(safeZoneH * 0.3);
    maxHistoryDelay = 1;
    class ComboScrollBar {
        color[] = {1, 1, 1, 0.6};
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    };
};

class GVAR(RscListNBox) {
    idc = -1;
    type = CT_LISTNBOX;
    style = ST_MULTI;
    font = "RobotoCondensed";
    sizeEx = 0.04;
    colorText[] = {0, 0, 0, 1};
    colorDisabled[] = {0, 0, 0, 0.25};
    colorSelect[] = {0, 0, 0, 1};
    colorSelectBackground[] = {0.8, 0.8, 0.8, 1};
    colorSelectBackground2[] = {1, 1, 1, 0.5};
    soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect", 0.09, 1};
    maxHistoryDelay = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    drawSideArrows = 0;
    idcLeft = -1;
    idcRight = -1;
    rowHeight = 0.051;
    columns[] = {0.02, 0.17, 0.8};
    class ListScrollBar {
        color[] = {1, 1, 1, 0.6};
        colorActive[] = {1, 1, 1, 1};
        colorDisabled[] = {1, 1, 1, 0.3};
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    };
};


class GVAR(Display) {
    idd = DISPLAYID;
    movingEnable = 1;
    onUnload = QUOTE(call FUNC(closeArmory));
    onKeyDown = QUOTE(_this call FUNC(onKeyDown));
    onMouseButtonDown = QUOTE([ARR_3('onMouseButtonDown',_this,QQGVAR(Display))] call ACEFUNC(arsenal,onMouseButtonDown));
    onMouseButtonUp = QUOTE([ARR_3('onMouseButtonUp',_this,QQGVAR(Display))] call ACEFUNC(arsenal,onMouseButtonUp));
    class controlsBackground {
        class BackgroundPic: GVAR(RscPicture) {
            idc = BACKGROUND;
            moving = 1;
            x = QUOTE(X_PART(3));
            y = QUOTE(Y_PART(-4.5));
            w = QUOTE(W_PART(34));
            h = QUOTE(H_PART(34));
            text = QPATHTOF(UI\background.paa);
        };
        class CameraArea: ctrlStatic {
            idc = CAMERAAREA;
            style = 16;
            onMouseMoving = QUOTE([ARR_3('onMouseMoving',_this,GVAR(Display))] call ACEFUNC(arsenal,handleMouse));
            onMouseHolding = QUOTE([ARR_3('onMouseHolding',_this,GVAR(Display))] call ACEFUNC(arsenal,handleMouse));
            onMouseZChanged = QUOTE([ARR_3('onMouseZChanged',_this,GVAR(Display))] call ACEFUNC(arsenal,handleScrollWheel));
            x = QUOTE(safeZoneX);
            y = QUOTE(safeZoneY);
            w = QUOTE(safeZoneW);
            h = QUOTE(safeZoneH);
        };
    };
    class controls {
        // Title
        class Title: GVAR(RscText) {
            idc = TITLE;
            sizeEx = QUOTE(TITLE_TEXT_SIZE);
            x = QUOTE(GRID_X(1));
            y = QUOTE(GRID_Y(1));
            w = QUOTE(GRID_W(13));
            h = QUOTE(GRID_H(3));
        };

        // Dropdown Menu
        class Dropdown: GVAR(RscCombo) {
            idc = DROPDOWN;
            onLBSelChanged = QUOTE(call FUNC(dialogControl_dropdown));
            x = QUOTE(X_PART(10.3));
            y = QUOTE(Y_PART(2.3));
            w = QUOTE(W_PART(19.3));
            h = QUOTE(H_PART(1.3));
        };

        // Amount
        class Amount: GVAR(RscText) {
            idc = AMOUNT;
            text = CSTRING(Amount);
            x = QUOTE(X_PART(25));
            y = QUOTE(Y_PART(3.9));
            w = QUOTE(W_PART(4));
            h = QUOTE(H_PART(1.1));
        };

        // List
        class List: GVAR(RscListNBox) {
            idc = NLIST;
            onLBSelChanged  = QUOTE(call FUNC(dialogControl_amountSelection); call FUNC(dialogControl_takestash));
            x = QUOTE(X_PART(10));
            y = QUOTE(Y_PART(5));
            w = QUOTE(W_PART(20));
            h = QUOTE(H_PART(14));
        };

        // Dropdown Amount Selection
        class DropdownAmount: GVAR(RscCombo) {
            idc = DROPDOWNAMOUNT;
            onLBSelChanged = QUOTE(call FUNC(dialogControl_takestash));
            x = QUOTE(X_PART(24.6));
            y = QUOTE(Y_PART(20.2));
            w = QUOTE(W_PART(3.9));
            h = QUOTE(H_PART(1.3));
        };

        // Message (over the list, FUNC(showMessage))
        class Message_Frame: GVAR(RscFrame) {
            idc = MESSAGEFRAME;
            x = QUOTE(MSG_X);
            y = QUOTE(MSG_Y);
            w = QUOTE(MSG_W);
            h = QUOTE(MSG_H);
        };
        class Message_Text: GVAR(RscMessage) {
            idc = MESSAGETEXT;
            x = QUOTE(MSG_X + GRID_W(0.5));
            y = QUOTE(MSG_Y);
            w = QUOTE(MSG_W - GRID_W(1));
            h = QUOTE(MSG_H);
        };
        class Message_Ok_Frame: GVAR(RscFrame) {
            idc = MESSAGEOKFRAME;
            x = QUOTE(MSG_OK_X);
            y = QUOTE(MSG_OK_Y);
            w = QUOTE(MSG_OK_W);
        };
        class Message_Ok_Btn: GVAR(RscButton) {
            idc = MESSAGEOKBTN;
            onMouseButtonClick = QUOTE(call FUNC(dismissMessage));
            text = CSTRING(BtnOk);
            x = QUOTE(MSG_OK_X);
            y = QUOTE(MSG_OK_Y);
            w = QUOTE(MSG_OK_W);
        };

        // Exit-Back
        class Main_Frame_C1_RE: GVAR(RscFrame) {
            idc = BACKFRAME;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_RE);
        };
        class Main_Btn_C1_RE: GVAR(RscButton) {
            idc = BACKBTN;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_RE);
        };

        // Take-Stash
        class TakeStash_Frame_C1_R1: GVAR(RscFrame) {
            idc = TAKESTASHFRAME;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_RE);
        };
        // Camera (main menu, under the Take/Stash button)
        class Camera_Pic: GVAR(RscPicture) {
            idc = CAMERAPIC;
            x = QUOTE(ICON_X(BTN_X_C2));
            y = QUOTE(BTN_Y_RE);
            w = QUOTE(ICON_W);
            h = QUOTE(ICON_W);
            text = QPATHTOF(UI\iconCamera.paa);
        };
        class TakeStash_Btn_C1_R1: GVAR(RscButton) {
            idc = TAKESTASHBTN;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_RE);
        };

        // Stash All
        class StashAll_Frame_C1_RE2: GVAR(RscFrame) {
            idc = STASHALLFRAME;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_RE2);
        };
        class StashAll_Btn_C1_RE2: GVAR(RscButton) {
            idc = STASHALLBTN;
            onMouseButtonClick = QUOTE(call FUNC(stashAll));
            text = CSTRING(BtnStashAll);
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_RE2);
            tooltip = CSTRING(BtnStashAllTooltip);
        };

        // MAIN MENU ONLY
        /* Column 1 */
        // Row 1
        class Main_Frame_C1_R1: GVAR(RscFrame) {
            idc = MAINFRAME1;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(1));
        };
        class Main_Btn_C1_R1: GVAR(RscButton) {
            idc = MAINBTN1;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(1));
        };

        // Row 2
        class Main_Frame_C1_R2: GVAR(RscFrame) {
            idc = MAINFRAME2;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(2));
        };
        class Main_Btn_C1_R2: GVAR(RscButton) {
            idc = MAINBTN2;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(2));
        };

        // Row 3
        class Main_Frame_C1_R3: GVAR(RscFrame) {
            idc = MAINFRAME3;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(3));
        };
        class Main_Btn_C1_R3: GVAR(RscButton) {
            idc = MAINBTN3;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(3));
        };

        // Row 4
        class Main_Frame_C1_R4: GVAR(RscFrame) {
            idc = MAINFRAME4;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(4));
        };
        class Main_Btn_C1_R4: GVAR(RscButton) {
            idc = MAINBTN4;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(4));
        };

        // Row 5
        class Main_Frame_C1_R5: GVAR(RscFrame) {
            idc = MAINFRAME5;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(5));
        };
        class Main_Btn_C1_R5: GVAR(RscButton) {
            idc = MAINBTN5;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(5));
        };

        // Row 6
        class Main_Frame_C1_R6: GVAR(RscFrame) {
            idc = MAINFRAME6;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(6));
        };
        class Main_Btn_C1_R6: GVAR(RscButton) {
            idc = MAINBTN6;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y_R(6));
        };

        /* Column 2 */
        // Row 1
        class Main_Frame_C2_R1: GVAR(RscFrame) {
            idc = MAINFRAME7;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(1));
        };
        class Main_Btn_C2_R1: GVAR(RscButton) {
            idc = MAINBTN7;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(1));
        };

        // Row 2
        class Main_Frame_C2_R2: GVAR(RscFrame) {
            idc = MAINFRAME8;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(2));
        };
        class Main_Btn_C2_R2: GVAR(RscButton) {
            idc = MAINBTN8;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(2));
        };

        // Row 3
        class Main_Frame_C2_R3: GVAR(RscFrame) {
            idc = MAINFRAME9;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(3));
        };
        class Main_Btn_C2_R3: GVAR(RscButton) {
            idc = MAINBTN9;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(3));
        };

        // Row 4
        class Main_Frame_C2_R4: GVAR(RscFrame) {
            idc = MAINFRAME10;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(4));
        };
        class Main_Btn_C2_R4: GVAR(RscButton) {
            idc = MAINBTN10;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(4));
        };

        // Row 5
        class Main_Frame_C2_R5: GVAR(RscFrame) {
            idc = MAINFRAME11;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(5));
        };
        class Main_Btn_C2_R5: GVAR(RscButton) {
            idc = MAINBTN11;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(5));
        };

        // Row 6
        class Main_Frame_C2_R6: GVAR(RscFrame) {
            idc = MAINFRAME12;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(6));
        };
        class Main_Btn_C2_R6: GVAR(RscButton) {
            idc = MAINBTN12;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y_R(6));
        };

        // PHYSICAL
        class Export_Pic: GVAR(RscPicture) {
            idc = EXPORTPIC;
            x = QUOTE(X_PART(30.5));
            y = QUOTE(Y_PART(3));
            w = QUOTE(W_PART(2));
            h = QUOTE(H_PART(2));
            text = QPATHTOF(UI\iconExport.paa);
        };
        class Export_Btn: GVAR(RscButton) {
            idc = EXPORTBTN;
            onMouseButtonClick = QUOTE(call FUNC(exportLoadout));
            x = QUOTE(X_PART(30.5));
            y = QUOTE(Y_PART(3));
            w = QUOTE(W_PART(2));
            h = QUOTE(H_PART(2));
            tooltip = CSTRING(BtnExportTooltip);
        };

        // CAMERA
        class CameraFrame: GVAR(RscFrame) {
            idc = CAMERAFRAME;
            x = QUOTE(safeZoneX);
            y = QUOTE(safeZoneY);
        };
        class CameraHint: GVAR(RscPicture) {
            idc = CAMERAHINT;
            x = QUOTE(ICON_X(safeZoneX));
            y = QUOTE(safeZoneY);
            w = QUOTE(ICON_W);
            h = QUOTE(ICON_W);
            text = QPATHTOF(UI\iconCamera.paa);
        };
        class CameraExit: GVAR(RscButton) {
            idc = CAMERAEXIT;
            onMouseButtonClick = QUOTE(call FUNC(closeCamera));
            x = QUOTE(safeZoneX);
            y = QUOTE(safeZoneY);
            tooltip = CSTRING(BtnCloseCameraTooltip);
        };
    };
};
