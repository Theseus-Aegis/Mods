// Reminder: maxDistance is also set in the say3D call
#define SOUND(var) \
    class GVAR(var) { \
        name = QUOTE(var); \
        sound[] = {QPATHTOF(sounds\var.ogg), 1, 1, 10}; \
        titles[] = {}; \
        GVAR(isTrack) = 1; \
    }

class CfgSounds {
    SOUND(90s_Boombap);
    SOUND(Midnight_Racer);
    SOUND(She_hopes_Im_hurting);
    SOUND(Smoke_Havana);
    SOUND(The_Slayer);
    SOUND(Eddie_the_Priest);
    SOUND(Saturday_Nights_Alright_for_Dying);
    SOUND(Bouquet_of_Coffee_Flavors);
    SOUND(Its_a_Lifestyle);
    SOUND(Icon_of_Sin);
};
