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

#define PIC_X X_PART(11.15)
#define PIC_Y Y_PART(2.8)
#define PIC_W W_PART(8.5)
#define PIC_H H_PART(2.2)
#define BTN_Y PIC_Y
#define BTN_W PIC_W * 0.64
#define BTN_W_WIDE BTN_W * 1.5
#define BTN_H PIC_H

// Col 1
#define PIC_X_C1 PIC_X
#define BTN_X_C1 PIC_X_C1
// Col 2
#define PIC_X_C2 PIC_X + 0.24
#define BTN_X_C2 PIC_X_C2
// Col 3
#define PIC_X_C3 PIC_X + 0.36
#define BTN_X_C3 PIC_X_C3

// Offsets
#define OFFSET_Y_R2 0.11
#define OFFSET_Y_R3 0.215
#define OFFSET_Y_R4 0.32
#define OFFSET_Y_R5 0.425
#define OFFSET_Y_R6 0.53
#define OFFSET_Y_RE 0.77


// Type definitions
#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_COMBO 4
#define CT_LISTNBOX 102
// Style definitions
#define ST_MULTI 16
#define ST_PICTURE 48
#define ST_LEFT 0x00
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
    w = QUOTE(PIC_W);
    h = QUOTE(PIC_H);
};

class GVAR(RscButton) {
    idc = -1;
    type = CT_BUTTON;
    style = ST_PICTURE;
    colorText[] = {1, 1, 1, 0};
    colorFocused[] = {1, 1, 1, 0};
    colorDisabled[] = {1, 1, 1, 0};
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
    font = "RobotoCondensed";
    sizeEx = 0.02;
    text = "";
    w = QUOTE(BTN_W);
    h = QUOTE(BTN_H);
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
        class Title: GVAR(RscPicture) {
            idc = TITLE;
            x = QUOTE(X_PART(11.4));
            y = QUOTE(Y_PART(0.4));
            w = QUOTE(W_PART(16));
            h = QUOTE(H_PART(1.1));
        };

        // Dropdown Menu
        class Dropdown: GVAR(RscCombo) {
            idc = DROPDOWN;
            onLBSelChanged = QUOTE([GVAR(armoryData)] call FUNC(dialogControl_populateList));
            x = QUOTE(X_PART(10.3));
            y = QUOTE(Y_PART(2.3));
            w = QUOTE(W_PART(19.3));
            h = QUOTE(H_PART(1.3));
        };

        // Amount
        class Amount: GVAR(RscPicture) {
            idc = AMOUNT;
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

        // Exit-Back
        class Main_Pic_C1_RE: GVAR(RscPicture) {
            idc = BACKPIC;
            x = QUOTE(PIC_X_C1);
            y = QUOTE(PIC_Y + OFFSET_Y_RE);
        };
        class Main_Btn_C1_RE: GVAR(RscButton) {
            idc = BACKBTN;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y + OFFSET_Y_RE);
        };

        // Take-Stash
        class TakeStash_Pic_C1_R1: GVAR(RscPicture) {
            idc = TAKESTASHPIC;
            x = QUOTE(PIC_X_C3);
            y = QUOTE(PIC_Y + OFFSET_Y_RE);
        };
        class TakeStash_Btn_C1_R1: GVAR(RscButton) {
            idc = TAKESTASHBTN;
            x = QUOTE(BTN_X_C3);
            y = QUOTE(BTN_Y + OFFSET_Y_RE);
        };

        // MAIN MENU ONLY
        /* Column 1 */
        // Row 1
        class Main_Pic_C1_R1: GVAR(RscPicture) {
            idc = MAINPIC1;
            x = QUOTE(PIC_X_C1);
            y = QUOTE(PIC_Y);
        };
        class Main_Btn_C1_R1: GVAR(RscButton) {
            idc = MAINBTN1;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y);
        };

        // Row 2
        class Main_Pic_C1_R2: GVAR(RscPicture) {
            idc = MAINPIC2;
            x = QUOTE(PIC_X_C1);
            y = QUOTE(PIC_Y + OFFSET_Y_R2);
        };
        class Main_Btn_C1_R2: GVAR(RscButton) {
            idc = MAINBTN2;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y + OFFSET_Y_R2);
        };

        // Row 3
        class Main_Pic_C1_R3: GVAR(RscPicture) {
            idc = MAINPIC3;
            x = QUOTE(PIC_X_C1);
            y = QUOTE(PIC_Y + OFFSET_Y_R3);
        };
        class Main_Btn_C1_R3: GVAR(RscButton) {
            idc = MAINBTN3;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y + OFFSET_Y_R3);
        };

        // Row 4
        class Main_Pic_C1_R4: GVAR(RscPicture) {
            idc = MAINPIC4;
            x = QUOTE(PIC_X_C1);
            y = QUOTE(PIC_Y + OFFSET_Y_R4);
        };
        class Main_Btn_C1_R4: GVAR(RscButton) {
            idc = MAINBTN4;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y + OFFSET_Y_R4);
        };

        // Row 5
        class Main_Pic_C1_R5: GVAR(RscPicture) {
            idc = MAINPIC5;
            x = QUOTE(PIC_X_C1);
            y = QUOTE(PIC_Y + OFFSET_Y_R5);
        };
        class Main_Btn_C1_R5: GVAR(RscButton) {
            idc = MAINBTN5;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y + OFFSET_Y_R5);
        };

        // Row 6
        class Main_Pic_C1_R6: GVAR(RscPicture) {
            idc = MAINPIC6;
            x = QUOTE(PIC_X_C1);
            y = QUOTE(PIC_Y + OFFSET_Y_R6);
        };
        class Main_Btn_C1_R6: GVAR(RscButton) {
            idc = MAINBTN6;
            x = QUOTE(BTN_X_C1);
            y = QUOTE(BTN_Y + OFFSET_Y_R6);
        };

        /* Column 2 */
        // Row 1
        class Main_Pic_C2_R1: GVAR(RscPicture) {
            idc = MAINPIC7;
            x = QUOTE(PIC_X_C2);
            y = QUOTE(PIC_Y);
        };
        class Main_Btn_C2_R1: GVAR(RscButton) {
            idc = MAINBTN7;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y);
        };

        // Row 2
        class Main_Pic_C2_R2: GVAR(RscPicture) {
            idc = MAINPIC8;
            x = QUOTE(PIC_X_C2);
            y = QUOTE(PIC_Y + OFFSET_Y_R2);
        };
        class Main_Btn_C2_R2: GVAR(RscButton) {
            idc = MAINBTN8;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y + OFFSET_Y_R2);
        };

        // Row 3
        class Main_Pic_C2_R3: GVAR(RscPicture) {
            idc = MAINPIC9;
            x = QUOTE(PIC_X_C2);
            y = QUOTE(PIC_Y + OFFSET_Y_R3);
        };
        class Main_Btn_C2_R3: GVAR(RscButton) {
            idc = MAINBTN9;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y + OFFSET_Y_R3);
        };

        // Row 4
        class Main_Pic_C2_R4: GVAR(RscPicture) {
            idc = MAINPIC10;
            x = QUOTE(PIC_X_C2);
            y = QUOTE(PIC_Y + OFFSET_Y_R4);
        };
        class Main_Btn_C2_R4: GVAR(RscButton) {
            idc = MAINBTN10;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y + OFFSET_Y_R4);
        };

        // Row 5
        class Main_Pic_C2_R5: GVAR(RscPicture) {
            idc = MAINPIC11;
            x = QUOTE(PIC_X_C2);
            y = QUOTE(PIC_Y + OFFSET_Y_R5);
        };
        class Main_Btn_C2_R5: GVAR(RscButton) {
            idc = MAINBTN11;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y + OFFSET_Y_R5);
        };

        // Row 6
        class Main_Pic_C2_R6: GVAR(RscPicture) {
            idc = MAINPIC12;
            x = QUOTE(PIC_X_C2);
            y = QUOTE(PIC_Y + OFFSET_Y_R6);
        };
        class Main_Btn_C2_R6: GVAR(RscButton) {
            idc = MAINBTN12;
            x = QUOTE(BTN_X_C2);
            y = QUOTE(BTN_Y + OFFSET_Y_R6);
        };

        // PHYSICAL
        class Export_Pic: GVAR(RscPicture) {
            idc = EXPORTPIC;
            x = QUOTE(X_PART(30.5));
            y = QUOTE(Y_PART(3));
            w = QUOTE(W_PART(2));
            h = QUOTE(H_PART(2));
            text = QPATHTOF(UI\btnExport.paa);
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
        class CameraHint: GVAR(RscPicture) {
            idc = CAMERAHINT;
            x = QUOTE(safeZoneX);
            y = QUOTE(safeZoneY);
            text = QPATHTOF(UI\btnCamera.paa);
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
