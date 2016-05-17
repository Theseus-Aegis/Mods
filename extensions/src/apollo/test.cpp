#include "intercept.hpp"
#include "uncategorized.hpp"

int __cdecl intercept::api_version() {
    return 1;
}


void __cdecl intercept::fired(
    object &unit_,
    rv_string &weapon_,
    rv_string &muzzle_,
    rv_string &mode_,
    rv_string &ammo_,
    rv_string &magazine,
    object &projectile_)
{
    sqf::hint("weapon fired " + std::to_string(sqf::diag_frameno()));
    sqf::get_unit_loadout(sqf::player()); //crash
    //sqf::rv_handgun_items items = sqf::handgun_items(unit_); //crash
    //sqf::rv_model_info model_info = sqf::get_model_info(unit_);
    //sqf::rv_fog_parameters fog = sqf::fog_params(); //works


    /*std::vector<sqf::rv_magazine_ammo> mag_ammo = sqf::magazines_ammo(unit_);

    std::vector<game_value> mag_ammo_gv;
    for (sqf::rv_magazine_ammo ammo : mag_ammo)
        mag_ammo_gv.push_back(game_value(ammo));*/

    //sqf::diag_log(loadout);
}



BOOL APIENTRY DllMain(HMODULE hModule,
    DWORD  ul_reason_for_call,
    LPVOID lpReserved
)
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

