#include "intercept.hpp"


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
    sqf::hint("weapon fired" + std::to_string(sqf::diag_frameno()));
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

