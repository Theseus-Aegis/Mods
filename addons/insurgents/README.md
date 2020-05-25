## Insurgents

Insurgent units with randomized gear.

### Authors

- [veteran29](https://github.com/veteran29)
- Idea based on [Random Guerilla Fighters] by [taro8](https://github.com/taro8)


## Customizing the gear

Every gear pool from the addon can be disabled in CBA Settings.

Additional gear pools can be added in mission `description.ext`, mission provided gear pools are merged into available gear pool and can not be disabled in CBA Settings.

Example:
```cpp
// description.ext
class tac_insurgents_gear {
    class Tyrones_Cool_Config {
        headgear[] = {
            "CUP_H_TKI_Lungee_Open_01",
            "CUP_H_TKI_Lungee_Open_02",
            "CUP_H_TKI_Lungee_01",
            "CUP_H_TKI_Lungee_02",
            "CUP_H_TKI_Pakol_1_01",
            "CUP_H_TKI_Pakol_2_04",
            "CUP_H_TKI_SkullCap_01"
        };
        uniforms[] = {
            "CUP_O_TKI_Khet_Partug_04",
            "CUP_O_TKI_Khet_Partug_02",
            "CUP_O_TKI_Khet_Partug_01",
            "CUP_O_TKI_Khet_Partug_07",
        };
        vests[] = {
            "CUP_V_OI_TKI_Jacket1_04",
            "CUP_V_OI_TKI_Jacket1_06",
            "CUP_V_OI_TKI_Jacket1_01",
            "CUP_V_OI_TKI_Jacket1_05",
            "CUP_V_OI_TKI_Jacket1_03"
        };
        backpacks[] = {};
        facewear[] = {};
        weapons[] = {
            "CUP_arifle_AK47_Early",
            "CUP_arifle_AK74_Early",
            "CUP_arifle_AK74_GL_Early",
            "CUP_arifle_AK74",
            "CUP_arifle_AK74_GL",
            "CUP_arifle_AKM_Early",
            "CUP_arifle_AKM"
        };
        pistols[] = {
            "hgun_Pistol_01_F",
            "CUP_hgun_PB6P9"
        };
        launchers[] = {};
    };
};
```
