class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class Forestry_Menu {
                displayName = "Forestry";
                condition = "true";
                statement = "";
                icon = QPATHTOF(resources\tree.paa);
                exceptions[] = {
                    "isNotSwimming",
                    "isNotInside",
                    "isNotSitting",
                    "isNotOnLadder",
                    "isNotRefueling"
                };

                class Chop_Tree {
                    displayName = "Cut Down Tree";
                    icon = QPATHTOF(resources\tree.paa);
                    condition = QUOTE(call FUNC(canChop));
                    statement = QUOTE(call FUNC(doChop));
                    exceptions[] = {};
                };

                class Flatten_Grass  {
                    displayName = "Flatten Grass";
                    icon = QPATHTOF(resources\grass.paa);
                    condition = "insideBuilding player != 1";
                    statement = QUOTE(call FUNC(doFlatten));
                    exceptions[] = {};
                };
            };
        };
    };
};
