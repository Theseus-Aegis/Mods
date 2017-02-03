class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class PREFIX {
                class Attributes {
                    class GVAR(enabled) {
                        displayName = CSTRING(Module);
                        tooltip = CSTRING(ModuleDesc);
                        property = QGVAR(enabled);
                        control = "Checkbox";
                        expression = QUOTE(if (_value) then { [ARR_2(QQGVAR(init),_this)] call CBA_fnc_globalEventJIP });
                        defaultValue = "(false)";
                        condition = "objectHasInventoryCargo";
                        typeName = "BOOL";
                    };
                };
            };
        };
    };
};
