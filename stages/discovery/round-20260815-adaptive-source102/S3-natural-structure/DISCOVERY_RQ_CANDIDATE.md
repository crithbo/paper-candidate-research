# Primary RQ — S3-102-01

- **Anchor:** OCaml official compiler frontend/backend/toolchain documentation and upstream source, checked 2026-08-15.
- **Object:** a fixed set of `.mli`/`.ml` module interfaces compiled to `.cmi`, then read by stock `ocamlc`/`ocamlopt` lookup and compatibility checking.
- **Same-object boundary:** module names, interface signatures, type compatibility, compiler version/magic interpretation and stock reader semantics remain fixed; no renamed `.cmi`, custom reader, merged object, or changed module API.
- **Identity preflight:** the held Flambda2 item is a distinct optimization object/action/endpoint. It is `RELATED_ONLY`, not exclusion or novelty evidence.

## RQ

For version-pinned public OCaml project releases, can a predecessor-aware `.cmi` construction retain every stock module-interface lookup and type-checking result while reducing complete emitted-interface plus equal-information transition cost versus current compiler output and generic delta?

Any surviving route must be N2 with a target-specific whole construction/guarantee; N3 requires later measured release structure. Full cost would include compiler CPU/RSS/temp, `.cmi`/delta bytes and stock dependency lookup/typecheck cost.
