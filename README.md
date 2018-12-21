<p align="center">
    <img src="https://github.com/Theseus-Aegis/Mods/blob/master/extras/assets/logo/TAC-Logo.jpg">
</p>
<p align="center">
    <a href="https://github.com/Theseus-Aegis/Mods/releases/latest">
        <img src="https://img.shields.io/badge/Version-1.14.4-blue.svg" alt="TAC Mods Version">
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

**Theseus Inc. Mods**, also known as **TAC Mods**, is a joint effort by the members of <a href="http://www.theseus-aegis.com/">Theseus Inc.</a> to bend the features and game-play of Arma 3 to the community's needs.

The mod is on the same foundation as the ACE3 mod, using its framework, systems, tools and standards. It is entirely **open-source** and licensed under the GNU General Public License ([GPLv2](https://github.com/Theseus-Aegis/Mods/blob/master/LICENSE)).

Huge appreciation and thanks to [ACE3 Team](http://ace3mod.com/team.html) for their open-source nature and permission to use their systems.


### Setup


#### Windows

_Quick build only._

```
$ make.bat
```

##### Extensions

_Requires Boost library!_

32-bit:
```
$ cd extensions/vcproj
$ cmake .. -G "Visual Studio 15 2017" // Or other 32-bit compiler
```

64-bit:
```
$ cd extensions/vcproj64
$ cmake .. -G "Visual Studio 15 2017 Win64" // Or other 64-bit compiler
```

Open `TAC.sln`, change configuration to `RelWithDebInfo` and compile.

#### Linux

```
$ make                  # Quick build
$ make <component>.pbo  # Quick build of specified component
$ make filepatching     # Development build (file patching)
$ make release          # Clean, update versions, commit release preparation, build, sign and archive
$ make push             # Commit and push release preparation
$ make clean            # Clean build files
```

##### Extensions

_Requires Boost library!_  
_Requires `g++-w64-mingw-i686` for 64-bit!_

```
$ make extensions       # Build 32-bit extensions
$ make extensions-win64 # Build 64-bit extensions
```


#### [GitHub Changelog Generator](https://github.com/skywinder/github-changelog-generator) Usage:

```
github_changelog_generator --user Theseus-Aegis --project Mods --token <insert_token> --no-issues --no-pr-wo-labels --unreleased-only --exclude-labels "can't reproduce",duplicate,question,invalid,wontfix --bug-labels bug,"critical bug" --enhancement-labels enhancement,"feature request" --no-author --no-compare-link
```
