class CfgVehicles {
    class Module_F;
    class GVAR(moduleBase): Module_F {
        author = ECSTRING(main,Author);
        category = "TAC";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        scope = 1;
        scopeCurator = 0;
    };

    class GVAR(moduleAddObjectToChronos): GVAR(moduleBase) {
        scopeCurator = 2;
        curatorCanAttach = 1;
        displayName = CSTRING(ModuleAddObjectToChronos);
        function = QFUNC(moduleAddObjectToChronosLocal);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Chronos_ca.paa));
    };
};
