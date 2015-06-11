#define distance 450
#define volume db+34

class CfgSounds {
    sounds[] = {track1, track2, track3, track4, track5, track6, track7, track8, track9, track10};

    class GVAR(RadioTrack1) {
        name = CSTRING(Radio_track1);
        sound[] = {QUOTE(PATHTOF(sounds\track1.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(RadioTrack2) {
        name = CSTRING(Radio_track2);
        sound[] = {QUOTE(PATHTOF(sounds\track2.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(RadioTrack3) {
        name = CSTRING(Radio_track3);
        sound[] = {QUOTE(PATHTOF(sounds\track3.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(RadioTrack4) {
        name = CSTRING(Radio_track4);
        sound[] = {QUOTE(PATHTOF(sounds\track4.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(RadioTrack5) {
        name = CSTRING(Radio_track5);
        sound[] = {QUOTE(PATHTOF(sounds\track5.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(RadioTrack6) {
        name = CSTRING(Radio_track6);
        sound[] = {QUOTE(PATHTOF(sounds\track6.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(RadioTrack7) {
        name = CSTRING(Radio_track7);
        sound[] = {QUOTE(PATHTOF(sounds\track7.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(RadioTrack8) {
        name = CSTRING(Radio_track8);
        sound[] = {QUOTE(PATHTOF(sounds\track8.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(RadioTrack9) {
        name = CSTRING(Radio_track9);
        sound[] = {QUOTE(PATHTOF(sounds\track9.ogg)), volume, 1, distance};
        titles[] = {};
    };
    class GVAR(RadioTrack10) {
        name = CSTRING(Radio_track10);
        sound[] = {QUOTE(PATHTOF(sounds\track10.ogg)), volume, 1, distance};
        titles[] = {};
    };
};
