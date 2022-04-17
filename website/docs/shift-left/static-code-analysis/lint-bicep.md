# Lint Bicep

[Bicep](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/) is a domain-specific language (DSL) that uses declarative syntax to deploy Azure resources.

## Structure of Repository

Place the script `lint-bicep.sh` into

```
~/scripts
```

The purpose of this script is to perform all linting of bicep scripts returning 0 should there be no warnings and non 0 otherwise.  The following is an example script that lints all of the `*.bicep` files in the project's infra directory

```bash
#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for FILE in "$SCRIPT_DIR"/../infra/*.bicep
do
    echo "$FILE"
    
    if ! az bicep build --file "$FILE" > output.log 2>&1
    then
        echo Error: Lint Failed
        cat output.log
        exit 1
    elif [ "$( wc -l < output.log )" -ne "0" ]
    then
        echo Warnings: Lint Failed
        cat output.log
        exit 1
    fi
done

exit 0
```

:::note

`az bicep` returns 0 if there are lint warnings.  To fail the pipeline the warnings are captured to `output.log` and a word count against this file is used.

:::

:::tip

Include `~/output.log` into your `.gitignore` to avoid accidentally checking in the scripts temporary file.

:::

## Configuration

The default linting rules configured in `az bicep`.

## Azure Installation

Pre-installed with all images.

## Pipeline Usage

The `lint-bicep.sh` is part of validation and is called prior to configuration infrastructure.

## See Also

- [Microsoft-hosted agents](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/hosted) contains references to the applications and tooling that are included in each of the different images
- [az bicep](https://docs.microsoft.com/en-us/cli/azure/bicep?view=azure-cli-latest) CLI reference with examples
