@echo off
setlocal enabledelayedexpansion

if not exist "@tac_mods" mkdir "@tac_mods"
if not exist "@tac_mods\addons" mkdir "@tac_mods\addons"
if not exist "@tac_mods\optionals" mkdir "@tac_mods\optionals"

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set armake=tools\armake_w64.exe) else (set armake=tools\armake_w32.exe)

for /d %%f in (addons\*) do (
    set folder=%%f
    set name=!folder:addons\=!
    echo   PBO  @tac_mods\addons\tac_!name!.pbo
    !armake! build -i include -w redefinition-wo-undef -w unquoted-string -w excessive-concatenation -f !folder! @tac_mods\addons\tac_!name!.pbo
)

for /d %%f in (optionals\*) do (
    set folder=%%f
    set name=!folder:optionals\=!
    echo   PBO  @tac_mods\optionals\tac_!name!.pbo
    !armake! build -i include -w redefinition-wo-undef -w unquoted-string -w excessive-concatenation -f !folder! @tac_mods\optionals\tac_!name!.pbo
)

pause
