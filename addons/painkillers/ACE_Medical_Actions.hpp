class ACE_Medical_Actions {
    class Basic {
        class Morphine;
        class PainKillers: Morphine {
            displayName = CSTRING(DisplayName);
            displayNameProgress = CSTRING(painkillerProgress);
            allowedSelections[] = {"head"};
            items[] = {"TAC_painkillers"};
        };
    };
    class Advanced {
        class Morphine;
        class PainKillers: Morphine {
            displayName = CSTRING(DisplayName);
            displayNameProgress = CSTRING(painkillerProgress);
            allowedSelections[] = {"head"};
            items[] = {"TAC_painkillers"};
        };
    };
};
