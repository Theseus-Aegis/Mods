class CfgDifficultyPresets {
    class Custom;
    class GVAR(Theseus): Custom {
        displayName = "Theseus";
        description = "Custom difficulty for Theseus gameplay.";
        optionDescription = "Custom difficulty for Theseus gameplay.";
        levelAI = QGVAR(Theseus);
        class Options {
            autoReport = 0;
            cameraShake = 1;
            commands = 0;
            deathMessages = 0;
            detectedMines = 0;
            enemyTags= 0;
            friendlyTags = 0;
            groupIndicators = 0;
            mapContent = 0;
            multipleSaves = 0;
            reducedDamage = 0;
            scoreTable = 0;
            staminaBar = 0;
            stanceIndicator = 1;
            thirdPersonView = 0;
            visionAid = 0;
            vonID = 0;
            waypoints = 0;
            weaponCrosshair = 0;
            weaponInfo = 1;
        };
    };
};
