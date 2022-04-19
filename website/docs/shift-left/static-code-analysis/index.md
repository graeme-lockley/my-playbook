# Static Code Analysis (SA)

[Static Code Analysis](https://en.wikipedia.org/wiki/Static_program_analysis) is the analysis of source code without needing to execute the code.  The purpose of this code is to highlight:

- Programming errors
- Coding standard violations
- Idiomatic violations
- Assignment and reference to undefined variables
- Syntax violations

Benefits of using static analysis include:

- Increased code quality and code consistency
- Automated tools faster than manual code review
- Paired with normal testing methods, static analysis allows for more depth in debugging code
- Automated tools are less prone to human error
- Increase the likelihood of finding vulnerabilities in code
- Performed in an offline development environment
- There are lots of tools available

However, static analysis comes with some drawbacks:

- False positives can be detected
- Not all coding rules can always be followed requiring rule overrides
- System and third-party libraries are not analyzed

## Tools

| Name | Language | Tool | Status |
|-|-|-|-|
| [Lint Bash Shell Scripts](./lint-bash-shell) | [bash](https://www.gnu.org/software/bash/) | [ShellCheck](../../tooling/shellcheck) | Mandatory |
| [Lint Bicep Templates](./lint-bicep) | [bicep](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/) | [az bicep](../../tooling/az-bicep) | Mandatory |
| [Lint Markdown Content](./lint-markdown) | [Markdown](https://en.wikipedia.org/wiki/Markdown) | [markdownlint](../../tooling/markdownlint) | Mandatory |

The column *Status* can have the following values

| Value | Meaning |
|-|-|
| Mandatory | All repositories with the given language must use the static code analysis tool in their pipeline |
| Discretionary | Repositories may use the tool at this discretion |

## See Also

- [Static Analysis definition](https://www.techtarget.com/whatis/definition/static-analysis-static-code-analysis) from [TechTarget WhatIs](https://www.techtarget.com/whatis/)
