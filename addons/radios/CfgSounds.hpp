#define SOUND(var1,var2) \
    class GVAR(var2) { \
        name = var2; \
        sound[] = {QUOTE(PATHTOF(sounds\var1.ogg)), db+25, 1, 500}; \
        titles[] = {}; \
    };

class CfgSounds {
    sounds[] = {track1, track2, track3, track4, track5, track6, track7, track8, track9, track10};

    SOUND(track1,Ride_of_the_Valkyries)
    SOUND(track2,Hot_Nights_In_Los_Angeles)
    SOUND(track3,Smokin_Camels)
    SOUND(track4,Microvolt)
    SOUND(track5,Silhouette)
    SOUND(track6,Scorpion)
    SOUND(track7,Lost_In_The_Shadows)
    SOUND(track8,Flight)
    SOUND(track9,Gravity)
    SOUND(track10,Heat)
};
