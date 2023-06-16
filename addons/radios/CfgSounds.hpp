#define SOUND(var1,var2) \
    class GVAR(DOUBLES(var2,Quiet)) { \
        name = var2; \
        sound[] = {QPATHTOF(sounds\var1.ogg), db+3, 1, 10}; \
        titles[] = {}; \
    }; \
    class GVAR(var2) { \
        name = var2; \
        sound[] = {QPATHTOF(sounds\var1.ogg), db+15, 1, 10}; \
        titles[] = {}; \
    }; \
    class GVAR(DOUBLES(var2,Loud)) { \
        name = var2; \
        sound[] = {QPATHTOF(sounds\var1.ogg), db+25, 1, 10}; \
        titles[] = {}; \
    };

class CfgSounds {
    //sounds[] = {track1};

    //SOUND(track1,track1)
};
