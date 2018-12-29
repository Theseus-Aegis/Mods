class CfgVehicles {
    class Item_Base_F;

    class GVAR(painkillersItem): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(displayName);
        author = "Alganthe";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(GVAR(painkillers),1);
        };
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class Medical {
                class ACE_Head {
                    class FieldDressing;
                    class GVAR(painkillers): FieldDressing {
                        displayName = CSTRING(PainkillersSelfActionDisplayName);
                        condition = '[_player, _target, "head", QGVAR(painkillers)] call ACEFUNC(medical,canTreatCached)';
                        exceptions[] = {"isNotInside", "isNotSwimming"};
                        statement = '[_player, _target, "head", QGVAR(painkillers)] call ACEFUNC(medical,treatment)';
                        icon = QPATHTOF(ui\painkillers_icon_ca.paa);
                    };
                };
            };
        };

        class ACE_Actions {
            class ACE_Head {
                class FieldDressing;
                class GVAR(painkillers): FieldDressing {
                    displayName = CSTRING(PainkillersActionDisplayName);
                    condition = '[_player, _target, "head", QGVAR(painkillers)] call ACEFUNC(medical,canTreatCached)';
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                    statement = '[_player, _target, "head", QGVAR(painkillers)] call ACEFUNC(medical,treatment)';
                    icon = QPATHTOF(ui\painkillers_icon_ca.paa);
                };
            };
        };
    };
};
