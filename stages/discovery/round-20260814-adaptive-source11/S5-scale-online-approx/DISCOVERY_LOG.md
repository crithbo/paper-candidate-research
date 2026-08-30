# Bounded closure log — Source11

Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE11`  
Method: v8.7 canonical; claim-pack `OFF`  
Scope: exactly the two Source10 near-miss objects; no fresh backfill.  
Result: `COMPLETE_ZERO_PROPOSALS__CLOSURE_FINAL`

## Closure result

Both carry-forward lines are now closed as non-admissible for their *frozen* same-object contracts.  This is not a resource or implementation inference.

- **Jasmin:** current official documentation exposes the entire relevant stack-frame action union: a default `tight` strategy (which reruns register allocation), `pessimistic`, `optimistic`, and a per-export `callee_saved = n` override.  The same documentation and compiler-pass documentation show that register allocation already occurs as a native compiler pass, while source-level spilling is deliberate/manual and allocation fails when it cannot allocate.  The proposed “bounded-recourse register/stack constructor” is therefore either an existing strategy/annotation, a manual source rewrite (changed input object), or a new generic compiler allocator.  No target-specific residual state/action with an exact or certified recourse guarantee survives.
- **Fiat-Crypto:** current primary README specifies one `fiat_crypto` producer whose command-line strategy union includes saturated/unsaturated Solinas, word-by-word Montgomery, Dettman multiplication, Solinas reduction, and base conversion.  It also provides same-operation examples at multiple valid machine widths and says the Coq development builds binary compilers that generate code according to the chosen strategy.  These are two proof-preserving native outputs, but they establish that the proposed whole-operation rewrite/carry choice is already native union, not an unexpressed N2.  Turning pure offline generation into online bounded recourse would change the exact object and guarantee.

## Frozen sources and date

| object | first-party snapshot used | source/config facts used |
|---|---|---|
| Jasmin | official stable documentation, accessed 2026-08-14; memory-layout material identifies released versions `2026.03.2` and `2026.07.0`; repository default branch `main` | compiler-pass graph; register allocation; manual spill boundary; `-callee-saved={tight,pessimistic,optimistic}`; `callee_saved=n` override; safety/constant-time checker routes |
| Fiat-Crypto | official repository `master` README, accessed 2026-08-14 | binary `fiat_crypto`; listed strategies; modulus, hardware-width and operation arguments; generated C/Bedrock2 output; Coq compiler/proof boundary |

The remote service did not expose a commit object through its read-only page interface.  The named release/documentation version and branch snapshot above are the maximum reproducible source reference obtained without cloning/downloading; no claim depends on a supposed absent flag or source symbol.

## Stopping boundary

`SOURCE11_FINAL_NO_EXTENSION` applies to both signatures.  Any future question must use a genuinely new object and assignment rather than reopening either action space by a new label.

## Primary sources

- Jasmin memory-layout/current configuration documentation: <https://jasmin-lang.readthedocs.io/en/stable/compiler/advanced/memory_layout.html>
- Jasmin compilation passes: <https://jasmin-lang.readthedocs.io/en/v2025.06.1/compiler/passes/index.html>
- Jasmin project and proof/compiler tree: <https://github.com/jasmin-lang/jasmin>
- Fiat-Crypto current primary README: <https://raw.githubusercontent.com/mit-plv/fiat-crypto/master/README.md>

No repository clone, compilation, checker execution, experiment, benchmark, installation, or downstream-stage action occurred.
