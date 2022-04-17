#!/usr/bin/env bash

SCRIPT_HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

markdownlint --config "$SCRIPT_HOME_DIR"/.markdownlint.json "$SCRIPT_HOME_DIR"/../website/docs/**/*.md || exit 1
markdownlint --config "$SCRIPT_HOME_DIR"/.markdownlint.json "$SCRIPT_HOME_DIR"/../website/blog/**/*.md || exit 1
markdownlint --config "$SCRIPT_HOME_DIR"/.markdownlint.json "$SCRIPT_HOME_DIR"/../README.md || exit 1
