# OPENJDK-JIMAGE-VERSIONAWARE-LAYOUT-DELTA — Source and Collision Audit

- Review date/cutoff: `2026-08-11`
- Source policy: OpenJDK/Oracle first-party source and documentation; peer-reviewed/author-original papers only for paper-shape calibration.
- Search status: `SEARCH_BOUNDED_OPEN` for direct papers; the scientific STOP is independent of that search status.
- Research workflow used: academic-research-suite deep-research routing, with source-verification and devil's-advocate boundaries applied inline. External source text was treated as data, not instructions.

## Frozen-input integrity

| Item | Expected SHA-256 | Result |
|---|---|---|
| AGENTS.md | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` | PASS |
| plan.md | `B4F51DBA79ABB1EA420D2FAEB13290C4D4804C60CE7AE5A7A7859DAB2D0895B1` | PASS at assignment start |
| registry.yaml | `0AE48BAA6396178D93686701DE9D3EA04BC426D13AB4CC6CBDCD6629C9FDF8B2` | PASS at assignment start |
| ROLE_STAGE0_REVIEW.md | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` | PASS |
| Discovery brief | `4043409BEB6921B8BA56B6810F5B986A7ECB8E464B1F3AD9962381123982020F` | PASS |
| Discovery handoff | `0F317223DBB0E1A22CC71FB91D4261291233D21F42BA751621A4AF7B1433AB93` | PASS |
| Discovery manifest | `DD14DDB5F20B4024EA89FE579EFEEE0CCD5A871F7A5A2B04DD580B41FEBFC79F` | `7/7 PASS` |

## Current upstream reality check

| Source | Verification fact | Stage 0 consequence |
|---|---|---|
| [OpenJDK current `OrderResourcesPlugin`](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/src/jdk.jlink/share/classes/jdk/tools/jlink/internal/plugins/OrderResourcesPlugin.java) | `transform` sorts **all** `CLASS_OR_RESOURCE` entries by user-derived ordinal then path; unlisted entries use maximum ordinal/path tie break. `@file` lines populate paths as `line + ".class"`. | Candidate cannot call the action class-only while claiming non-class resources retain an untouched stream. A complete list/pattern action is already native. |
| [OpenJDK current `ImageFileCreator`](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/src/jdk.jlink/share/classes/jdk/tools/jlink/internal/ImageFileCreator.java) | `generateJImage` traverses transformed pool entries, writes locations/content and constructs image indices. | Resource order affects final bytes under stock reader; it does not make external list selection a new algorithm. |
| [OpenJDK current `JimageDiffGenerator`](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/src/jdk.jlink/share/classes/jdk/tools/jlink/internal/runtimelink/JimageDiffGenerator.java) and [`ResourceDiff`](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/src/jdk.jlink/share/classes/jdk/tools/jlink/internal/runtimelink/ResourceDiff.java) | Current facility computes resource-level added/removed/modified differences for packaged modules versus same-version optimized images. | Must be included as current related facility; it does not replace adjacent-version final-image delta evaluation. |
| [OpenJDK current `JlinkTask`](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/src/jdk.jlink/share/classes/jdk/tools/jlink/internal/JlinkTask.java) | Builds image provider and plugin stack; exposes linkable-runtime conditional path. | Complete pipeline, not an isolated plugin, is the same-object baseline. |
| [Current `make/Images.gmk`](https://github.com/openjdk/jdk/blob/bc674c21af6123be4a247e758728de870aa96eb5/make/Images.gmk) | Standard build invokes `--order-resources` with `**module-info.class`, optional `link_opt/classlist`, and package patterns. | Refutes a weak baseline that treats resource order as absent/default-only. |
| [Current `jlink` manual](https://docs.oracle.com/en/java/javase/25/docs/specs/man/jlink.html) | Documents module choice, compression `0/1/2`, endianness, plugin list and `--order-resources` exact path/pattern controls. | Freezes finite default/nondefault action/configuration union. |
| [JEP 220](https://openjdk.org/jeps/220) | Defines modular runtime image and `jrt:/` view. | Fixes reader/path semantics. |
| [RFC 3284](https://www.rfc-editor.org/rfc/rfc3284.html) | Defines VCDIFF. | Required external same-information final-image delta comparator. |

### Pin and transport record

The official upstream GitHub API was queried read-only on 2026-08-11. `master` HEAD was `bc674c21af6123be4a247e758728de870aa96eb5` (2026-08-10T19:52:18Z), exactly matching the Discovery pin. Read-only source retrieval was required because a non-escalated Windows HTTPS request failed with a connection error; the subsequent approved read-only retrieval returned HTTP 200. This transport event is not used for any scientific inference.

## Source-quality matrix

| Source | Evidence class | Currency | COI/predatory check | Use |
|---|---|---|---|---|
| OpenJDK source/docs/JEP | first-party authoritative implementation/specification | current/pinned | project maintainers; appropriate for API/source facts | Grade A for native behavior |
| RFC 3284 | standards-track specification | foundational | none material | Grade A for VCDIFF format boundary |
| Basso et al. CGO 2025 | peer-reviewed conference paper | current | ordinary author/venue disclosure; no issue found | Grade A for paper-shape calibration |
| Basso et al. PACMPL/OOPSLA 2025 | peer-reviewed journal/conference proceedings | current | artifact disclosed; no issue found | Grade A for ordering-paper calibration |

No predatory source was used. No publication is cited as support for a same-object direct collision unless explicitly marked as such.

## Paper/collision search

Queries, cutoff 2026-08-11:

- `"jimage" layout ordering delta compression paper`
- `"jlink" "order-resources" paper`
- `"Java runtime image" layout optimization delta`
- `"version-aware" layout delta compression ordering`
- current OpenJDK source/doc checks for jimage ordering, runtime-linkable diff and default image build.

Results: current jlink/order-resources evidence and OpenJDK mailing-list/source discussion establish a strong native action boundary. No verified paper was found that directly covers the conjunction of fixed adjacent-version OpenJDK jimage, same stock reader, predecessor-aware class-list construction and a target-specific finite-state theorem. This remains `SEARCH_BOUNDED_OPEN`; it is not an absence claim.

## Evidence / inference / hypothesis ledger

| Status | Statement |
|---|---|
| FACT | Current `OrderResourcesPlugin` sorts all `CLASS_OR_RESOURCE` entries by ordinal and path, not only an explicitly supplied class subset. |
| FACT | The current standard OpenJDK image build supplies resource-order rules and optionally a generated class list to `jlink`. |
| FACT | `ImageFileCreator` writes the transformed resource pool into the native image and builds location/index data for the stock reader. |
| FACT | Discovery's DP is exact only after a finite list family and actual pairwise delta edges are materialized. |
| INFERENCE | The stated DP is isomorphic to ordinary shortest path on a finite layered graph and therefore lacks a target-specific N2 contribution. |
| HYPOTHESIS | A better class-order list can improve image/delta cost. It is not tested and would not cure the generic-collapse finding. |

## Devil's-advocate stress test

- Strongest counter-argument: “jimage constraints and actual VCDIFF edges make the selection target-specific.” Rebuttal: those constraints define vertices/weights, but the claimed solver still receives the fully materialized graph and performs generic path selection; no jimage-specific state compresses the action history or changes the generic guarantee.
- Remove current default order-resources source: the proposal remains a generic finite configuration selector, so the stop still holds.
- Flip the question: if generic finite layered DP were accepted as N2 here, any output-list plugin plus any delta codec could be repackaged as a paper. That violates the non-wrapper rule.
- Severity: `CRITICAL`, because it invalidates the central N2 claim even under favorable measurements.

## Limitations and AI disclosure

- A live direct-paper collision search is bounded; direct-collision status is not claimed closed.
- No OpenJDK tag/image/JMOD download, build, benchmark or candidate implementation was run.
- AI assisted source routing, static source comparison, adversarial analysis and report drafting. It did not generate empirical results or claim that an unperformed experiment failed.

