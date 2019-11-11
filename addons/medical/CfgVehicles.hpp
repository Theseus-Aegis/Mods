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
};
