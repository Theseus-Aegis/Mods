VERSION = 1.5.0
PREFIX = tac
BIN = @tac_mods
ZIP = tac_mods
CBA = ../CBA_A3
ACE = ../ACE3
FLAGS = -i $(CBA) -i $(ACE3) -w unquoted-string

$(BIN)/addons/$(PREFIX)_%.pbo: addons/%
	@mkdir -p $(BIN)/addons
	@echo "  PBO  $@"
	@armake build ${FLAGS} -f $< $@

$(BIN)/optionals/$(PREFIX)_%.pbo: optionals/%
	@mkdir -p $(BIN)/optionals
	@echo "  PBO  $@"
	@armake build ${FLAGS} -f $< $@

# Shortcut for building single addons (eg. "make <component>.pbo")
%.pbo:
	make $(patsubst %, $(BIN)/addons/$(PREFIX)_%, $@)

all: $(patsubst addons/%, $(BIN)/addons/$(PREFIX)_%.pbo, $(wildcard addons/*)) \
		$(patsubst optionals/%, $(BIN)/optionals/$(PREFIX)_%.pbo, $(wildcard optionals/*))

clean:
	rm -rf $(BIN) $(ZIP)_*.zip

release: all
	@echo "  ZIP  $(ZIP)_$(VERSION).zip"
	@cp AUTHORS.txt LICENSE logo_tac_ca.paa logo_tac_small_ca.paa mod.cpp README.md $(BIN)
	@zip -r $(ZIP)_$(VERSION).zip $(BIN) &> /dev/null
