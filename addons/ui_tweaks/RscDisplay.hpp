// In-game briefing
class RscControlsGroup;
class RscHTML;
class RscText;

// default is "21.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
#define MACRO_DIARY_SIZE_LARGE w = "43 * (((safezoneW / safezoneH) min 1.2) / 40)"

// default is "20.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
#define MACRO_DIARY_SIZE_SMALL w = "41 * (((safezoneW / safezoneH) min 1.2) / 40)"

class RscDisplayDiary {
    class Controls {
        class CA_ContentBackgroundd: RscText {
            MACRO_DIARY_SIZE_LARGE;
        };
        class CA_DiaryGroup : RscControlsGroup {
            MACRO_DIARY_SIZE_LARGE;
            class controls {
                class CA_Diary : RscHTML {
                    MACRO_DIARY_SIZE_SMALL;
                };
            };
        };
    };
};

class RscDisplayMainMap {
    class controls {
        class CA_ContentBackgroundd: RscText {
            MACRO_DIARY_SIZE_LARGE;
        };
        class CA_DiaryGroup : RscControlsGroup {
            MACRO_DIARY_SIZE_LARGE;
            class controls {
                class CA_Diary : RscHTML {
                    MACRO_DIARY_SIZE_SMALL;
                };
            };
        };
    };
};

class RscDisplayGetReady: RscDisplayMainMap {
    class controls {
        class CA_ContentBackgroundd : RscText {
            MACRO_DIARY_SIZE_LARGE;
        };
        class CA_DiaryGroup : RscControlsGroup {
            MACRO_DIARY_SIZE_LARGE;
            class controls {
                class CA_Diary : RscHTML {
                    MACRO_DIARY_SIZE_SMALL;
                };
            };
        };
    };
};

class RscDisplayServerGetReady: RscDisplayGetReady {
    class controls {
        class CA_ContentBackgroundd : RscText {
            MACRO_DIARY_SIZE_LARGE;
        };
        class CA_DiaryGroup : RscControlsGroup {
            MACRO_DIARY_SIZE_LARGE;
            class controls {
                class CA_Diary : RscHTML {
                    MACRO_DIARY_SIZE_SMALL;
                };
            };
        };
    };
};

class RscDisplayClientGetReady: RscDisplayGetReady {
    class controls {
        class CA_ContentBackgroundd : RscText {
            MACRO_DIARY_SIZE_LARGE;
        };
        class CA_DiaryGroup : RscControlsGroup {
            MACRO_DIARY_SIZE_LARGE;
            class controls {
                class CA_Diary : RscHTML {
                    MACRO_DIARY_SIZE_SMALL;
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

// default is "37.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
#define MACRO_MISSION_LOAD_SIZE_LARGE w = "50 * (((safezoneW / safezoneH) min 1.2) / 40)"

// default is "16 * (((safezoneW / safezoneH) min 1.2) / 40)";
#define MACRO_MISSION_LOAD_SIZE_SMALL w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)"

class RscDisplayLoadMission: RscStandardDisplay {
    class controls {
        class Mission: RscControlsGroupNoScrollbars {
            MACRO_MISSION_LOAD_SIZE_LARGE;
            class controls {
                class MissionGameType: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionBackgroundTop: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionName: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionAuthor: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionPictureBack: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionDescription: RscStructuredText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionPicture: RscPictureKeepAspect {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                    // default is "15.8 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class DLCPictureBack: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCPicture: RscPicture {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCDescription: RscStructuredText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCName: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCAuthor: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCStripe: RscPicture {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCIcon: RscPicture {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
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

// Same defaults as above block.
class RscDisplayNotFreeze: RscStandardDisplay {
    class controls {
        class Mission: RscControlsGroupNoScrollbars {
            MACRO_MISSION_LOAD_SIZE_LARGE;

            class controls {
                class MissionGameType: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionBackgroundTop: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionName: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionAuthor: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionPictureBack: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class MissionPicture: RscPictureKeepAspect {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                    // default is "15.8 * (((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class MissionDescription: RscStructuredText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCPictureBack: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCPicture: RscPicture {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCDescription: RscStructuredText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCName: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCAuthor: RscText {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCStripe: RscPicture {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
                class DLCIcon: RscPicture {
                    MACRO_MISSION_LOAD_SIZE_SMALL;
                };
            };
        };
    };
};

