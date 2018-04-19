class ACE_Medical_Actions {
    class Basic {
        class Morphine;
        class GVAR(painkillers): Morphine {
            displayName = CSTRING(DisplayName);
            displayNameProgress = CSTRING(painkillerProgress);
            allowedSelections[] = {"head"};
            items[] = {QGVAR(painkillers)};
        };
    };
    class Advanced {
        class Morphine;
        class GVAR(painkillers): Morphine {
            displayName = CSTRING(DisplayName);
            displayNameProgress = CSTRING(painkillerProgress);
            allowedSelections[] = {"head"};
            items[] = {QGVAR(painkillers)};
        };
    };
};

class ACE_Medical_Advanced {
    class Treatment {
        class Medication {
            class GVAR(painkillers) {
                painReduce = 0.7;
                timeInSystem = 400;
                maxDose = 4;
                inCompatableMedication[] = {};
                viscosityChange = 5;
            };
        };
    };
};
