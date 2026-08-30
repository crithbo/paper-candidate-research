# Identity and terminal-containment certificates

## Certification result

No locator was excluded for exact identity or terminal containment.

| Locator | Object | Endpoint | Action/estimator | Mechanism | Comparator/guarantee | Decision |
|---|---|---|---|---|---|---|
| Zabha AMO lowering | fixed RISC-V byte/halfword atomic program | same atomic behavior and compiler output cost | width-specific atomic lowering | target form/legalization construction | stock LLVM with fixed target/memory model | `RELATED_ONLY`: shares ISA/compiler theme with prior RISC-V work, but no prior exact object+action+endpoint equivalence is certified. |
| CUDA conditional graph body | fixed CUDA conditional graph behavior | same graph dependency/output behavior | body graph commitment | graph-body construction versus dynamic condition control | stock CUDA graph runtime | `RELATED_ONLY`: shares CUDA graph carrier with Source36 but differs in conditional-node object, action and endpoint. |

No terminal negative witness was asserted transferable. Therefore no containment-based exclusion occurred, and no STOP is revived.
