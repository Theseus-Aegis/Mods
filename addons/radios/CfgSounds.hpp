#define distance 250
#define volume db+15

class CfgSounds {
    sounds[] = {track1, track2, track3, track4, track5, track6, track7, track8, track9, track10};

    class GVAR(Track1) {
        name = CSTRING(track1);
        sound[] = {QUOTE(PATHTOF(sounds\track1.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(Track2) {
        name = CSTRING(track2);
        sound[] = {QUOTE(PATHTOF(sounds\track2.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(Track3) {
        name = CSTRING(track3);
        sound[] = {QUOTE(PATHTOF(sounds\track3.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(Track4) {
        name = CSTRING(track4);
        sound[] = {QUOTE(PATHTOF(sounds\track4.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(Track5) {
        name = CSTRING(track5);
        sound[] = {QUOTE(PATHTOF(sounds\track5.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(Track6) {
        name = CSTRING(track6);
        sound[] = {QUOTE(PATHTOF(sounds\track6.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(Track7) {
        name = CSTRING(track7);
        sound[] = {QUOTE(PATHTOF(sounds\track7.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(Track8) {
        name = CSTRING(track8);
        sound[] = {QUOTE(PATHTOF(sounds\track8.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(Track9) {
        name = CSTRING(track9);
        sound[] = {QUOTE(PATHTOF(sounds\track9.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(Track10) {
        name = CSTRING(track10);
        sound[] = {QUOTE(PATHTOF(sounds\track10.ogg)), volume, 1, distance};
        titles[] = {};
    };
};
