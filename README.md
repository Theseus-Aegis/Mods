<p align="center">
    <img src="https://github.com/Theseus-Aegis/Mods/blob/master/extras/assets/logo/TAC-Logo.png">
</p>
<p align="center">
    <a href="https://github.com/Theseus-Aegis/Mods/releases/latest">
        <img src="https://img.shields.io/badge/Version-1.31.2-blue.svg" alt="TAC Mods Version">
    </a>
    <a href="https://github.com/Theseus-Aegis/Mods/issues">
        <img src="https://img.shields.io/github/issues-raw/Theseus-Aegis/Mods.svg?label=Issues" alt="TAC Mods Issues">
    </a>
    <a href="https://github.com/Theseus-Aegis/Mods/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/License-GPLv2-red.svg" alt="TAC Mods License">
    </a>
    <a href="https://travis-ci.org/Theseus-Aegis/Mods">
        <img src="https://img.shields.io/travis/Theseus-Aegis/Mods.svg" alt="TAC Mods Build Status">
    </a>
</p>
<p align="center"><sup><strong>Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases/latest">CBA</a> and <a href="https://github.com/acemod/ACE3/releases/latest">ACE3</a>.</strong></sup></p>

**Theseus Inc. Mods**, also known as **TAC Mods**, is a joint effort by the members of <a href="https://www.theseus-aegis.com/">Theseus Inc.</a> to bend the features and game-play of Arma 3 to the community's needs.

The mod is on the same foundation as the ACE3 mod, using its framework, systems, tools and standards. It is entirely **open-source** and licensed under the GNU General Public License ([GPLv2](https://github.com/Theseus-Aegis/Mods/blob/master/LICENSE)).

Huge appreciation and thanks to [ACE3 Team](https://ace3mod.com/team.html) for their open-source nature and permission to use their systems.


## Setup

### Requirements

- Arma 3
- Arma 3 Tools (available on Steam)
- Run Arma 3 and Arma 3 Tools directly from Steam once to install registry entries (and again after every update)
- [Tools](http://dev.idi-systems.com/tools/acre2_tools_user.zip) _(package from ACRE2, contains HEMTT and ArmaScriptCompiler)_
  - [HEMTT](https://github.com/BrettMayson/HEMTT) binary placed in project root ~~or globally installed~~
    - `hemtt` (Linux) or `hemtt.exe` (Windows) ~~or `setup.exe` (Windows global install)~~
  - [ArmaScriptCompiler](https://github.com/dedmen/ArmaScriptCompiler) binary placed in project root
    - `ArmaScriptCompiler.exe` (Windows)
    - **Verify SQFC files are included in PBOs!**

### Procedure

_Replace `hemtt` with `hemtt.exe` on Windows._

- Open terminal (Linux) or command line (Windows)
- Run `$ hemtt build` to create a development build (add `-f` to overwrite already built addons)
- Run `$ hemtt build --release` to create a release build (add `-f` to overwrite already built release)
  - _Only Windows release builds are currently supported!_
- Run `$ hemtt clean` to clean build files

**Windows Helpers:**
- Double-click `build.bat` to create a development build

### Extensions

_Only Windows extension builds are currently supported!_

**Requirements:**
- Rust

Extensions builds must be invoked manually, as they do not get rebuild with every release:
- Run `$ cargo build [--release]` in `extensions` directory
