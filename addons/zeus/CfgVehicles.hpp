class CfgVehicles {
    class Module_F;
    class GVAR(moduleBase): Module_F {
        author = ECSTRING(common,Author);
        category = "TAC";
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        scope = 1;
        scopeCurator = 2;
    };

    class GVAR(moduleAddObjectToChronos): GVAR(moduleBase) {
        curatorCanAttach = 1;
        displayName = CSTRING(ModuleAddObjectToChronos);
        function = QFUNC(moduleAddObjectToChronosLocal);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Chronos_ca.paa));
   };
};
