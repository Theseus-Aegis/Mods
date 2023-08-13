# About

Allows playing music in vehicles, similar to the music system in Arma 3 Creator DLC: [S.O.G. Prairie Fire](https://www.sogpf.com/) but quieter.

Audio files should be normalized to 0.0 dB an converted to Ogg Vorbis. This component does not provide any music on its own, only the framework.

```cpp
#define RADIO_MUSIC(var) \
    class GVAR(var) { \
        name = QUOTE(var); \
        sound[] = {QPATHTOF(var.ogg), 2, 1, 10}; \
        titles[] = {}; \
        tac_radios_isTrack = 1; \
    }

RADIO_MUSIC(MyMusic);
```

Radio can be blocked on a specific object (static radios or vehicles) using `OBJECT setVariable ["tac_radios_enabled", false]`.

### Authors

- [DaC](https://github.com/DavidCamre)
- [Jonpas](https://github.com/jonpas)
- [JoramD0](https://github.com/JoramD0)
