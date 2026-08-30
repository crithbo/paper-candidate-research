# Independent Stage 0 confirmation — AArch64 HWASan stack-tag register-pressure Pareto DP

- Assignment: `STAGE0-C2-20260814-AARCH64-HWASAN-STACKTAG-REGISTER-PRESSURE-PARETODP-CONFIRM-V8.7`
- Role: independent confirmation sentry
- Decision: `CONFIRM_REVISE_ONCE`
- Conditional tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__SEARCH_BOUNDED_OPEN`
- Stage A/B authorization: `false` / `false`
- Scientific revision executed here: `false`

## Independent result

The PRIMARY conclusion is confirmed only after a material correction to its
current-union catalogue.  A finite, same-object N2 closure remains possible,
so this is not a scientific STOP.  But the proposed revision must explicitly
separate HWASan from AArch64 MTE stack tagging before it may claim a two-plan
frontier.

LLVM's HWASan implementation uses the `sanitize_hwaddress` route.  It derives
one stack base tag, derives each alloca tag from a fixed `retagMask(AllocaNo)`
(or a tag-generation call), replaces alloca uses with that tagged address, and
places lifetime and exit tagging/untagging around the alloca.  The official
design gives the same base-tag/ReTag reason: avoiding M live tagged stack
pointers.  These are real same-object primitive actions, not a missing
implementation.

However, `AArch64StackTagging.cpp` returns without action unless the function
has `Attribute::SanitizeMemTag`; it has no `SanitizeHWAddress` path.  Its
`tagp`, `NextTag`, and `settag` sequence is therefore an MTE/MemTag mechanism,
not an automatically composable HWASan action or HWASan comparator.  The
PRIMARY packet's B1 wording incorrectly called that path same-object.  This
does not establish absorption; it invalidates use of that path either as the
candidate's second plan or as a same-object subtractor.

## Gate ruling

The one permitted gate remains:

`SAME_REPORT_TWO_PLAN__LIVE_TAG_RETAG_ASSIGNMENT_FRONTIER_CERTIFICATE`.

It is finite and potentially contribution-bearing only if its revision:

1. pins `sanitize_hwaddress` (including default and selected non-default
   HWASan controls), AArch64 Linux ABI/unwind, and the exact downstream
   AArch64 register-allocation/frame pipeline; it must exclude
   `SanitizeMemTag`/MTE `tagp` actions unless the frozen object itself changes,
   which is disallowed;
2. supplies two compiler-realizable plans for one fixed function whose
   alloca-layout, tagged pointer/shadow updates, every declared checked access,
   short-granule treatment, lifetime-end behavior, result, ABI and unwind are
   equal under the declared report/no-report trace contract;
3. identifies the union-external choice as a whole-function alloca-index /
   retag-assignment / live-materialization plan.  Merely observing HWASan's
   existing fixed `FastMasks`, replacing it with post-pass register allocation,
   or using an MTE action is not an N2 residual;
4. defines a bounded target state which preserves every future legal HWASan
   tag/lifetime action and every declared full-cost component, then proves the
   path-to-native-plan correspondence and an exact, FPT, or certified-Pareto
   recurrence with a stated cap/no-gain boundary; and
5. freezes a finite Stage-A preclaim falsifier: small exhaustive native-plan
   enumeration, stock report-vector equivalence (including lifetime and short
   granules), B0 plus genuine HWASan/downstream-native comparator coverage,
   and planner/compile/RSS/frame/spill/tag/check/runtime full cost.

The report/no-report constraint is substantive.  A changed retag mapping can
alter whether a stale pointer collides with the lifetime-end tag; functional
equivalence or a no-bug trace alone is insufficient.  Conversely, the absence
of an implementation, native replay, performance result, or natural-corpus
win is not negative evidence at Stage 0.

## Absorption and collision review

Current HWASan demonstrably fixes a base-tag and alloca-number mask path, but
the reviewed source does not itself select a whole-function pressure-aware
assignment subject to the complete report vector and downstream full cost.
Generic downstream register allocation does not prove such a source-level
tag/lifetime-plan frontier is absorbed.  Thus no direct same-object absorption
or formal impossibility was established.  The bounded latest-collision review
remains `SEARCH_BOUNDED_OPEN`; no failed retrieval is used as an absence claim.

## First-party evidence used

- [Clang HWASan design](https://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html), Stack and Instrumentation sections: one base tag plus `ReTag(BaseTag, M)`, aligned/tagged stack objects, shadow/pointer matching, and short-granule semantics.
- [LLVM HWAddressSanitizer.cpp](https://llvm.org/doxygen/HWAddressSanitizer_8cpp_source.html), current source: `getStackBaseTag`, `getAllocaTag`, `instrumentStack`, alloca-use replacement and lifetime tag/untag.
- [LLVM AArch64StackTagging.cpp](https://llvm.org/doxygen/AArch64StackTagging_8cpp_source.html), current source: the pass guards on `Attribute::SanitizeMemTag`, not `SanitizeHWAddress`.

## Disposition

Authorize exactly one scientific revision of the named gate; this confirmation
does not execute it.  If that revision cannot exhibit a genuine HWASan-only,
same-report two-plan action divergence and target-specific frontier guarantee,
the pre-registered failure sentinel applies:
`BELOW_Q2_STOP__CURRENT_HWASAN_STACKTAG_COMPOSITION_OR_GENERIC_RA_PACKAGING`.

