# DEX-DELTA-PARETODP — Independent Stage 0 Revision-1 Closing Review

- Assignment: `STAGE0-C1-20260811-DEX-DELTA-PARETODP-REVISION1-CLOSING-V8.7`
- Role: independent closing reviewer
- Decision: `SCIENTIFIC_STOP_RECOMMENDED`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.91`
- Revision budget: `1/1 consumed`; no further same-ID revision
- Stage A/B: `false`
- Evidence ceiling: `STATIC_SOURCE_AND_FORMAL_COUNTEREXAMPLE_ONLY`

## Independence and scope

I did not participate in or read this topic’s PRIMARY or revision materials before this closing assignment. This review reads only the frozen PRIMARY/revision packages supplied in the assignment and rechecks the pinned R8 source required to attack the revision certificate. It does not run a candidate, benchmark, or natural corpus.

The outcome is **not** based on missing implementation, native output, natural pair, hardware, or a positive/negative measured result. It is based on a formal counterexample to the revision’s admission-bearing FPT/bijection certificate.

## Mechanical acceptance

| Input | Supplied SHA-256 | Independent recomputation |
|---|---|---|
| PRIMARY handoff | `F6B7342E…EA42BB77` | match |
| PRIMARY manifest self | `24C8AACD…91FF86D2` | match; 4/4 listed entries present |
| revision report | `5E612504…A7A2DD7F` | match |
| revision handoff | `339F1B68…427A43BC` | match |
| revision manifest self | `2D78A643…E45C30A1` | match; 4/4 listed entries present |

The assignment control freeze matched at review start: `AGENTS.md=66231F71…D82B063`, `plan.md=BFDAF9B8…6425A5`, `registry.yaml=BE77FBF9…197E0EF`, `ROLE_STAGE0_REVIEW.md=741EC354…581626E`.

## Independent native action and same-object audit

Pinned R8 `2346f2d6f9c170defb3802a9426935512e8acd05` confirms that `MixedSectionLayoutStrategy` exposes exactly nine strategy-returned collections: annotations, annotation directories, annotation sets, annotation-set-ref lists, class data, code, encoded arrays, string data, and type lists. `FileWriter` consumes those collections in a fixed section order. It derives `debug_info` emission from the chosen code order and deterministically regenerates offsets, indexed items, map, signature, and checksum. These are writer consequences, not free tenth-or-later action families.

This supports the revision’s narrow same-object boundary: a fixed ordinary single DEX logical IR can vary in these writer-realizable mixed-section orders while stock reader/ART semantics remain the same. It also raises the certificate burden: code-deduplication/cache membership and code-derived debug order are future-dependent writer facts. They can be recovered from an uncompressed placement ideal `J`; they cannot be silently omitted from an allegedly small quotient.

R8 default/startup and the restricted same-object ReDex/patcher controls remain fair strong subtractors. No result here treats the R8 testing inspector as an existing optimizer. The outcome does not depend on proving an absence of a paper collision; that status remains `SEARCH_BOUNDED_OPEN`.

## Decisive formal counterexample

The revision defines a state containing `J`, “the ideal of already placed canonical bundles,” then claims an exact FPT running time

`O(n · 2^w · 2^k · m · p · |Q_B| · Lbar)`.

That bound is not sound for the stated action space.

Consider two independent, internally ordered chains of movable native-legal bundles, each of length `r`, and no other free bundles. The dependency poset has width `w=2`. After any prefix, a legal ideal is determined by the pair `(i,j)` of numbers already taken from the first and second chains, so it has `(r+1)^2 = Θ(n²)` distinct ideals (`n=2r`). For a DEX writer these ideals cannot generally be merged: give every bundle a different fixed byte contribution or source-match context, and a later `E_B` continuation has a different legal next action or a different exact encoded cost. Therefore `J` must distinguish Θ(n²) states even when `w=2`.

The proposed formula permits only `O(n·2²)=O(n)` placement states at fixed values of all other parameters. This contradiction does not depend on an unimplemented system. More generally, a width-`w` union of chains has Θ((n/w)^w) ideals. Retaining `J` yields XP-style/identity-state enumeration, not the claimed `f(w)·poly(n)` FPT quotient. Dropping or coarsening `J` requires a new proof that it preserves all later native writer actions, code-derived debug order/deduplication, offset/alignment consequences, profile locality, and `E_B` cost; the supplied certificate gives no such proof.

Consequently the claimed DP-to-native bijection is only a tautological correspondence between *fully distinguished linear extensions* and writer plans. It does not furnish the required non-generic compressed action space or the claimed FPT algorithm. The 8-vs-11-byte `A,B,Y` / `B,A,Y` witness remains a valid **local action-divergence illustration under the declared transducer**, but it cannot repair the global complexity/quotient failure.

## Closing-gate matrix

| Required attack | Finding | Result |
|---|---|---|
| R8 pin and nine-action catalog | Native source confirms nine strategy collections; fixed writer consequences are real | PASS |
| Stock ART same-object boundary | Definable for a fixed ordinary single DEX; no custom reader needed | PASS (conditional Stage A fidelity remains) |
| `E_B` future action/exact cost | Declared deterministic transducer can define a bounded objective | PASS only for its declared model |
| DP ↔ native writer plan correspondence | Full plan/linear-extension correspondence can hold | PASS only as uncompressed enumeration |
| FPT parameter honesty / non-generic N2 | `J` has Θ(n²) ideals already at width 2; claimed `O(n·2^w…)` is false | **FAIL — decisive** |
| 8 vs 11 witness | Arithmetic is locally consistent for the declared source-only grammar; native realization still Stage A gated | ACTION_DIVERGENCE_ONLY |
| R8/ReDex/mobile-patcher union | Strong baseline roles are correctly separated; no direct union absorption is needed for this finding | PASS / `SEARCH_BOUNDED_OPEN` |
| Q2 paper shape | The admission-bearing algorithm collapses to generic constrained sequencing/enumeration or an unproved quotient | **FAIL** |

## Scientific decision

The atomic revision gate `CURRENT_NATIVE_WRITER_ACTION_COMPLETE__BOUNDED_DELTA_TRANSDUCER_BIJECTION_CERTIFICATE` is **not closed**. Its non-generic exact/FPT guarantee is false as written, and the candidate has no alternative valid target-specific algorithmic kernel after quotient compression is removed. The pre-registered revision is already consumed; producing a new state abstraction, a different complexity guarantee, or a different theorem would be a second scientific revision.

This is a scientific stop rather than an `INCONCLUSIVE_POLICY_HOLD`: the two-chain construction is a concrete formal contradiction to the essential stated guarantee, and without that guarantee the remaining construction is ordinary precedence-constrained layout/enumeration with a chosen encoder objective, not a credible Q2 N2 contribution.

- Sentinel: `BELOW_Q2_STOP__UNSOUND_FPT_PLACEMENT_IDEAL_QUOTIENT__GENERIC_CONSTRAINED_ENUMERATION`
- Same-ID revision: forbidden (`1/1` consumed).
- New-ID condition: a future topic must freeze a different formal problem with a genuinely bounded/target-specific structural parameter and prove a future-action/cost-preserving compression that does not retain the full placement ideal. It must not rename this DP or reuse the invalid `O(n·2^w…)` claim.

## Stage A preclaim route

None is authorized because Stage 0 closes with a scientific stop. The revision’s proposed tiny-writer, ART, and full-cost checks remain useful engineering diagnostics but cannot rescue an invalid theoretical contribution or serve as paper evidence for this ID.

## Sources checked

- [Pinned `MixedSectionLayoutStrategy`](https://r8.googlesource.com/r8/%2B/2346f2d6f9c170defb3802a9426935512e8acd05/src/main/java/com/android/tools/r8/dex/MixedSectionLayoutStrategy.java)
- [Pinned `StartupMixedSectionLayoutStrategy`](https://r8.googlesource.com/r8/%2B/2346f2d6f9c170defb3802a9426935512e8acd05/src/main/java/com/android/tools/r8/dex/StartupMixedSectionLayoutStrategy.java)
- [Pinned `DefaultMixedSectionLayoutStrategy`](https://r8.googlesource.com/r8/%2B/2346f2d6f9c170defb3802a9426935512e8acd05/src/main/java/com/android/tools/r8/dex/DefaultMixedSectionLayoutStrategy.java)
- [Pinned `FileWriter`](https://r8.googlesource.com/r8/%2B/2346f2d6f9c170defb3802a9426935512e8acd05/src/main/java/com/android/tools/r8/dex/FileWriter.java)
- Revision report, audit, claim matrix and frozen PRIMARY source audit (all hashes above).

AI-assisted source review and formal analysis were used. No source or result is claimed beyond the cited static material.
