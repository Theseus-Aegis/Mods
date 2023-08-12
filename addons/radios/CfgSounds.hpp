// Reminder: maxDistance is also set in the say3D call
#define SOUND(var1,var2) \
    class GVAR(var2) { \
        name = QUOTE(var2); \
        sound[] = {QPATHTOF(sounds\var1.ogg), 1, 1, 10}; \
        titles[] = {}; \
    }

class CfgSounds {
    SOUND(track1,90s_Boombap);
    SOUND(track2,Midnight_Racer);
    SOUND(track3,She_hopes_Im_hurting);
    SOUND(track4,Smoke_Havana);
    SOUND(track5,The_Slayer);
    SOUND(track6,Eddie_the_Priest);
    SOUND(track7,Saturday_Nights_Alright_for_Dying);
    SOUND(track8,Bouquet_of_Coffee_Flavors);
    SOUND(track9,Its_a_Lifestyle);
    SOUND(track10,Icon_of_Sin);
};
