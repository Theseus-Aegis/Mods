<p align="center">
    <img src="https://github.com/Theseus-Aegis/tac-a3-mods/blob/master/extras/assets/logo/TAC-Logo.jpg">
</p>
<p align="center">
    <a href="https://github.com/Theseus-Aegis/tac-a3-mods/releases/latest">
        <img src="https://img.shields.io/badge/Version-1.11.1-blue.svg" alt="TAC Mods Version">
    </a>
    <a href="https://github.com/Theseus-Aegis/tac-a3-mods/issues">
        <img src="https://img.shields.io/github/issues-raw/Theseus-Aegis/tac-a3-mods.svg?label=Issues" alt="TAC Mods Issues">
    </a>
    <a href="https://github.com/Theseus-Aegis/tac-a3-mods/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/License-GPLv2-red.svg" alt="TAC Mods License">
    </a>
    <a href="https://travis-ci.org/Theseus-Aegis/tac-a3-mods">
        <img src="https://img.shields.io/travis/Theseus-Aegis/tac-a3-mods.svg" alt="TAC Mods Build Status">
    </a>
</p>
<p align="center"><sup><strong>Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases/latest">CBA</a> and <a href="https://github.com/acemod/ACE3/releases/latest">ACE3</a>.</strong></sup></p>

**Theseus Inc. Mods**, also known as **TAC Mods**, is a joint effort by the members of <a href="http://www.theseus-aegis.com/">Theseus Inc.</a> to bend the features and game-play of Arma 3 to the community's needs.

The mod is on the same foundation as the ACE3 mod, using its framework, systems, tools and standards. It is entirely **open-source** and licensed under the GNU General Public License ([GPLv2](https://github.com/Theseus-Aegis/tac-a3-mods/blob/master/LICENSE)).

Huge appreciation and thanks to [ACE3 Team](http://ace3mod.com/team.html) for their open-source nature and permission to use their systems.


### Development Notes

[Release Build](tools/make.py) command line:
```
make.py version increment_build <other-increment-args> force checkexternal release
```

[GitHub Changelog Generator](https://github.com/skywinder/github-changelog-generator) command line:
```
github_changelog_generator --user Theseus-Aegis --project tac-a3-mods --token <insert_token> --no-issues --no-pr-wo-labels --unreleased-only --exclude-labels "can't reproduce",duplicate,question,invalid,wontfix --bug-labels bug,"critical bug" --enhancement-labels enhancement,"feature request" --no-author --no-compare-link
```
