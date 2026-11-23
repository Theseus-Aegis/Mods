class CfgSounds {
    // Mortars
    class GVAR(noMortars) {
        name = "FireSupport - No Mortars";
        sound[] = {QPATHTOF(data\nomortar.ogg), 1, 1, 100};
        titles[] = {};
    };
    class GVAR(rearmingMortar): GVAR(noMortars) {
        name = "FireSupport - Rearming Mortars";
        sound[] = {QPATHTOF(data\rearmingmortar.ogg), 1, 1, 100};
    };
    class GVAR(outOfRangeMortar): GVAR(noMortars) {
        name = "FireSupport - Out of Range Mortar";
        sound[] = {QPATHTOF(data\outofrangemortar.ogg), 1, 1, 100};
    };
    class GVAR(availableMortar): GVAR(noMortars) {
        name = "FireSupport - Available Mortars";
        sound[] = {QPATHTOF(data\availablemortar.ogg), 1, 1, 100};
    };
    class GVAR(incomingMortar): GVAR(noMortars) {
        name = "FireSupport - Incoming Mortars";
        sound[] = {QPATHTOF(data\incomingmortar.ogg), 1, 1, 100};
    };

    // Cannon
    class GVAR(noCannon): GVAR(noMortars) {
        name = "FireSupport - No Cannon";
        sound[] = {QPATHTOF(data\nocannon.ogg), 1, 1, 100};
    };
    class GVAR(rearmingCannon): GVAR(noMortars) {
        name = "FireSupport - Rearming Cannon";
        sound[] = {QPATHTOF(data\rearmingcannon.ogg), 1, 1, 100};
    };
    class GVAR(outOfRangeCannon): GVAR(noMortars) {
        name = "FireSupport - Out of Range Cannon";
        sound[] = {QPATHTOF(data\outofrangecannon.ogg), 1, 1, 100};
    };
    class GVAR(availableCannon): GVAR(noMortars) {
        name = "FireSupport - Available Cannon";
        sound[] = {QPATHTOF(data\availablecannon.ogg), 1, 1, 100};
    };
    class GVAR(incomingCannon): GVAR(noMortars) {
        name = "FireSupport - Incoming Cannon";
        sound[] = {QPATHTOF(data\incomingcannon.ogg), 1, 1, 100};
    };

    // Rockets
    class GVAR(noRocket): GVAR(noMortars) {
        name = "FireSupport - No Rocket";
        sound[] = {QPATHTOF(data\norocket.ogg), 1, 1, 100};
    };
    class GVAR(rearmingRocket): GVAR(noMortars) {
        name = "FireSupport - Rearming Rocket";
        sound[] = {QPATHTOF(data\rearmingrocket.ogg), 1, 1, 100};
    };
    class GVAR(outOfRangeRocket): GVAR(noMortars) {
        name = "FireSupport - Out of Range Rocket";
        sound[] = {QPATHTOF(data\outofrangerocket.ogg), 1, 1, 100};
    };
    class GVAR(availableRocket): GVAR(noMortars) {
        name = "FireSupport - Available Rocket";
        sound[] = {QPATHTOF(data\availablerocket.ogg), 1, 1, 100};
    };
    class GVAR(incomingRocket): GVAR(noMortars) {
        name = "FireSupport - Incoming Rocket";
        sound[] = {QPATHTOF(data\incomingrocket.ogg), 1, 1, 100};
    };
};
