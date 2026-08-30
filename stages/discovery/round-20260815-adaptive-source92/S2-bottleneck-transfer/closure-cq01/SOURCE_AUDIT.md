# Official-source audit — S2-92-CQ01

| Sequence | Frozen official route | Pin / result | Permitted interpretation |
|---:|---|---|---|
| 1 | `api.github.com/repos/ruby/ruby` | 200; default branch `master` | Version-rule input only. |
| 2 | `api.github.com/repos/ruby/ruby/commits/master` | 200; `d17a0d008310e36d1e16f9614c7ca01fe38cf3d6` | Immutable source pin. |
| 3 | `yjit/src/codegen.rs` | 200; SHA-256 `5d78d21b3dfba9484c7791ee9ec3055bd73bfd64fe034882a71150d371f47892` | Current codegen/stub/exit action surface. |
| 4 | `yjit/src/core.rs` | 200; SHA-256 `d411cf2cffab07dbce5150ec3d856c7a94e807b78f17962dc12c6f8fa099530e` | Current block/context/branch action surface. |
| 5 | `yjit/src/asm/mod.rs` | 200; SHA-256 `99ffaadbaebbbf15428dc19b2a4f895f00c24a2423b8f79e538430c38c55d732` | Current page/code-memory/code-GC action surface. |
| 6 | `test/ruby/test_yjit.rb` | 200; SHA-256 `493540777de921fb2243fd233df99c398599db3172ab1f7c5946443c6ee37f1f` | In-tree YJIT and side-exit carrier. |

## Interpretation limits

- `SEARCH_BOUNDED_OPEN` applies to direct collision beyond the current action surface observed here; no external literature/source search was authorized.
- Existing code allocation, outlined exits, branch shape, page reuse and code-GC actions are concrete current subtractors, not evidence that all future joint constructions are absorbed.
- No candidate-specific two-plan witness or finite target-specific guarantee was available in the frozen queue. A generic code-packing/metadata/controller objection remains unresolved rather than assumed decisive.
