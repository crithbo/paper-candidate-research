# Source55 S5 ordinary source screen

Date: 2026-08-15. This is bounded public official/primary source review. No
candidate build, benchmark, installation, download, or experiment occurred.

## All-history identity preflight

The frozen five-field key is exact object, action/estimand, endpoint, semantic
guarantee, and full-cost boundary. Registry/history checks establish:

- GHC recompilation state is an exact historical Source01 S5 surface and was
  not reopened.
- Swift module serialization is an exact historical Source365 surface and was
  not reopened.
- The three selected objects have no found exact five-field match in the lookup
  surface. This is NO_EXACT_MATCH_FOUND__NOT_A_NOVELTY_OR_ABSENCE_CLAIM.
- Compiler/cache family similarity is RELATED_ONLY and was not used to exclude
  OCaml, Racket, or Idris.

## S55-01: OCaml cmi/cmx artifact state

Official current OCaml documentation says cmi is a compiled interface and cmx
supports cross-module inlining. The reference manual describes separate
compilation and output artifact production. With a fixed program and interface
contract, the observable decision is whether stale dependency artifacts are
recompiled and in what build-system order. A different cmi/cmx representation
or compiler-visible interface changes the fixed interface/consumer contract;
retaining it leaves ordinary recompilation dependency selection and build
ordering.

No target-specific atomic constructor, non-generic discriminator, or formal
recourse guarantee was frozen. This is not a judgment about source availability,
implementation, or potential result.

Disposition: LOCATOR_ONLY__RECOMPILATION_OR_BUILD_ORDER_REMAINDER.

## S55-02: Racket zo compiled-module loading

The current official Racket Reference defines compiled-file roots,
use-compiled-file-paths, the default compiled-load handler, and the default
modify-seconds validity check. It further records the selected bytecode path in
the module registry after a load. These are native whole loader/reuse actions
and configuration controls for the same module-declaration semantics.

Changing roots, validity check, cache location, or invalidation timing is a
forbidden controller/configuration proposal. A non-native representation or
reader changes the stock loading contract. No union-external atomic action
survives the current semantics.

Disposition: STRUCTURAL_DROP__CURRENT_LOADER_UNION_OR_FORBIDDEN_CONTROLLER.

## S55-03: Idris 2 incremental code generation

Current official Idris documentation states that incremental generation builds
compiled code alongside the checked TTC file, requires imported modules/packages
to have been built incrementally for the backend, and falls back to whole
program compilation if a prerequisite is missing. It also documents an expected
optimization tradeoff and the whole-program override.

The available action is thus the existing whole-program versus incremental mode
and its package-wide prerequisite. A planner assigning modes or build sequence
to modules is a generic scheduler/controller. No target-native whole
constructor with an independently fixed exact/FPT/approximation/competitive
guarantee was named; a new output representation or backend contract would
change the object.

Disposition: LOCATOR_ONLY__MODE_SELECTION_OR_SCHEDULING_REMAINDER.

## Primary-source roles

| role | source | selected version/date | decision use |
|---|---|---|---|
| ANCHOR/CURRENT | OCaml compiler backend and 5.3 reference manual | official current release docs, accessed 2026-08-15 | cmi/cmx and separate-compilation contract |
| ANCHOR/CURRENT/CONTRARY | Racket Reference, Evaluation and Compilation | official current docs, accessed 2026-08-15 | loader roots, validity check, selected-bytecode registry |
| ANCHOR/CURRENT/CONTRARY | Idris 2 Incremental Code Generation | official current docs, accessed 2026-08-15 | existing modes, fallback, prerequisite, tradeoff |
| CONTRARY | Zig 0.16 release notes | official current release notes, accessed 2026-08-15 | seed-only contrary: incremental mode remains disabled by default due known bugs |

URLs:

- https://ocaml.org/docs/compiler-backend
- https://ocaml.org/releases/5.3/ocaml-5.3-refman.pdf
- https://docs.racket-lang.org/reference/eval.html
- https://idris2.readthedocs.io/en/latest/backends/incremental.html
- https://ziglang.org/download/0.16.0/release-notes.html

