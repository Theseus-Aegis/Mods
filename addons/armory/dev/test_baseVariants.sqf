// execVM "x\tac\addons\armory\dev\test_baseVariants.sqf";

#include "\x\tac\addons\armory\script_component.hpp"

private _funcName = QFUNC(getBaseVariant);
private _result = "";

LOG("Testing " + _funcName);
TEST_DEFINED(_funcName,"");

if (!isClass (configFile >> "CfgPatches" >> "CUP_Weapons_West_Attachments")) exitWith {
    LOG("CUP Weapons required for this test!");
};

_result = ["CUP_Launch_M136"] call FUNC(getBaseVariant);
TEST_TRUE(_result == "CUP_Launch_M136",_funcName);

_result = ["CUP_Launch_M136_Loaded"] call FUNC(getBaseVariant);
TEST_TRUE(_result == "CUP_Launch_M136",_funcName);

_result = ["CUP_Launch_M136_Used"] call FUNC(getBaseVariant);
TEST_TRUE(_result == "CUP_Launch_M136_Used",_funcName);

_result = ["CUP_optic_Elcan_SpecterDR_3D"] call FUNC(getBaseVariant);
TEST_TRUE(_result == "CUP_optic_Elcan_SpecterDR",_funcName);

_result = ["CUP_optic_AIMM_M68_BLK_DWN"] call FUNC(getBaseVariant);
TEST_TRUE(_result == "CUP_optic_AIMM_M68_BLK",_funcName);

_result = ["CUP_optic_ACOG2_PIP"] call FUNC(getBaseVariant);
TEST_TRUE(_result == "CUP_optic_ACOG2",_funcName);
