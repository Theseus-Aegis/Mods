#pragma once

#include "version.h"

#define QUOTE_(x) #x
#define QUOTE(x) QUOTE_(x)

#define TAC_NAME "TAC Mods"
#define TAC_TEAM "TAC Mod Team"
#define TAC_URL "https://github.com/Theseus-Aegis/tac-a3-mods"
#define TAC_TEAM_URL QUOTE(TAC_TEAM - TAC_URL)
#define TAC_DESC "Joint effort by the members of Theseus Inc. to bend the features and game-play of Arma 3 to the community's needs."
#define TAC_COPYRIGHT "©2017 Theseus Incorporated"

#define TAC_VERSION QUOTE(TAC_VERSION_MAJOR.TAC_VERSION_MINOR.TAC_VERSION_PATCH.TAC_VERSION_BUILD)
