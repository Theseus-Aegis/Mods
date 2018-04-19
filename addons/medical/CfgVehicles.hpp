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
                        displayName = CSTRING(selfActionDisplayName);
                        condition = QUOTE([ARR_4(_player, _target, 'head', QQGVAR(painkillers))] call ace_medical_fnc_canTreatCached);
                        exceptions[] = {"isNotInside", "isNotSwimming"};
                        statement = QUOTE([ARR_4(_player, _target, 'head', QQGVAR(painkillers))] call ace_medical_fnc_treatment);
                        icon = "";
                    };
                };
            };
        };

        class ACE_Actions {
            class ACE_Head {
                class FieldDressing;
                class GVAR(painkillers): FieldDressing {
                    displayName = CSTRING(actionDisplayName);
                    condition = QUOTE([ARR_4(_player, _target, 'head', QQGVAR(painkillers))] call ace_medical_fnc_canTreatCached);
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                    statement = QUOTE([ARR_4(_player, _target, 'head', QQGVAR(painkillers))] call ace_medical_fnc_treatment);
                    icon = "";
                };
            };
        };
    };
};
