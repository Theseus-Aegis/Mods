class CfgVehicles {
    class ace_zeus_moduleBase;
    class GVAR(moduleAddObjectToChronos): ace_zeus_moduleBase {
       curatorCanAttach = 1;
       displayName = CSTRING(ModuleAddObjectToChronos);
       function = QFUNC(moduleAddObjectToChronosLocal);
       icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Medic_ca.paa)); //icon = QUOTE(PATHTOF(UI\Icon_Module_Zeus_Chronos_ca.paa)); //@todo
       class ModuleDescription {
           description = CSTRING(ModuleAddObjectToChronos_Desc);
           sync[] = {"AnyVehicle", "AnyStaticObject"};//@todo - verify
       };
   };
};
