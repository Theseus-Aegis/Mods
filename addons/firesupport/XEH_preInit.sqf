#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Signal Ammo types
GVAR(signalAmmoTypes) = [
    QGVAR(mortarAmmoHE),
    QGVAR(mortarAmmoHEGL),
    QGVAR(mortarAmmoSmoke),
    QGVAR(mortarAmmoSmokeGL),
    QGVAR(artilleryAmmoHE),
    QGVAR(artilleryAmmoHEGL),
    QGVAR(artilleryAmmoSmoke),
    QGVAR(artilleryAmmoSmokeGL),
    QGVAR(rocketAmmoHEGL)
];

// 82mm Mortar Defaults - HE / Smoke
GVAR(mortarSignalTypes) = [QGVAR(mortarAmmoHE), QGVAR(mortarAmmoHEGL), QGVAR(mortarAmmoSmoke), QGVAR(mortarAmmoSmokeGL)];
GVAR(mortarAmmoTypes) = ["8Rnd_82mm_Mo_shells", "8Rnd_82mm_Mo_Smoke_white"];
GVAR(mortarList) = [];
GVAR(mortarsBusy) = false;
GVAR(mortarAreaSize) = [35, 35];
GVAR(mortarRoundCount) = 0;

// 155mm Defaults - HE / Smoke
GVAR(artillerySignalTypes) = [QGVAR(artilleryAmmoHE), QGVAR(artilleryAmmoHEGL), QGVAR(artilleryAmmoSmoke), QGVAR(artilleryAmmoSmokeGL)];
GVAR(artilleryAmmoTypes) = ["32Rnd_155mm_Mo_shells", "6Rnd_155mm_Mo_smoke"];
GVAR(artilleryList) = [];
GVAR(artilleryBusy) = false;
GVAR(artilleryAreaSize) = [90, 90];
GVAR(artilleryRoundCount) = 6;

// 230mm Defaults - HE only
GVAR(rocketAmmoTypes) = ["12Rnd_230mm_rockets"];
GVAR(rocketList) = [];
GVAR(rocketBusy) = false;
GVAR(rocketAreaSize) = [150, 150];
GVAR(rocketRoundCount) = 4;

GVAR(HESupportTypes) = [QGVAR(mortarAmmoHE), QGVAR(mortarAmmoHEGL), QGVAR(artilleryAmmoHE), QGVAR(artilleryAmmoHEGL)];
GVAR(SmokeSupportTypes) = [QGVAR(mortarAmmoSmoke), QGVAR(mortarAmmoSmokeGL), QGVAR(artilleryAmmoSmoke), QGVAR(artilleryAmmoSmokeGL)];

ADDON = true;
