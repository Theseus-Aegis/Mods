#define COORDINATE_X 0.385
#define COORDINATE_Y 0.75
#define COORDINATE_W 0.08

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
            x = QUOTE(COORDINATE_X);
            y = QUOTE(COORDINATE_Y - 0.01);
            h = QUOTE(0.11);
            w = QUOTE(COORDINATE_W * 2 + 0.07);
            colorBackground[] = {0, 0, 0, 0.3};
        };
    };
    class controls {
        class X_Label: RscText {
            text = "X:";
            x = QUOTE(COORDINATE_X);
            y = QUOTE(COORDINATE_Y);
        };
        class X_Input: RscEdit {
            idc = GUI_ID_INPUT_X;
            x = QUOTE(COORDINATE_X + 0.03);
            y = QUOTE(COORDINATE_Y);
            w = QUOTE(COORDINATE_W);
            colorBackground[] = {0, 0, 0, 0.5};
            tooltip = "Enter X Coordinate";
            tooltipColorBox[] = {0, 0, 0, 0.65};
        };
        class Y_Label: RscText {
            text = "Y:";
            x = QUOTE(COORDINATE_X + 0.11);
            y = QUOTE(COORDINATE_Y);
        };
        class Y_Input: RscEdit {
            idc = GUI_ID_INPUT_Y;
            x = QUOTE(COORDINATE_X + 0.14);
            y = QUOTE(COORDINATE_Y);
            w = QUOTE(COORDINATE_W);
            colorBackground[] = {0, 0, 0, 0.5};
            tooltip = "Enter Y Coordinate";
            tooltipColorBox[] = {0, 0, 0, 0.65};
        };
        class CreateMarker: RscButton {
            idc = -1;
            text = "Create Marker";
            onButtonClick = QUOTE(_this call FUNC(prepareMarker));
            x = QUOTE(COORDINATE_X + 0.03);
            y = QUOTE(COORDINATE_Y + 0.05);
            w = QUOTE(COORDINATE_W + 0.09);
        };
    };
};
