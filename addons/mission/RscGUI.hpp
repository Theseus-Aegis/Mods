class RscText;
class RscButton;
class RscFrame;

// Keypad for button pressing
class GVAR(Keypad) {
    idd = -1;
    movingEnable = 1;
    class Controls {
        class GVAR(Keypad_Frame): RscFrame {
            idc = 1800;
            x = QUOTE(0.438745 * safezoneW + safezoneX);
            y = QUOTE(0.177928 * safezoneH + safezoneY);
            w = QUOTE(0.262522 * safezoneW);
            h = QUOTE(0.476106 * safezoneH);
        };
        class GVAR(Keypad_Box) {
            type = CT_STATIC;
            idc = -1;
            style = ST_CENTER;
            shadow = 2;
            colorText[] = {1, 1, 1, 1};
            font = "PuristaMedium";
            sizeEx = 0.02;
            colorBackground[] = {0.2, 0.2, 0.2, 0.9};
            text = "";
            x = QUOTE(0.438745 * safezoneW + safezoneX);
            y = QUOTE(0.177928 * safezoneH + safezoneY);
            w = QUOTE(0.262522 * safezoneW);
            h = QUOTE(0.476106 * safezoneH);
        };
        class GVAR(Keypad_Display): RscText {
            idc = 1000;
            colorBackground[] = {0, 0, 0, 1};
            font = "EtelkaMonospacePro";
            text = "Enter Keycode";
            style = ST_CENTER;
            sizeEx = 0.1;
            x = QUOTE(0.456246 * safezoneW + safezoneX);
            y = QUOTE(0.191931 * safezoneH + safezoneY);
            w = QUOTE(0.227519 * safezoneW);
            h = QUOTE(0.0840187 * safezoneH);
        };
        class GVAR(Keypad_Btn0): RscButton {
            idc = 1600;
            text = "0";
            x = QUOTE(0.535003 * safezoneW + safezoneX);
            y = QUOTE(0.556012 * safezoneH + safezoneY);
            w = QUOTE(0.0700059 * safezoneW);
            h = QUOTE(0.0700156 * safezoneH);
            action = QUOTE(0 call FUNC(keypadPress));
            soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter", 0.09, 1};
            soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush", 0.09, 1};
            soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick", 0.09, 1};
            soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape", 0.09, 1};
        };
        class GVAR(Keypad_Btn1): GVAR(Keypad_Btn0) {
            idc = 1601;
            text = "1";
            x = QUOTE(0.456246 * safezoneW + safezoneX);
            y = QUOTE(0.303956 * safezoneH + safezoneY);
            action = QUOTE(1 call FUNC(keypadPress));
        };
        class GVAR(Keypad_Btn2): GVAR(Keypad_Btn0) {
            idc = 1602;
            text = "2";
            y = QUOTE(0.303956 * safezoneH + safezoneY);
            action = QUOTE(2 call FUNC(keypadPress));
        };
        class GVAR(Keypad_Btn3): GVAR(Keypad_Btn0) {
            idc = 1603;
            text = "3";
            x = QUOTE(0.61376 * safezoneW + safezoneX);
            y = QUOTE(0.303956 * safezoneH + safezoneY);
            action = QUOTE(3 call FUNC(keypadPress));
        };
        class GVAR(Keypad_Btn4): GVAR(Keypad_Btn1) {
            idc = 1604;
            text = "4";
            y = QUOTE(0.387975 * safezoneH + safezoneY);
            action = QUOTE(4 call FUNC(keypadPress));
        };
        class GVAR(Keypad_Btn5): GVAR(Keypad_Btn0) {
            idc = 1605;
            text = "5";
            y = QUOTE(0.387975 * safezoneH + safezoneY);
            action = QUOTE(5 call FUNC(keypadPress));
        };
        class GVAR(Keypad_Btn6): GVAR(Keypad_Btn3) {
            idc = 1606;
            text = "6";
            y = QUOTE(0.387975 * safezoneH + safezoneY);
            action = QUOTE(6 call FUNC(keypadPress));
        };
        class GVAR(Keypad_Btn7): GVAR(Keypad_Btn1) {
            idc = 1607;
            text = "7";
            y = QUOTE(0.471994 * safezoneH + safezoneY);
            action = QUOTE(7 call FUNC(keypadPress));
        };
        class GVAR(Keypad_Btn8): GVAR(Keypad_Btn0) {
            idc = 1608;
            text = "8";
            y = QUOTE(0.471994 * safezoneH + safezoneY);
            action = QUOTE(8 call FUNC(keypadPress));
        };
        class GVAR(Keypad_Btn9): GVAR(Keypad_Btn3) {
            idc = 1609;
            text = "9";
            y = QUOTE(0.471994 * safezoneH + safezoneY);
            action = QUOTE(9 call FUNC(keypadPress));
        };
        class GVAR(Keypad_BtnClear): GVAR(Keypad_Btn1) {
            idc = 1610;
            text = "Clear";
            y = QUOTE(0.556012 * safezoneH + safezoneY);
            action = QUOTE('Clear' call FUNC(keypadPress));
        };
        class GVAR(Keypad_BtnEnter): GVAR(Keypad_Btn3) {
            idc = 1611;
            text = "Enter";
            y = QUOTE(0.556012 * safezoneH + safezoneY);
            action = QUOTE('Enter' call FUNC(keypadPress));
        };
    };
};
