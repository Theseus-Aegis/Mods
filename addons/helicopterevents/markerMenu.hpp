#define COORDINATE_X 0.385
#define COORDINATE_Y 0.75
#define COORDINATE_W 0.08

#define TOOLTIP_BORDER_COLOR {0, 0, 0, 0.65}

class RscBackground;
class RscText;
class RscEdit;
class RscButton;

class TAC_RatelMarker {
    idd = -1;
    movingEnable = 0;
    enableSimulation = 1; 
    class controlsBackground {
        class Background: RscBackground {
            x = COORDINATE_X;
            y = COORDINATE_Y - 0.01;
            h = 0.11;
            w = COORDINATE_W * 2 + 0.07;
            colorBackground[] = {0, 0, 0, 0.3};
        };
    };
    class controls {
        class X_Label: RscText {
            text = "X:";
            x = COORDINATE_X;
            y = COORDINATE_Y;
        };
        class X_Input: RscEdit {
            idc = 33004;
            x = COORDINATE_X + 0.03;
            y = COORDINATE_Y;
            w = COORDINATE_W;
            colorBackground[] = {0, 0, 0, 0.6};
            tooltip = "Enter X Coordinate";
            tooltipColorBox[] = TOOLTIP_BORDER_COLOR;
        };
        class Y_Label: RscText {
            text = "Y:";
            x = COORDINATE_X + 0.11;
            y = COORDINATE_Y;
        };
        class Y_Input: RscEdit {
            idc = 33005;
            x = COORDINATE_X + 0.14;
            y = COORDINATE_Y;
            w = COORDINATE_W;
            colorBackground[] = {0, 0, 0, 0.6};
            tooltip = "Enter Y Coordinate";
            tooltipColorBox[] = TOOLTIP_BORDER_COLOR;
        };
        class CreateMarker: RscButton {
            idc = -1;
            text = "Create Marker";
            onButtonClick = QUOTE((ctrlParent (_this select 0)) closeDisplay 0; [ARR_2(ctrlText((ctrlParent (_this select 0)) displayCtrl 33004), ctrlText((ctrlParent (_this select 0)) displayCtrl 33005))] call FUNC(prepareMarker));
            x = COORDINATE_X + 0.03;
            y = COORDINATE_Y + 0.05;
            w = COORDINATE_W + 0.09;
        };
    };
};
