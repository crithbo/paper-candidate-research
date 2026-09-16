# KALLSYMS-VERSIONAWARE-TOKEN-STABILITY — Independent Stage 0 confirmation

- Assignment: `STAGE0-C2-20260811-KALLSYMS-VERSIONAWARE-TOKEN-STABILITY-CONFIRM-V8.7`
- Role: `INDEPENDENT_CONFIRMATION_SENTRY`
- Decision: `CONFIRM_REVISE_ONCE`
- Tier: `TIER_B_Q2_VIABLE__CONDITIONAL_ON_UNIQUE_GATE`
- Confidence: `0.90`
- Evidence ceiling: `STATIC_CURRENT_SOURCE_AND_FINITE_CERTIFICATE_ROUTE_ONLY__NO_IMPLEMENTATION__NO_NATURAL_RESULT`
- Latest-collision status: `SEARCH_BOUNDED_OPEN`

## Independent disposition

I confirm one, and only one, scientific revision.  The proposed gate
`NATIVE_LINK_FIXED_POINT_PRESERVING_FRONTIER_DIVERGENCE` is a legal finite Stage 0 gate, not an improperly front-loaded request for a build or positive result.  It is necessary because current Linux's token optimizer is a strong per-version native baseline and because the kallsyms object participates in the actual multi-pass link/address fixed point.  No reviewed current source directly absorbs a predecessor-conditioned native frontier with a target-specific exact/certified guarantee; a bounded search is not treated as an absence proof.

## Decisive independent checks

### 1. Same object and link fixed point

The same object is not a detached `System.map` or a post-link replacement of `kallsyms`.  It is a complete native build for one pinned architecture, configuration, compiler/binutils set and Linux tag, with the unchanged kallsyms reader and the candidate representation participating in every native link/re-generation pass.  At the terminal pass, the candidate's own kallsyms map must pass the native final `System.map` consistency check.

Absolute addresses need not be identical to a stock arm merely because a legal representation has a different size: the relevant same-function contract is preservation of final symbol inclusion, type/name values, address-order/lookup relation and native reader behavior **within that candidate's converged link**.  Requiring byte-identical stock addresses would incorrectly remove every size-sensitive native action.  Conversely, accepting a precomputed stock map or an after-link splice is a same-object failure.

The revision must freeze exactly one deployment semantics:

- `ONLINE_FIXED_PREDECESSOR`: the already deployed predecessor image/representation is input; only target construction is chosen; or
- `OFFLINE_PINNED_CHAIN`: all declared adjacent releases are jointly constructed, with an explicit initial representation and chronological recurrence.

It must include the dummy/relink/regenerate/possible-extra-pass schedule as a deterministic transition.  A plan is legal only if that transition converges inside the pinned native pass bound and its terminal map check succeeds.  Nonconvergent plans are rejected, not silently repaired or scored.

### 2. Current native action and comparator union

The independently checked source boundary is: current `scripts/kallsyms.c` greedily maximizes current-input two-byte token profit, emits compressed names plus token table/index, markers, offsets and name-order sequence; the reader expands with that emitted table/index and lookup uses the native sequence.  The exposed `--all-symbols` and `--pc-relative` controls change the frozen symbol-set/offset-mode contract and are not predecessor-aware layout actions.

The minimum complete fair union is:

1. pinned stock kallsyms plus its complete link fixed point;
2. stock target bytes plus a pinned RFC-3284/VCDIFF encoder;
3. stock target bytes plus one second strong pinned binary-delta engine;
4. a finite deterministic predecessor-token-stability heuristic grid; and
5. tiny exact enumeration/CP only as an oracle, never as the paper mechanism.

The 2026 kallsyms line-info work is a material current neighbor but addresses a separate line-info table, not the native symbol-name token stream.  FSST/Courgette remain subtractors because their decoder or representation differs.  No direct same-object absorption was established; transport/cache failures are not used to infer absence.

### 3. Why the gate is neither generic tuning nor impossible

The gate is valid only if its revision defines a bounded native frontier whose state includes: token-table/index contents and remaining token-code budget; compressed-name/marker/sequence commitments; every link-relevant representation-size/address feedback datum; the selected deployment predecessor state; and all exact declared delta-encoder state.  Equivalent states must preserve every legal suffix token action, the whole native fixed-point transition, and all declared final costs.

The revision must give a recurrence, base/terminal cases, and an honest exact/FPT or certified-frontier complexity bound.  It must explain why this quotient is Linux-kallsyms-specific rather than a generic weighted dictionary optimizer, generic delta wrapper, beam/list search, scalar token-profit reweighting, or CP/ILP run.  The worst-case state explosion and a no-gain/degenerecy boundary must be explicit.

The required static two-version witness must use two fully native legal converged representations, preserve the frozen reader and final symbol relation, include exact frozen patch-byte accounting, and choose a different action than the current-only greedy constructor plus the declared finite stability grid.  It proves action divergence only—not a natural update benefit.

## Verdict and finite revision contract

`NATIVE_LINK_FIXED_POINT_PRESERVING_FRONTIER_DIVERGENCE` is confirmed as the sole permitted revision gate.  It closes if, in one auditable construction, all of these are present:

1. one pinned tag-pair/config/toolchain plus either online or offline deployment semantics;
2. a complete legal native representation grammar and link-fixed-point transition;
3. future-action- and full-cost-preserving state equivalence with exact/certified frontier guarantee;
4. a native static two-version action-divergence witness outside the full current policy union; and
5. a finite Stage A preclaim plan: tiny exhaustive native fixed-point oracle, stock/heuristic union replay, two adjacent official tag pairs, VCDIFF plus second-delta replay, and complete generator/link/patch/reconstruct/verify/lookup/deploy cost ledger.

If the construction instead needs a detached map encoder, changed reader/lookup/symbol relation, unbounded or arbitrary frontier, generic delta tuning, scalar token weighting, an input/config change, or a weakened guarantee, it must end `BELOW_Q2_STOP`.  Missing implementation, natural outcomes, or complete proof **now** are not STOP evidence.

## Sources and independence

- Frozen PRIMARY package was hash-checked `4/4`; its reported source pin is Linux `d58772d8520c7ef247c4b95c9bd76d3a25da9ff5`.
- Independent current-source/collision checks used the Linux source paths recorded in the primary (`scripts/kallsyms.c`, `kernel/kallsyms.c`, `scripts/link-vmlinux.sh`, `init/Kconfig`), [RFC 3284](https://www.rfc-editor.org/rfc/rfc3284.html), and the [2026 line-info delta patch](https://www.spinics.net/lists/kernel/msg6092798.html).  The latter confirms a nearby but different table representation.
- No candidate implementation, experiment, benchmark, Stage A or Stage B activity was performed.  No E-drive path was read or written.
