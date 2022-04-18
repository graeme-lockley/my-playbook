#!/usr/bin/env bash

SCRIPT_HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
EXCLUSIONS=1068044,1067654

(
    cd "$SCRIPT_HOME_DIR"/../website || exit 1

    better-npm-audit audit --exclude "$EXCLUSIONS"
)
