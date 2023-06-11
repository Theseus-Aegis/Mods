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
    class Mikes_Cool_Config {
        headgear[] = {
            "H_Bandanna_gry",
            "H_Bandanna_blu",
            "H_Bandanna_cbr",
            "H_Bandanna_khk_hs",
            "H_Bandanna_khk",
            "H_Bandanna_mcamo"
        };
        uniforms[] = {
            "U_I_C_Soldier_Bandit_2_F",
            "U_I_C_Soldier_Bandit_3_F",
            "U_C_Man_casual_3_F",
            "U_C_Man_casual_1_F"
        };
        vests[] = {
            "V_Chestrig_blk",
            "V_Chestrig_rgr",
            "V_Chestrig_khk",
            "V_Chestrig_oli"
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
