#define NO_ACTION_CLASS(NAME, DEFAULT) \
class NAME: None { \
    show = QUOTE(call compile getText (configFile >> 'CfgActions' >> 'NAME' >> 'GVAR(setting)')); \
    GVAR(setting) = QUOTE(profileNamespace getVariable [ARR_2('GVAR(NAME)', DEFAULT)]); \
} \

class CfgActions {
    class None;

    NO_ACTION_CLASS(Eject,1);
    NO_ACTION_CLASS(Rearm,1);
    NO_ACTION_CLASS(TurnIn,1);
    NO_ACTION_CLASS(TurnOut,1);
    NO_ACTION_CLASS(LightOn,1);
    NO_ACTION_CLASS(LightOff,1);
};
