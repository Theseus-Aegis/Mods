/*
 * Incorporated from pre-ACE 3.10.0
 *
 * The idea is to reduce the AI's godlike aiming capabilties while retaining its high intelligence.
 * The AI should be smart enough to move through a town, but also be "human" in their reaction time and aim.
 *
 * Note: All these values can still be adjusted via scripts within interpolation boundaries.
 */

class CfgAISkill {
    aimingAccuracy[] = {0, 0, 1, 0.8};
    aimingShake[] = {0, 0, 1, 0.6};
    aimingSpeed[] = {0, 0, 1, 0.7};
    commanding[] = {0, 0, 1, 0.8};
    courage[] = {0, 0, 1, 0.7};
    endurance[] = {0, 0, 1, 0.7};
    general[] = {0, 0, 1, 0.9};
    //reloadSpeed[] changes break rapid firing in single fire mode for players
    spotDistance[] = {0, 0, 1, 1};
    spotTime[] = {0, 0, 1, 1};
};
