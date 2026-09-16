# CANDIDATE_GRADE_DEEP_REVIEWS

## D1 — AAPT2 resource-table emission: `NOT_ADMITTED_UNFROZEN`

- **Object / reader.** A fixed Android resource-id, configuration qualifier and resolved value relation, read through stock AAPT2/Android resource-table semantics—not an arbitrary APK ZIP layout.
- **Current reality.** Official AAPT2 documents `compile`, `link`, `optimize`, `dump` and `diff`; `optimize` already offers sparse encoding, resource-name collapse, path shortening, config splits and artifact retention. These are direct counterevidence and belong to the strongest union with all link/compile flags, manifest/framework inputs and resource config files.
- **Hypothesis / action.** If a held-out adjacent official release chain shows stable unchanged resource/config neighborhoods after controlling for resource-id changes, a predecessor-aware bounded DP could select legal string-pool/entry placement while retaining all identifier/configuration lookup semantics. Full cost would charge compile/link CPU, temp/RSS, table/APK bytes, VCDIFF bytes and stock resource lookup/startup cost.
- **72h killer.** Freeze two tiny official AAPT2 inputs and two adjacent natural app resource pairs; enumerate all current output/optimize modes and test two stock-dump-equivalent placements. Kill/hold if IDs/config resolutions change or an AAPT2 union arm replays the action.
- **Decision.** The full source/config union, direct collision audit and natural recurrence are open; do not infer absence from missing implementation. `NOT_ADMITTED_UNFROZEN`.

## D2 — LLVM indexed `.profdata`: `NOT_ADMITTED_UNFROZEN`

- **Object / reader.** Fixed instrumentation profile function-name/hash/count lookup as consumed by the same LLVM profile reader and `-fprofile-use` compiler path.
- **Current reality.** LLVM’s official format defines indexed profiles as on-disk hash tables and states reader backward compatibility; `llvm-profdata` already exposes merge, order, weighted inputs, binary/extbinary, sparse, compression and name representation controls. This is a substantial native union, not a missing-action claim.
- **Hypothesis / action.** Across adjacent official LLVM test/profile artifacts, control for changed functions, hash version, profile type and counters; then test a predecessor-aware hash-table record/bucket constructor. A bounded-context exact DP could retain legal current reader lookup while jointly charging profile bytes, delta bytes and lookup locality. It would be N2; N3 requires held-out recurring transition evidence.
- **72h killer.** Pin two LLVM tags and small official profile fixtures; exhaust `llvm-profdata` flags and source writer modes, prove two reader-equivalent on-disk arrangements, and check direct profile-layout literature. Stop/hold on union replay, changed lookup semantics or no controlled legal witness.
- **Decision.** `NOT_ADMITTED_UNFROZEN`: source/action and collision closure are not complete. No negative result is claimed.

## D3 — .NET R2R section placement: `NOT_ADMITTED_UNFROZEN`

- **Object / reader.** Fixed managed assembly metadata/IL observable behavior and stock CoreCLR ReadyToRun loader behavior for one target/runtime/reference-set contract.
- **Current reality.** Official runtime source contains Crossgen2 and R2RDump, and current upstream includes composite/partial-composite work. Those modes, compilation flags, PE/metadata/relocation and runtime loader contracts are mandatory union arms. Their closure was not obtained here.
- **Hypothesis / action.** For a fixed pair of official runtime/application versions, jointly schedule legal R2R sections/callsite artifacts to retain predecessor locality without changing managed semantics; charge build CPU/RSS/temp, final R2R bytes, delta bytes, loader/startup/read cost. A target-specific finite Pareto DP would need a source-derived section/dependency graph and an exact bounded-context guarantee.
- **72h killer.** Pin two official release inputs and a tiny runtime test assembly; enumerate Crossgen2/ILC composite flags, establish two stock-loader-equivalent layouts, then determine whether native composition already yields either choice. Fail closed on any changed PE/metadata/runtime contract or source absorption.
- **Decision.** `NOT_ADMITTED_UNFROZEN`: not a DROP based on resource/readiness, but insufficiently closed as a same-object action space.
