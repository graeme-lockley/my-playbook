# ShellCheck

[ShellCheck](https://www.shellcheck.net) is a GPLv3 tool that gives warnings and suggestions for bash/sh shell scripts.

The goals of ShellCheck are

- To point out and clarify typical beginner's syntax issues that cause a shell to give cryptic error messages
- To point out and clarify typical intermediate level semantic problems that cause a shell to behave strangely and counter-intuitively
- To point out subtle caveats, corner cases and pitfalls that may cause an advanced user's otherwise working script to fail under future circumstances

## Installation

| Device | Process |
|-|-|
| Mac dotfiles | module `shellcheck` |
| Mac adhoc | `brew install shellcheck` |
| Dev Container | `RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \` <br/> &nbsp;&nbsp;&nbsp;&nbsp;`&& apt-get -y install --no-install-recommends shellcheck` |

## See Also

- [ShellCheck Manual](https://github.com/koalaman/shellcheck)
- [Microsoft-hosted agents](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/hosted) contains references to the applications and tooling that are included in each of the different images
