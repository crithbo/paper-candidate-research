# Source and collision matrix

| primary route | use | closure |
|---|---|---|
| [dotnet/runtime upstream](https://github.com/dotnet/runtime) | Official source repository for CoreCLR and Crossgen2/R2RDump paths. | Establishes current upstream entry point; requires commit pin and complete action audit. |
| [CoreCLR build documentation](https://github.com/dotnet/runtime/blob/main/docs/workflow/building/coreclr/README.md) | Official documentation that Crossgen2 and R2RDump are shipped in the CoreCLR build tool set. | Supports native checker/tool route. |
| [R2R runtime design reference](https://github.com/dotnet/runtime/blob/main/docs/design/coreclr/botr/clr-abi.md) | Official design/source reference for R2R stubs and runtime transitions. | Supports loader coupling, not a layout-gap claim. |
| Primary R2R layout/version/delta papers and artifacts | Direct same-object collision subtraction. | Not closed; no novelty conclusion. |

Only first-party sources are used affirmatively. Unclosed rows prevent a brief.
