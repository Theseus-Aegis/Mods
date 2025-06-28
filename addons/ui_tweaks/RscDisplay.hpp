// In-game briefing
class RscControlsGroup;
class RscHTML;
class RscText;

class RscDisplayDiary {
    class Controls {
        class CA_ContentBackgroundd: RscText {
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
        class CA_ContentBackgroundd: RscText {
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

class RscDisplayGetReady: RscDisplayMainMap {
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

class RscDisplayServerGetReady: RscDisplayGetReady {
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

class RscDisplayClientGetReady: RscDisplayGetReady {
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

// Mission Loading screen.
class RscStandardDisplay;
class RscControlsGroupNoScrollbars;
class RscStructuredText;
class RscPictureKeepAspect;
class RscPicture;

class RscDisplayLoadMission: RscStandardDisplay {
    class controls {
        class Mission: RscControlsGroupNoScrollbars {
            w = "50 * (((safezoneW / safezoneH) min 1.2) / 40)";
            // default is "37.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
            class controls {
                class MissionGameType: RscText {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    // default of all below is "16 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class MissionBackgroundTop: RscText {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class MissionName: RscText {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class MissionAuthor: RscText {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class MissionPictureBack: RscText {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class MissionDescription: RscStructuredText {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class MissionPicture: RscPictureKeepAspect {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    // default is "15.8 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class DLCPictureBack: RscText {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class DLCPicture: RscPicture {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class DLCDescription: RscStructuredText {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class DLCName: RscText {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class DLCAuthor: RscText {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class DLCStripe: RscPicture {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class DLCIcon: RscPicture {
                    w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};
class RscDisplayLoading {
    class Variants {
        class Loading: RscDisplayLoadMission {
        };
    };
};
