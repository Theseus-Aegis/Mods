// Size ddefinitions
// Base
#define TITLE_X safezoneX + 0.3925 * safezoneW
#define TITLE_Y safezoneY + 0.233 * safezoneH
#define TITLE_W safezoneW * 0.20
#define TITLE_H safezoneH * 0.023

#define PIC_X 0.235
#define PIC_Y 0.115
#define BTN_Y PIC_Y
#define BTN_W_WIDE BTN_W * 1.5

#define TEXTPIC_X PIC_X + 0.41
#define TEXTPIC_Y PIC_Y + 0.04
#define TEXTPIC_W safezoneW * 0.045
#define TEXTPIC_H safezoneH * 0.023

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

// Size definitions
#define PIC_W safezoneW * 0.105
#define PIC_H safezoneH * 0.047
#define BTN_W PIC_W * 0.64
#define BTN_H PIC_H

class GVAR(RscPicture) {
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    text = "";
    colorText[] = {1, 1, 1, 1};
    colorBackground[] = {1, 1, 1, 0};
    font = "PuristaMedium";
    sizeEx = 0.02;
    w = PIC_W;
    h = PIC_H;
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
    font = "PuristaMedium";
    sizeEx = 0.02;
    text = "";
    w = BTN_W;
    h = BTN_H;
};

class GVAR(RscCombo) {
    idc = -1;
    type = CT_COMBO;
    style = ST_LEFT + LB_TEXTURES;
    font = "PuristaMedium";
    sizeEx = "0.04";
    shadow = 0;
    colorText[] = {0, 0, 0, 1};
	colorDisabled[] = {0, 0, 0, 0.25};
    colorBackground[] = {0.5, 0.5, 0.4, 1};
    colorSelect[] = {0, 0, 0, 1};
    colorSelectBackground[] = {0.8, 0.8, 0.8, 0.75};
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1, 1};
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1, 1};
    soundSelect[] = {"\a3\ui_f\data\Sound\RscListbox\soundSelect", 0.09, 1};
    x = PIC_X - 0.03;
    y = PIC_Y - 0.03;
    w = safezoneW * 0.245;
    h = safezoneH * 0.03;
    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
    wholeHeight = safezoneH * 0.3;
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
    font = "PuristaMedium";
    sizeEx = "0.04";
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
    rowHeight = 0.05;
    columns[] = {0, 0.18, 0.8};
    x = PIC_X - 0.03;
    y = PIC_Y + 0.08;
    w = safezoneW * 0.245;
    h = safezoneH * 0.3;
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
    class controlsBackground {
        class BackgroundPic: GVAR(RscPicture) {
            moving = 1;
            x = safezoneX + 0.2875 * safezoneW;
            y = safezoneY + 0.125 * safezoneH;
            w = safezoneW * 0.425;
            h = safezoneH * 0.75;
            text = QUOTE(PATHTOF(UI\background.paa));
        };
    };
    class controls {
        // Title
        class Title: GVAR(RscPicture) {
            idc = TITLE;
            x = TITLE_X;
            y = TITLE_Y;
            w = TITLE_W;
            h = TITLE_H;
        };

        // Dropdown Menu
        class Dropdown: GVAR(RscCombo) {
            idc = DROPDOWN;
            onLBSelChanged = QUOTE([call FUNC(getDataCallback)] call FUNC(dialogControl_populateList));
        };

        // Amount
        class Amount: GVAR(RscPicture) {
            idc = AMOUNT;
            x = TEXTPIC_X;
            y = TEXTPIC_Y;
            w = TEXTPIC_W;
            h = TEXTPIC_H;
        };

        // List
        class List: GVAR(RscListNBox) {
            idc = NLIST;
            onLBSelChanged  = QUOTE(call FUNC(dialogControl_amountSelection); call FUNC(dialogControl_takestash));
        };

        // Dropdown Amount Selection
        class DropdownAmount: GVAR(RscCombo) {
            idc = DROPDOWNAMOUNT;
            onLBSelChanged = QUOTE(call FUNC(dialogControl_takestash));
            x = PIC_X + 0.4;
            y = PIC_Y + 0.675;
            w = safezoneW * 0.05;
            h = safezoneH * 0.03;
        };
        
        // Exit-Back
        class Main_Pic_C1_RE: GVAR(RscPicture) {
            idc = BACKPIC;
            x = PIC_X_C1;
            y = PIC_Y + OFFSET_Y_RE;
        };
        class Main_Btn_C1_RE: GVAR(RscButton) {
            idc = BACKBTN;
            x = BTN_X_C1;
            y = BTN_Y + OFFSET_Y_RE;
        };

        // Take-Stash
        class TakeStash_Pic_C1_R1: GVAR(RscPicture) {
            idc = TAKESTASHPIC;
            x = PIC_X_C3;
            y = PIC_Y + OFFSET_Y_RE;
        };
        class TakeStash_Btn_C1_R1: GVAR(RscButton) {
            idc = TAKESTASHBTN;
            x = BTN_X_C3;
            y = BTN_Y + OFFSET_Y_RE;
        };

        // MAIN MENU ONLY
        /* Column 1 */
        // Row 1
        class Main_Pic_C1_R1: GVAR(RscPicture) {
            idc = MAINPIC1;
            x = PIC_X_C1;
            y = PIC_Y;
        };
        class Main_Btn_C1_R1: GVAR(RscButton) {
            idc = MAINBTN1;
            x = BTN_X_C1;
            y = BTN_Y;
        };

        // Row 2
        class Main_Pic_C1_R2: GVAR(RscPicture) {
            idc = MAINPIC2;
            x = PIC_X_C1;
            y = PIC_Y + OFFSET_Y_R2;
        };
        class Main_Btn_C1_R2: GVAR(RscButton) {
            idc = MAINBTN2;
            x = BTN_X_C1;
            y = BTN_Y + OFFSET_Y_R2;
        };

        // Row 3
        class Main_Pic_C1_R3: GVAR(RscPicture) {
            idc = MAINPIC3;
            x = PIC_X_C1;
            y = PIC_Y + OFFSET_Y_R3;
        };
        class Main_Btn_C1_R3: GVAR(RscButton) {
            idc = MAINBTN3;
            x = BTN_X_C1;
            y = BTN_Y + OFFSET_Y_R3;
        };

        // Row 4
        class Main_Pic_C1_R4: GVAR(RscPicture) {
            idc = MAINPIC4;
            x = PIC_X_C1;
            y = PIC_Y + OFFSET_Y_R4;
        };
        class Main_Btn_C1_R4: GVAR(RscButton) {
            idc = MAINBTN4;
            x = BTN_X_C1;
            y = BTN_Y + OFFSET_Y_R4;
        };

        // Row 5
        class Main_Pic_C1_R5: GVAR(RscPicture) {
            idc = MAINPIC5;
            x = PIC_X_C1;
            y = PIC_Y + OFFSET_Y_R5;
        };
        class Main_Btn_C1_R5: GVAR(RscButton) {
            idc = MAINBTN5;
            x = BTN_X_C1;
            y = BTN_Y + OFFSET_Y_R5;
        };

        // Row 6
        class Main_Pic_C1_R6: GVAR(RscPicture) {
            idc = MAINPIC6;
            x = PIC_X_C1;
            y = PIC_Y + OFFSET_Y_R6;
        };
        class Main_Btn_C1_R6: GVAR(RscButton) {
            idc = MAINBTN6;
            x = BTN_X_C1;
            y = BTN_Y + OFFSET_Y_R6;
        };

        /* Column 2 */
        // Row 1
        class Main_Pic_C2_R1: GVAR(RscPicture) {
            idc = MAINPIC7;
            x = PIC_X_C2;
            y = PIC_Y;
        };
        class Main_Btn_C2_R1: GVAR(RscButton) {
            idc = MAINBTN7;
            x = BTN_X_C2;
            y = BTN_Y;
        };

        // Row 2
        class Main_Pic_C2_R2: GVAR(RscPicture) {
            idc = MAINPIC8;
            x = PIC_X_C2;
            y = PIC_Y + OFFSET_Y_R2;
        };
        class Main_Btn_C2_R2: GVAR(RscButton) {
            idc = MAINBTN8;
            x = BTN_X_C2;
            y = BTN_Y + OFFSET_Y_R2;
        };

        // Row 3
        class Main_Pic_C2_R3: GVAR(RscPicture) {
            idc = MAINPIC9;
            x = PIC_X_C2;
            y = PIC_Y + OFFSET_Y_R3;
        };
        class Main_Btn_C2_R3: GVAR(RscButton) {
            idc = MAINBTN9;
            x = BTN_X_C2;
            y = BTN_Y + OFFSET_Y_R3;
        };

        // Row 4
        class Main_Pic_C2_R4: GVAR(RscPicture) {
            idc = MAINPIC10;
            x = PIC_X_C2;
            y = PIC_Y + OFFSET_Y_R4;
        };
        class Main_Btn_C2_R4: GVAR(RscButton) {
            idc = MAINBTN10;
            x = BTN_X_C2;
            y = BTN_Y + OFFSET_Y_R4;
        };

        // Row 5
        class Main_Pic_C2_R5: GVAR(RscPicture) {
            idc = MAINPIC11;
            x = PIC_X_C2;
            y = PIC_Y + OFFSET_Y_R5;
        };
        class Main_Btn_C2_R5: GVAR(RscButton) {
            idc = MAINBTN11;
            x = BTN_X_C2;
            y = BTN_Y + OFFSET_Y_R5;
        };

        // Row 6
        class Main_Pic_C2_R6: GVAR(RscPicture) {
            idc = MAINPIC12;
            x = PIC_X_C2;
            y = PIC_Y + OFFSET_Y_R6;
        };
        class Main_Btn_C2_R6: GVAR(RscButton) {
            idc = MAINBTN12;
            x = BTN_X_C2;
            y = BTN_Y + OFFSET_Y_R6;
        };
    };
};
