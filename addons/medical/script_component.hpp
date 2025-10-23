#define COMPONENT medical
#define COMPONENT_BEAUTIFIED Medical
#include "\x\tac\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL
#endif

#include "\x\tac\addons\main\script_macros.hpp"

#define KO_NOISES ["ace_fire_scream_12", "ACE_hit_Male05ENG_high_3", "ACE_hit_Male05ENG_high_4", "ACE_hit_Male05ENG_mid_4", "ACE_moan_Male06ENG_high_8"]
#define UNCONSCIOUS_NOISES ["ace_fire_scream_8", "ACE_moan_Male07ENG_high_2", "ACE_moan_Male07ENG_high_4", "ACE_moan_Male09ENG_high_1", "ACE_moan_Male09ENG_high_2", "ACE_moan_Male09ENG_high_3", "ACE_moan_Male09ENG_high_4"]

#define MACRO_INJECTORS ["Adenosine", "Epinephrine", "Morphine"]
#define MACRO_BANDAGES ["FieldDressing", "PackingBandage", "ElasticBandage", "QuikClot"]
#define MACRO_IVS ["BloodIV", "BloodIV_500", "BloodIV_250", "SalineIV", "SalineIV_500", "SalineIV_250", "PlasmaIV", "PlasmaIV_500", "PlasmaIV_250"]
