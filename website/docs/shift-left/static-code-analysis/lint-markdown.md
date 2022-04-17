# Lint Markdown Content

The [Markdown](https://en.wikipedia.org/wiki/Markdown) markup language is designed to be easy to read, write, and understand. It succeeds - and its flexibility is both a benefit and a drawback. Many styles are possible, so formatting can be inconsistent. Some constructs don't work well in all parsers and should be avoided. The [CommonMark](https://commonmark.org) specification standardizes parsers - but not authors.

markdownlint is a static analysis tool for Node.js with a library of rules to enforce standards and consistency for Markdown files. It was inspired by - and heavily influenced by - Mark Harrison's [markdownlint](https://github.com/markdownlint/markdownlint) for Ruby. The initial rules, rule documentation, and test cases came directly from that project.

## Structure of Repository

Place the script `lint-markdown.sh` into

```bash
~/scripts
```

The purpose of this script is to perform all linting of markdown scripts returning 0 should there be no warnings and non 0 otherwise.  The following is an example script that lints a project's `README.md` and then all `md` files in `./website/docs` and `./website/blog` directory tree.

```bash
#!/usr/bin/env bash

SCRIPT_HOME_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

markdownlint --config "$SCRIPT_HOME_DIR"/.markdownlint.json "$SCRIPT_HOME_DIR"/../website/docs/**/*.md || exit 1
markdownlint --config "$SCRIPT_HOME_DIR"/.markdownlint.json "$SCRIPT_HOME_DIR"/../website/blog/**/*.md || exit 1
markdownlint --config "$SCRIPT_HOME_DIR"/.markdownlint.json "$SCRIPT_HOME_DIR"/../README.md || exit 1
```

:::note

The `--config` option allows a configuration file to be referenced changing or disabling lint rules.
:::

:::tip

Multiple calls to `markdownlint` must have the `|| exit 1` suffix so that the `lint-markdown.sh` will return a non 0 failing the pipeline.

:::

## Configuration

The default linting rules including reporting lines greater than 80 characters.  This rule is too restrictive so is turned off.

```json title=".markdownlint.json"
{
    "line_length": false
}
```

## Pipeline Usage

The `lint-bicep.sh` is part of validation and is called prior to configuration infrastructure.

## See Also

- [markdownlint Tooling](../../tooling/markdownlint) for installation instructions
