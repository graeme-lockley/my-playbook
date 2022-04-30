# Node Dependencies

[npm](https://en.wikipedia.org/wiki/Npm_(software)) is the package manager for [node.js](https://nodejs.org).  Npm is determines which dependencies have vulnerabilities and has the option to (attempt to) fix these vulnerabilities.  An improved version of `npm audit` is `better-npm-audit` which presents the vulnerabilities in a more readable and digestable format.

## Structure of Repository

Place the script `sca-node-dependencies.sh` into

```bash
~/scripts
```

The purpose of this script is to determine what vulnerabilities exist in `npm` dependencies returning 0 should there be no reported vulnerabilities and non 0 otherwise.  The following is an example script that lints dependencies in `./website` ignoring reported vulnerabilities with the codes 1067654 and 1070259.

```bash
#!/usr/bin/env bash

SCRIPT_HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
EXCLUSIONS=1067654,1070259

(
    cd "$SCRIPT_HOME_DIR"/../website || exit 1

    if [[ "$EXCLUSIONS" -eq "" ]]
    then
        better-npm-audit audit
    else
        better-npm-audit audit --exclude "$EXCLUSIONS"
    fi
)
```

:::note

The variable `EXCLUSIONS` can be set with vulnerability codes which are not reported.  However `better-npm-audit` expects vulnerabilities with these codes to be detected and will fail if no vulnerability is found with these codes.  This is helpful in that it keeps the `EXCLUSIONS` accurate and does not allow an arbitrary list of codes to be used.

:::

## Pipeline Usage

The `sca-node-dependencies.sh` is part of validation and is called prior to bundling of deployable assets.

## See Also

- [better-npm-audit Tooling](../../tooling/better-npm-audit) for installation instructions
