class CfgAILevelPresets {
    class Custom;
    class GVAR(Theseus): Custom {
        displayName = "Theseus";
        precisionAI = 0.4;
        skillAI = 1.0;
    };
    class GVAR(Theseus_SOG): GVAR(Theseus) {
        displayName = "Theseus SOG";
        precisionAI = 0.25;
    };
};
