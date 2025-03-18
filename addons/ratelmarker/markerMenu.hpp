class RscBackground;
class RscText;
class RscEdit;
class RscButton;

class GVAR(menu) {
    idd = -1;
    movingEnable = 0;
    enableSimulation = 1;
    onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(menuDisplay),nil)]);
    class controlsBackground {
        class Background: RscBackground {
            x = 0.385;
            y = 0.74;
            h = 0.11;
            w = 0.23;
            colorBackground[] = {0, 0, 0, 0.3};
        };
    };
    class controls {
        class X_Label: RscText {
            text = "X:";
            x = 0.385;
            y = 0.75;
        };
        class X_Input: RscEdit {
            idc = GUI_ID_INPUT_X;
            x = 0.415;
            y = 0.75;
            w = 0.08;
            colorBackground[] = {0, 0, 0, 0.5};
            tooltip = "Enter X Coordinate";
            tooltipColorBox[] = {0, 0, 0, 0.65};
        };
        class Y_Label: RscText {
            text = "Y:";
            x = 0.495;
            y = 0.75;
        };
        class Y_Input: RscEdit {
            idc = GUI_ID_INPUT_Y;
            x = 0.525;
            y = 0.75;
            w = 0.08;
            colorBackground[] = {0, 0, 0, 0.5};
            tooltip = "Enter Y Coordinate";
            tooltipColorBox[] = {0, 0, 0, 0.65};
        };
        class CreateMarker: RscButton {
            idc = -1;
            text = "Create Marker";
            onButtonClick = QUOTE(_this call FUNC(prepareMarker));
            x = 0.415;
            y = 0.8;
            w = 0.17;
        };
    };
};
