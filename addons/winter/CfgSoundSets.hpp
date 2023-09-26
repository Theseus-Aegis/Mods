#define ENVIRONMENT(CLASSNAME) \
    class CLASSNAME { \
        soundShaders[] = {}; \
    }

#define VEHICLE(CLASSNAME) \
    class CLASSNAME { \
        soundShaders[] = {}; \
    }

#define VEHICLEINT(CLASSNAME) \
    class CLASSNAME: Vehicle_Base_Body_INT_SoundSet { \
        soundShaders[] = {}; \
    }

#define VEHICLEEXT(CLASSNAME) \
    class CLASSNAME: Vehicle_Base_Body_EXT_SoundSet { \
        soundShaders[] = {}; \
    }

class CfgSoundSets {
    class Vehicle_Base_Body_INT_SoundSet;
    class Vehicle_Base_Body_EXT_SoundSet;

    ENVIRONMENT(Rain_Bg_Forest_Heavy_01_SoundSet);
    ENVIRONMENT(Rain_Bg_Forest_Heavy_SoundSet);
    ENVIRONMENT(Rain_Bg_Forest_Light_SoundSet);
    ENVIRONMENT(Rain_Bg_Forest_Low_SoundSet);
    ENVIRONMENT(Rain_Bg_Forest_Medium_SoundSet);
    ENVIRONMENT(Rain_Bg_Light_Sparse_SoundSet);
    ENVIRONMENT(Rain_Bg_Meadow_Heavy_01_SoundSet);
    ENVIRONMENT(Rain_Bg_Meadow_Heavy_SoundSet);
    ENVIRONMENT(Rain_Bg_Meadow_Light_01_SoundSet);
    ENVIRONMENT(Rain_Bg_Meadow_Medium_SoundSet);
    ENVIRONMENT(Rain_Center_Surface_Heavy_SoundSet);
    ENVIRONMENT(Rain_Center_Surface_Light_SoundSet);
    ENVIRONMENT(Rain_Center_Surface_Medium_SoundSet);
    ENVIRONMENT(Rain_Concrete_Large_Heavy_SoundSet);
    ENVIRONMENT(Rain_Concrete_Large_Light_SoundSet);
    ENVIRONMENT(Rain_Concrete_Large_Medium_SoundSet);
    ENVIRONMENT(Rain_Concrete_Medium_Heavy_SoundSet);
    ENVIRONMENT(Rain_Concrete_Medium_Light_SoundSet);
    ENVIRONMENT(Rain_Concrete_Medium_Medium_SoundSet);
    ENVIRONMENT(Rain_Concrete_Small_01_Heavy_SoundSet);
    ENVIRONMENT(Rain_Concrete_Small_01_Light_SoundSet);
    ENVIRONMENT(Rain_Concrete_Small_01_Medium_SoundSet);
    ENVIRONMENT(Rain_Concrete_Small_02_Heavy_SoundSet);
    ENVIRONMENT(Rain_Concrete_Small_02_Light_SoundSet);
    ENVIRONMENT(Rain_Concrete_Small_02_Medium_SoundSet);
    ENVIRONMENT(Rain_Debris_Large_Heavy_SoundSet);
    ENVIRONMENT(Rain_Debris_Large_Light_SoundSet);
    ENVIRONMENT(Rain_Debris_Large_Medium_SoundSet);
    ENVIRONMENT(Rain_Debris_Small_Heavy_SoundSet);
    ENVIRONMENT(Rain_Debris_Small_Light_SoundSet);
    ENVIRONMENT(Rain_Debris_Small_Medium_SoundSet);
    ENVIRONMENT(Rain_Haybale_Heavy_SoundSet);
    ENVIRONMENT(Rain_Haybale_Light_SoundSet);
    ENVIRONMENT(Rain_MetalA_Heavy_SoundSet);
    ENVIRONMENT(Rain_MetalA_Light_SoundSet);
    ENVIRONMENT(Rain_MetalA_Medium_SoundSet);
    ENVIRONMENT(Rain_MetalAn_Heavy_SoundSet);
    ENVIRONMENT(Rain_MetalAn_Light_SoundSet);
    ENVIRONMENT(Rain_MetalAn_Medium_SoundSet);
    ENVIRONMENT(Rain_MetalB_Heavy_SoundSet);
    ENVIRONMENT(Rain_MetalB_Light_SoundSet);
    ENVIRONMENT(Rain_MetalB_Medium_SoundSet);
    ENVIRONMENT(Rain_MetalBn_Heavy_SoundSet);
    ENVIRONMENT(Rain_MetalBn_Light_SoundSet);
    ENVIRONMENT(Rain_MetalBn_Medium_SoundSet);
    ENVIRONMENT(Rain_MetalC_Heavy_SoundSet);
    ENVIRONMENT(Rain_MetalC_Light_SoundSet);
    ENVIRONMENT(Rain_MetalC_Medium_SoundSet);
    ENVIRONMENT(Rain_MetalCn_Heavy_SoundSet);
    ENVIRONMENT(Rain_MetalCn_Light_SoundSet);
    ENVIRONMENT(Rain_MetalCn_Medium_SoundSet);
    ENVIRONMENT(Rain_MetalT_Heavy_SoundSet);
    ENVIRONMENT(Rain_MetalT_Light_SoundSet);
    ENVIRONMENT(Rain_MetalT_Medium_SoundSet);
    ENVIRONMENT(Rain_PlantA_Heavy_SoundSet);
    ENVIRONMENT(Rain_PlantA_Light_SoundSet);
    ENVIRONMENT(Rain_PlantA_Medium_SoundSet);
    ENVIRONMENT(Rain_PlantB_Heavy_SoundSet);
    ENVIRONMENT(Rain_PlantB_Light_SoundSet);
    ENVIRONMENT(Rain_PlantB_Medium_SoundSet);
    ENVIRONMENT(Rain_PlantC_Heavy_SoundSet);
    ENVIRONMENT(Rain_PlantC_Light_SoundSet);
    ENVIRONMENT(Rain_PlantC_Medium_SoundSet);
    ENVIRONMENT(Rain_Plastic_Cover_Small_Heavy_SoundSet);
    ENVIRONMENT(Rain_Plastic_Cover_Small_Light_SoundSet);
    ENVIRONMENT(Rain_Plastic_Cover_Small_Sparse_SoundSet);
    ENVIRONMENT(Rain_Plastic_Cover_Spot_Heavy_SoundSet);
    ENVIRONMENT(Rain_Plastic_Cover_Spot_Light_SoundSet);
    ENVIRONMENT(Rain_Plastic_Cover_Spot_Sparse_SoundSet);
    ENVIRONMENT(Rain_PlateA_Heavy_SoundSet);
    ENVIRONMENT(Rain_PlateA_Medium_SoundSet);
    ENVIRONMENT(Rain_PlateB_Heavy_SoundSet);
    ENVIRONMENT(Rain_PlateB_Medium_SoundSet);
    ENVIRONMENT(Rain_PlateBn_Heavy_SoundSet);
    ENVIRONMENT(Rain_PlateBn_Medium_SoundSet);
    ENVIRONMENT(Rain_SmallTree_Heavy_SoundSet);
    ENVIRONMENT(Rain_SmallTree_Light_SoundSet);
    ENVIRONMENT(Rain_SmallTree_Medium_SoundSet);
    ENVIRONMENT(Rain_Stone_Large_Heavy_SoundSet);
    ENVIRONMENT(Rain_Stone_Large_Light_SoundSet);
    ENVIRONMENT(Rain_Stone_Small_Heavy_SoundSet);
    ENVIRONMENT(Rain_Stone_Small_Light_SoundSet);
    ENVIRONMENT(Rain_Strawstack_Heavy_SoundSet);
    ENVIRONMENT(Rain_Strawstack_Light_SoundSet);
    ENVIRONMENT(Rain_Tar_Large_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tar_Large_Light_SoundSet);
    ENVIRONMENT(Rain_Tar_Large_Medium_SoundSet);
    ENVIRONMENT(Rain_Tar_Medium_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tar_Medium_Light_SoundSet);
    ENVIRONMENT(Rain_Tar_Medium_Medium_SoundSet);
    ENVIRONMENT(Rain_Tar_Small_01_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tar_Small_01_Light_SoundSet);
    ENVIRONMENT(Rain_Tar_Small_01_Medium_SoundSet);
    ENVIRONMENT(Rain_Tar_Small_02_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tar_Small_02_Light_SoundSet);
    ENVIRONMENT(Rain_Tar_Small_02_Medium_SoundSet);
    ENVIRONMENT(Rain_Tent_Medium_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tent_Medium_Light_SoundSet);
    ENVIRONMENT(Rain_Tent_Medium_Medium_SoundSet);
    ENVIRONMENT(Rain_Tent_Small_01_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tent_Small_01_Light_SoundSet);
    ENVIRONMENT(Rain_Tent_Small_01_Medium_SoundSet);
    ENVIRONMENT(Rain_Tent_Small_02_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tent_Small_02_Light_SoundSet);
    ENVIRONMENT(Rain_Tent_Small_02_Medium_SoundSet);
    ENVIRONMENT(Rain_Tiles_Large_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tiles_Large_Light_SoundSet);
    ENVIRONMENT(Rain_Tiles_Large_Medium_SoundSet);
    ENVIRONMENT(Rain_Tiles_Medium_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tiles_Medium_Light_SoundSet);
    ENVIRONMENT(Rain_Tiles_Medium_Medium_SoundSet);
    ENVIRONMENT(Rain_Tiles_Small_01_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tiles_Small_01_Light_SoundSet);
    ENVIRONMENT(Rain_Tiles_Small_01_Medium_SoundSet);
    ENVIRONMENT(Rain_Tiles_Small_02_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tiles_Small_02_Light_SoundSet);
    ENVIRONMENT(Rain_Tiles_Small_02_Medium_SoundSet);
    ENVIRONMENT(Rain_TimberPile_Heavy_SoundSet);
    ENVIRONMENT(Rain_TimberPile_Light_SoundSet);
    ENVIRONMENT(Rain_TimberPile_Medium_SoundSet);
    ENVIRONMENT(Rain_Tree_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tree_Large_Leaves_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tree_Large_Leaves_Light_SoundSet);
    ENVIRONMENT(Rain_Tree_Large_Leaves_Medium_SoundSet);
    ENVIRONMENT(Rain_Tree_Large_Leaves_Sparse_SoundSet);
    ENVIRONMENT(Rain_Tree_Light_SoundSet);
    ENVIRONMENT(Rain_Tree_Medium_Pines_Heavy_SoundSet);
    ENVIRONMENT(Rain_Tree_Medium_Pines_Light_SoundSet);
    ENVIRONMENT(Rain_Tree_Medium_Pines_Medium_SoundSet);
    ENVIRONMENT(Rain_Tree_Medium_Pines_Sparse_SoundSet);
    ENVIRONMENT(Rain_Tree_Medium_SoundSet);
    ENVIRONMENT(Rain_Tree_Small_Pines_SoundSet);
    ENVIRONMENT(Rain_WideTree_Heavy_SoundSet);
    ENVIRONMENT(Rain_WideTree_Light_SoundSet);
    ENVIRONMENT(Rain_WideTree_Medium_SoundSet);
    ENVIRONMENT(Rain_Wood_Surface_Heavy_SoundSet);
    ENVIRONMENT(Rain_Wood_Surface_Light_SoundSet);
    ENVIRONMENT(Rain_Wood_Surface_Medium_SoundSet);
    ENVIRONMENT(RainForest_High_SoundSet);
    ENVIRONMENT(RainForest_Low_SoundSet);
    ENVIRONMENT(RainForest_Medium_SoundSet);
    ENVIRONMENT(RainHouses_High_SoundSet);
    ENVIRONMENT(RainMeadows_High_SoundSet);
    ENVIRONMENT(RainMeadows_Low_SoundSet);
    ENVIRONMENT(RainMeadows_Medium_SoundSet);
    VEHICLEINT(Hatchback_01_Rain_INT_SoundSet);
    VEHICLEEXT(Hatchback_01_Rain_EXT_SoundSet);
    VEHICLEINT(Lsv_01_Rain_INT_SoundSet);
    VEHICLEEXT(Lsv_01_Rain_EXT_SoundSet);
    VEHICLEINT(Lsv_02_Rain_INT_SoundSet);
    VEHICLEEXT(Lsv_02_Rain_EXT_SoundSet);
    VEHICLEINT(Mrap_01_Rain_INT_SoundSet);
    VEHICLEEXT(Mrap_01_Rain_EXT_SoundSet);
    VEHICLEINT(Mrap_02_Rain_INT_SoundSet);
    VEHICLEEXT(Mrap_02_Rain_EXT_SoundSet);
    VEHICLEINT(Mrap_03_Rain_INT_SoundSet);
    VEHICLEEXT(Mrap_03_Rain_EXT_SoundSet);
    VEHICLEINT(Offroad_01_Rain_INT_SoundSet);
    VEHICLEEXT(Offroad_01_Rain_EXT_SoundSet);
    VEHICLEINT(Offroad_02_Rain_INT_SoundSet);
    VEHICLEEXT(Offroad_02_Rain_EXT_SoundSet);
    VEHICLEINT(Quadbike_01_Rain_INT_SoundSet);
    VEHICLEEXT(Quadbike_01_Rain_EXT_SoundSet);
    VEHICLEINT(Suv_01_Rain_INT_SoundSet);
    VEHICLEEXT(Suv_01_Rain_EXT_SoundSet);
    VEHICLEINT(Tractor_01_Rain_INT_SoundSet);
    VEHICLEEXT(Tractor_01_Rain_EXT_SoundSet);
    VEHICLEINT(Truck_01_Rain_INT_SoundSet);
    VEHICLEEXT(Truck_01_Rain_EXT_SoundSet);
    VEHICLEINT(Truck_02_Rain_INT_SoundSet);
    VEHICLEEXT(Truck_02_Rain_EXT_SoundSet);
    VEHICLEINT(Truck_03_Rain_INT_SoundSet);
    VEHICLEEXT(Truck_03_Rain_EXT_SoundSet);
    VEHICLEINT(Van_01_Rain_INT_SoundSet);
    VEHICLEEXT(Van_01_Rain_EXT_SoundSet);
    VEHICLE(Van_02_Rain_01_Int_SoundSet);
    VEHICLE(Van_02_Rain_01_Ext_SoundSet);
};
