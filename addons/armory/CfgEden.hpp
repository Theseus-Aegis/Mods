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
                        expression = QUOTE(if (_value) then {_this call FUNC(init)}); // @todo - make MP compatible, this just runs on server
                        defaultValue = "false";
                        condition = "objectHasInventoryCargo";
                        typeName = "BOOL";
                    };
                };
            };
        };
    };
};
