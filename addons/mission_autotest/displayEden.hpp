class ctrlMenuStrip;
class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class PREFIX {
                    items[] += {QUOTE(ADDON)};
                };
                class ADDON {
                    text = CSTRING(Autotest);
                    action = QUOTE(edit3DENMissionAttributes 'ADDON');
                };
            };
        };
    };
};
