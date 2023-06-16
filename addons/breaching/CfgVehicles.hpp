class CfgVehicles {
    class SLAMDirectionalMine;
    class GVAR(BreachingCharge): SLAMDirectionalMine {
        author = "Mike";
        ammo = QGVAR(BreachingCharge_Ammo);
        displayName = CSTRING(BreachingCharge);
    };

    class ACE_Explosives_Place_SLAM;
    class GVAR(BreachingCharge_Place): ACE_Explosives_Place_SLAM {
        author = "Mike";
        displayName = CSTRING(BreachingCharge);

        class EventHandlers {
            init = QUOTE(_this call FUNC(plantCharge));
            deleted = QUOTE(_this call FUNC(rotateCharge));
        };
    };
};
