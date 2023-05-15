#!/usr/bin/env python3

####################################
# TAC automatic deployment script  #
#        (~ ACE3 8e9c275)          #
# ================================ #
# This is not meant to be run      #
# directly!                        #
####################################

import os
import sys
import shutil
import traceback
import subprocess as sp
from pygithub3 import Github


TRANSLATIONISSUE = 51
TRANSLATIONBODY = """**[ACE3 Translation Guide](https://ace3.acemod.org/wiki/development/how-to-translate-ace3.html)**
(Keep in mind, TAC Mods project and repository information is different!)

{}
"""

REPOUSER = "Theseus-Aegis"
REPONAME = "Mods"
REPOPATH = "{}/{}".format(REPOUSER,REPONAME)


def update_translations(token):
    diag = sp.check_output(["python3", "tools/stringtablediag.py", "--markdown"])
    diag = str(diag, "utf-8")
    repo = Github(token).get_repo(REPOPATH)
    issue = repo.get_issue(TRANSLATIONISSUE)
    issue.edit(body=TRANSLATIONBODY.format(diag))


def main():
    print("Obtaining token ...")
    try:
        token = os.environ["GH_TOKEN"]
    except:
        print("Could not obtain token.")
        print(traceback.format_exc())
        return 1
    else:
        print("done.")

    print("\nUpdating translation issue ...")
    try:
        update_translations(token)
    except:
        print("Failed to update translation issue.")
        print(traceback.format_exc())
        return 1
    else:
        print("done.")

    return 0


if __name__ == "__main__":
    sys.exit(main())
