class RscControlsGroup;
class RscHTML;
class RscText;

class RscDisplayDiary {
    class Controls {
        class CA_ContentBackgroundd : RscText {
            w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)";
            // default is "21.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class CA_DiaryGroup : RscControlsGroup {
            w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class CA_Diary : RscHTML {
                    w = "41 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    // default is "20.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};

class RscDisplayMainMap {
    class controls {
        class CA_ContentBackgroundd : RscText {
            w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class CA_DiaryGroup : RscControlsGroup {
            w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class CA_Diary : RscHTML {
                    w = "41 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};

class RscDisplayGetReady : RscDisplayMainMap {
    class controls {
        class CA_ContentBackgroundd : RscText {
            w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class CA_DiaryGroup : RscControlsGroup {
            w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class CA_Diary : RscHTML {
                    w = "41 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};

class RscDisplayServerGetReady : RscDisplayGetReady {
    class controls {
        class CA_ContentBackgroundd : RscText {
            w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class CA_DiaryGroup : RscControlsGroup {
            w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class CA_Diary : RscHTML {
                    w = "41 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};

class RscDisplayClientGetReady : RscDisplayGetReady {
    class controls {
        class CA_ContentBackgroundd : RscText {
            w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)";
        };
        class CA_DiaryGroup : RscControlsGroup {
            w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class CA_Diary : RscHTML {
                    w = "41 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};
