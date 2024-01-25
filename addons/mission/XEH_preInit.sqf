#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(huntGroups) = [];

if (isServer) then {
    // Collect Intel PreInit
    // Track picked up records on server
    GVAR(collectIntel_records) = [];

    // Send all records saved so far (per request on load)
    [QGVAR(collectIntel_updateRequest), {
        params ["_player"];
        [QGVAR(collectIntel_update), GVAR(collectIntel_records), _player] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;

    // Save each picked up record and send it to others
    [QGVAR(collectIntel_collect), {
        GVAR(collectIntel_records) pushBack _this;
        [QGVAR(collectIntel_update), [_this]] call CBA_fnc_globalEvent;
    }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    // Accept remote records and add them if of same side
    [QGVAR(collectIntel_update), {
        {
            _x params ["_sideCollector", "_diaryRecord"];
            if (_sideCollector == side group ACE_player) then {
                ACE_player createDiaryRecord _diaryRecord;
            };
        } forEach _this;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(aar_hideAdmin), {
        [{
            ((allDiarySubjects player) findIf {_x select 0 == "ocap_diary_adminControls_subject"}) > -1
        }, {
            player removeDiarySubject "ocap_diary_adminControls_subject";
        }] call CBA_fnc_waitUntilAndExecute;
    }] call CBA_fnc_addEventHandler;
};

ADDON = true;
