# RAW_SCREEN_ROW_EVENTS

Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE275-NATIVE-VERSIONED-ARTIFACT-N3-RESIDUAL-FRESH-BREADTH`  
Cutoff: 2026-08-11; official-source review only. No artifact was downloaded, built, executed or benchmarked.

| ID | Fresh official-version native artifact family | Stock semantic boundary and possible version-aware action | Initial result |
|---|---|---|---|
| W275-R1 | Android `resources.arsc`/AAPT2 linked resource tables | Fixed resource-id/configuration/value lookup via stock AAPT2/Android resources reader; predecessor-aware legal string-pool/config-entry placement | `DEEP_DIVE_REQUIRED` |
| W275-R2 | LLVM indexed instrumentation `.profdata` | Fixed function-profile lookup through LLVM reader; predecessor-aware on-disk hash-table/layout constructor | `DEEP_DIVE_REQUIRED` |
| W275-R3 | .NET ReadyToRun (R2R) assemblies | Fixed managed assembly metadata/IL behavior and stock CoreCLR R2R loader; predecessor-aware section/callsite placement | `DEEP_DIVE_REQUIRED` |
| W275-R4 | Chromium `.pak` resource data packs | Fixed resource-id-to-bytes reader result; predecessor-aware entry/data placement | `NOT_ADMITTED_UNFROZEN`—current packer/config union not frozen. |
| W275-R5 | Fontconfig cache files | Fixed font-match/query result through stock cache reader; predecessor-aware cache serialization | `NOT_ADMITTED_UNFROZEN`—natural adjacent-version route and writer union not frozen. |
| W275-R6 | Swift compiled `.swiftmodule` | Fixed compiler-import module semantics under one compiler boundary | `STRUCTURAL_DROP`—official Swift material says compiled module format is tied to compiler version; inter-version artifact identity is not a stable reader contract. |

All six are distinct from excluded DEX, jimage, kallsyms and registry-active/terminal objects. An artifact format alone was not counted as a phenomenon or contribution.
