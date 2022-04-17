# Lint Bash Shell Scripts

[ShellCheck](https://www.shellcheck.net) is the de facto linter for shell scripts.

## Structure of Repository

Place the script `lint-bash.sh` into

```bash
~/scripts
```

The purpose of this script is to perform all linting of bash scripts returning 0 should there be no warnings and non 0 otherwise.  The following is an example script that lints all of the `*.sh` files in the project's scripts directory

```bash
#!/usr/bin/env bash

SCRIPT_HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

shellcheck -x "$SCRIPT_HOME_DIR"/../scripts/*.sh
```

:::tip

If a script needs to call `SpellCheck` multiple times then add `|| exit 1` after each call to exit `lint-bash.sh` once `SpellCheck` reports a warning. For example

```bash
shellcheck -x "$SCRIPT_HOME_DIR"/../scripts/*.sh || exit 1
shellcheck -x "$SCRIPT_HOME_DIR"/../bin/*.sh || exit 1
```

:::

## Configuration

The default linting rules configured in `ShellCheck`.

## Pipeline Usage

The `lint-bash.sh` is part of validation and is called prior to configuration infrastructure or compiling any source code.

## See Also

- [ShellCheck Tooling](../../tooling/shellcheck) for installation instructions
- [Microsoft-hosted agents](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/hosted) contains references to the applications and tooling that are included in each of the different images.
