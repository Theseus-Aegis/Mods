#define NO_ACTION_CLASS(NAME, PARENT, DEFAULT) \
class NAME: PARENT { \
    show = QUOTE(call compile getText (configFile >> 'CfgActions' >> 'NAME' >> 'GVAR(setting)')); \
    GVAR(setting) = QUOTE(profileNamespace getVariable [ARR_2('GVAR(NAME)', DEFAULT)]); \
} \

class CfgActions {
    class None;

    NO_ACTION_CLASS(TurnIn,None,1);
    NO_ACTION_CLASS(TurnOut,None,1);
    NO_ACTION_CLASS(LightOn,None,1);
    NO_ACTION_CLASS(LightOff,LightOn,1);
};
