#include "script_component.hpp"

ADDON = false;

PREP(addAlarmActions);
PREP(canStopAlarms);
PREP(moduleInit);
PREP(prepareAlarm);
PREP(stopAlarms);

GVAR(alarms) = 0;

ADDON = true;
