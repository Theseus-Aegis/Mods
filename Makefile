BIN = bin
RELEASE = release
SRC = addons
FLAGS = -w unquoted-string

$(BIN)/tac_%.pbo: $(SRC)/%
	@mkdir -p $(BIN)
	@echo "  PBO  $@"
	@armake build ${FLAGS} -f $< $@

all: $(patsubst $(SRC)/%, $(BIN)/tac_%.pbo, $(wildcard $(SRC)/*))

release: all
	@mkdir $(RELEASE) 2> /dev/null || rm -rf $(RELEASE)/*
	@mkdir -p $(RELEASE)/@tac_mods/addons
	@cp $(BIN)/* $(RELEASE)/@tac_mods/addons/
	@cp *.dll $(RELEASE)/@tac_mods/
	@cp *.cpp $(RELEASE)/@tac_mods/
	@cp AUTHORS.txt LICENSE logo_tac_ca.paa logo_tac_small_ca.paa README.md $(RELEASE)/@tac_mods/
	@echo "  ZIP  $(RELEASE)/tac_mods_x.y.z.zip"
	@cd $(RELEASE); zip -r tac_mods_x.y.z.zip @tac_mods &> /dev/null; cd ..
