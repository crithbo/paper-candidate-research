# Source and collision matrix

| Source | First-party status | Supports | Consequence |
|---|---|---|---|
| [ECMA-335, Part I–IV](https://docs.ecma-international.org/ecma-335/Ecma-335-part-i-iv.pdf) | Official standard | Metadata tokens identify table rows; table, heap, index and validity constraints. | Row reassignment requires dependent-reference regeneration and changes token identity. |
| [Microsoft metadata overview](https://learn.microsoft.com/en-us/dotnet/standard/metadata-and-self-describing-components) | Official documentation | Tokens are four-byte table/row identifiers and occur in CIL. | Token values are part of the fixed assembly observable contract. |
| [MetadataTokens API](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.metadata.ecma335.metadatatokens?view=net-10.0) | Official API documentation | Stock APIs expose `GetToken` for handles/readers. | Reflection/reader observability defeats row permutation as same-object. |
| [Current MetadataRootBuilder source](https://raw.githubusercontent.com/dotnet/runtime/main/src/libraries/System.Reflection.Metadata/src/System/Reflection/Metadata/Ecma335/MetadataRootBuilder.cs) | Current upstream source | Default serialization validates ECMA ordering; serializes tables and heaps. | A validation toggle is not a semantics-preserving row planner. |
| [Current MetadataSizes source](https://raw.githubusercontent.com/dotnet/runtime/main/src/libraries/System.Reflection.Metadata/src/System/Reflection/Metadata/Ecma335/MetadataSizes.cs) | Current upstream source | Row counts/heap sizes jointly determine small/large simple and coded indexes. | Full cost/action dependence is global, but cannot repair token-observability failure. |
| [Ildasm documentation](https://learn.microsoft.com/en-us/dotnet/framework/tools/ildasm-exe-il-disassembler) | Official tooling documentation | Token display and metadata validation options. | Supplies stock verification and direct token inspection route. |

## Collision classification

`SAME_OBJECT_DIRECT_FATAL`: ECMA token semantics plus stock API visibility directly contradict the proposed fixed-contract row permutation. This is stronger than an unclosed novelty search; no paper collision absence is asserted.
