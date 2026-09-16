# Candidate-grade deep review — UOF-251-01

## Current-upstream reality check

| facet | pinned current evidence | effect |
|---|---|---|
| logical semantics | [JEP 220](https://openjdk.org/jeps/220) specifies the modular runtime image, `jrt:/` resource retrieval and NIO filesystem enumeration | fixes resource/path/byte lookup semantics; internal layout is not an excuse to change observable content |
| writer | [ImageFileCreator at `bc674c21`](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/src/jdk.jlink/share/classes/jdk/tools/jlink/internal/ImageFileCreator.java) | current writer generates header/index/location/string/content structures in resource-pool traversal order; layout is a real construction input |
| reader | [ImageReader at `bc674c21`](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/src/java.base/share/classes/jdk/internal/jimage/ImageReader.java) | unchanged stock reader supplies lookup/read oracle |
| native ordering action | [OrderResourcesPlugin at `bc674c21`](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/src/jdk.jlink/share/classes/jdk/tools/jlink/internal/plugins/OrderResourcesPlugin.java) | plugin supports an ordered list and patterns, sorting class/resource entries by ordinal/path. This is a strong action baseline, not absence evidence. |
| current diff facility | [JimageDiffGenerator](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/src/jdk.jlink/share/classes/jdk/tools/jlink/internal/runtimelink/JimageDiffGenerator.java) and [ResourceDiff](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/src/jdk.jlink/share/classes/jdk/tools/jlink/internal/runtimelink/ResourceDiff.java) | records packaged modules versus same-version optimized resources for linkable runtime; contrary evidence to any claim that jlink has no diff facility, but not a predecessor-version layout optimizer |
| flags/defaults | [current jlink manual](https://docs.oracle.com/en/java/javase/25/docs/specs/man/jlink.html) documents module path/add-modules, compression `0/1/2`, ordering, strip-debug, plugin disable and endian; [JEP 493](https://openjdk.org/jeps/493) adds a build-time `--enable-linkable-runtime` capability that is not default | Stage A must freeze exact `jlink --help --list-plugins`, configure flags and all plugin parameters; no inferred default is used here |

No current absence claim is made.  The residual is decision-rule-specific: current `order-resources` consumes a supplied order, whereas the proposed bounded algorithm produces the order from same-information predecessor/current resource sets and a fixed cost objective.  Current resource diffs serve a distinct same-version reverse-linking purpose.

## Strongest fair composition and algorithm guarantee

Baseline B is: current complete jlink pipeline at the pinned source, including every applicable default/nondefault plugin and `order-resources` action, then VCDIFF/binary differencing from `E_{i-1}` to final `E_i`; it receives `M_{i-1}, E_{i-1}, M_i` and the same deployment weights.  Comparator B may also supply a manually chosen complete order list, so Stage A must include: lexical/no-order; documented stock ordering; profile/order list; and per-version best local order found under the same finite candidate set, each followed by identical delta.

The candidate partitions unchanged **class** paths into deterministic, nonempty path-prefix/module blocks; non-class resource order stays as current jlink emits it.  Blocks retain canonical internal order.  It deterministically materializes a declared finite `w`-bounded order family for each release, then computes actual pairwise delta edges between complete candidates and uses dynamic programming across release candidates.  The release-chain DP is exact over this finite bounded family in `O(sum_i |F_(i-1)|*|F_i|)` delta-edge evaluations; it does not claim an unrestricted layout optimum.

## Full cost, fidelity and killer

Full denominator: selected image and `lib/modules` bytes; predecessor→target VCDIFF/binary-delta bytes; source/JMOD acquisition hashes; algorithm/list-generation and complete jlink build CPU/RSS/temp storage; final launch/startup and stock jimage resource-read CPU/RSS; semantic enumeration/hash verification; all plugin configurations.  The oracle enumerates `jrt:/modules` paths, compares each resource byte, and runs a fixed launcher/read suite.

Finite natural route: 20–50 chronological official tags, one platform and full configuration/toolchain pin; train and later holdout releases.  **72-hour killer:** stop if (1) oracle differs; (2) an existing current pipeline/order configuration reproduces the candidate sequence/objective under equal information; (3) required layout action entails changed modules/resources/custom reader; (4) candidate frontier cannot be generated within its declared bound; or (5) no held-out residual remains across full cost.

`structural_paper_potential`: conditional `TIER_B_Q2_VIABLE`; it is a complete same-object N2 layout algorithm with a formal bounded guarantee, fair current composition and finite natural route.  `current_evidence_readiness`: moderate-low; source/action/reader/flags boundary and static witness are closed, but no artifact/result is claimed.  Direct paper collision remains `SEARCH_BOUNDED_OPEN` for Stage0 independent review.  Decision: `PROPOSE_STAGE0`.
