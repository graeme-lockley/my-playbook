# Software Composition Analysis (SCA)

[Software Composition Analysis](https://en.wikipedia.org/wiki/Static_program_analysis) is an automated process that analyses open source software in a codebase. 

This analysis is performed to evaluate:

- security
- license compliance
- code quality

## Tools

| Name | Language | Tool | Status |
|-|-|-|-|
| [Node.js dependencies](./sca-node-dependencies) | [node.js](https://nodejs.org) | [better-npm-audit](../../tooling/better-npm-audit) | Mandatory |

The column *Status* can have the following values

| Value | Meaning |
|-|-|
| Mandatory | All repositories with the given language must use the software composition analysis tool in their pipeline |
| Discretionary | Repositories may use the tool at this discretion |

## See Also

- [Software Composition Analysis definition](https://www.synopsys.com/glossary/what-is-software-composition-analysis.html) from [synopsis](https://www.synopsys.com)
