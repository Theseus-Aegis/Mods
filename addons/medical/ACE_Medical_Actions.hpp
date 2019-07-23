class ace_medical_treatment_actions {
    class Morphine;
    class GVAR(painkillers): Morphine {
        displayName = CSTRING(DisplayName);
        displayNameProgress = CSTRING(PainkillerProgress);
        allowedSelections[] = {"head"};
        items[] = {QGVAR(painkillers)};
        icon = QPATHTOF(ui\painkillers_icon_ca.paa);
        condition = "";
        callbackSuccess = QUOTE(call ACEFUNC(medical_treatment,medication));
    };
};

class ace_medical_treatment {
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
