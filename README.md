<p align="center">
    <img src="https://github.com/Theseus-Aegis/Mods/blob/master/extras/assets/logo/TAC-Logo.png">
</p>
<p align="center">
    <a href="https://github.com/Theseus-Aegis/Mods/releases/latest">
        <img src="https://img.shields.io/badge/Version-2.0.0-blue.svg" alt="Theseus Mods Version">
    </a>
    <a href="https://github.com/Theseus-Aegis/Mods/issues">
        <img src="https://img.shields.io/github/issues-raw/Theseus-Aegis/Mods.svg?label=Issues" alt="Theseus Mods Issues">
    </a>
    <a href="https://github.com/Theseus-Aegis/Mods/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/License-GPLv2-red.svg" alt="Theseus Mods License">
    </a>
    <a href="https://github.com/Theseus-Aegis/Mods/actions/workflows/arma.yml">
        <img src="https://github.com/Theseus-Aegis/Mods/actions/workflows/arma.yml/badge.svg?branch=master" alt="Theseus Mods Build Status">
    </a>
</p>
<p align="center"><sup><strong>Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases/latest">CBA</a> and <a href="https://github.com/acemod/ACE3/releases/latest">ACE3</a>.</strong></sup></p>

**Theseus Mods** is a joint effort by the members of <a href="https://www.theseus-aegis.com/">Theseus Inc.</a> to bend the features and game-play of Arma 3 to the community's needs.

The mod is on the same foundation as the ACE3 mod, using its framework, systems, tools and standards. It is entirely **open-source** and licensed under the GNU General Public License ([GPLv2](https://github.com/Theseus-Aegis/Mods/blob/master/LICENSE)).

Huge appreciation and thanks to [ACE3 Team](https://ace3mod.com/team.html) for their open-source nature and permission to use their systems.


## Setup

### Requirements

- Arma 3
- Arma 3 Tools (available on Steam)
- Run Arma 3 and Arma 3 Tools directly from Steam once to install registry entries (and again after every update)
- [HEMTT](https://github.com/BrettMayson/HEMTT/releases) (>=v1.5.1) in project root _(Windows users can double-click `tools/setup.bat`)_
  - `hemtt` (Linux) or `hemtt.exe` (Windows)

### Procedure

_Replace `hemtt` with `hemtt.exe` on Windows._

- Open terminal (Linux) or command line (Windows)
- Run `$ hemtt build` to create a development build _(Windows users can double-click `build.bat`)_
- Run `$ hemtt release` to create a release build
  - _Only Windows release builds are currently supported due to binarization!_
  - **Add extension builds from [CI](https://github.com/Theseus-Aegis/Mods/actions/workflows/extensions.yml)!**
- Run `$ hemtt dev` to create a development build with file patching
  - `mklink /J <Arma 3>\x\tac <Mods>/.hemttout/dev` _(`/D` instead of `/J` for network paths)_
  - _`$ hemtt launch` is not supported. Use [ArmaQDL](https://github.com/jonpas/ArmaQDL)._

### Extensions

**Requirements:**
- Rust (>= 1.59)

Extensions builds must be invoked manually or via CI:
- Run `$ cargo build [--release]` in `extensions` directory
