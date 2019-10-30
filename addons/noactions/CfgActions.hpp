#define NO_ACTION_CONIG_ENTRY(NAME, DEFAULT)\
class NAME: None \
{\
    show = QUOTE(call compile getText (configFile >> 'CfgActions' >> 'NAME' >> 'GVAR(setting)'));\
    GVAR(setting) = QUOTE(profileNamespace getVariable [ARR_2('GVAR(NAME)', DEFAULT)]);\
}\

class CfgActions {
    class None;

    NO_ACTION_CONIG_ENTRY(Eject, 1);
    NO_ACTION_CONIG_ENTRY(Rearm, 1);
    NO_ACTION_CONIG_ENTRY(TurnIn, 1);
    NO_ACTION_CONIG_ENTRY(TurnOut, 1);
    NO_ACTION_CONIG_ENTRY(LightOn, 1);
    NO_ACTION_CONIG_ENTRY(LightOff, 1);
};
