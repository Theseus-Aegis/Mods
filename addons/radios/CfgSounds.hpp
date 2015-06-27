#define SOUND(var) \
    class GVAR(var) { \
        name = CSTRING(var); \
        sound[] = {QUOTE(PATHTOF(sounds\var.ogg)), db+25, 1, 500}; \
        titles[] = {}; \
    };

class CfgSounds {
    sounds[] = {track1, track2, track3, track4, track5, track6, track7, track8, track9, track10};

    SOUND(track1)
    SOUND(track2)
    SOUND(track3)
    SOUND(track4)
    SOUND(track5)
    SOUND(track6)
    SOUND(track7)
    SOUND(track8)
    SOUND(track9)
    SOUND(track10)
};
