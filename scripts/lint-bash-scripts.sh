#!/usr/bin/env bash

SCRIPT_HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

shellcheck -x "$SCRIPT_HOME_DIR"/../scripts/*.sh
