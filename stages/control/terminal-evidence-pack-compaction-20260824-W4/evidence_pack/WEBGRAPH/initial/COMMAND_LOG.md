# WEBGRAPH-REFERENCE-FOREST Stage A Command Log

- Lane: `CANDIDATE_EXECUTION_LANE_1`
- Assignment: `STAGEA-L1-20260810-WEBGRAPH-REFERENCE-FOREST-INITIAL-V8.7`
- Unique write root: `D:\project\writing\reserch\stages\stageA\WEBGRAPH-REFERENCE-FOREST`
- Stage B: `false`
- Claim-bearing run permitted before fidelity PASS: `false`

## Intake

1. Read the mandatory project entry, current plan, registry, candidate-owner rule, Stage A/Q1/user/handoff templates, and academic-research-suite experiment/reproducibility instructions.
2. Independently rehashed the decisive Stage 0 package. Report, handoff, and manifest match the mainline freeze exactly; the manifest contains 2/2 entries.
3. Declared no queue/other-candidate preread and no cross-assignment scientific reuse.
4. Created `RESOURCE_SCOPE_FREEZE.yaml` before any source download or build.

## Official source acquisition

5. In-sandbox `curl.exe` calls to the crates.io download API failed with Schannel `SEC_E_NO_CREDENTIALS`. The approved API transport then returned HTTP 403 and produced no accepted archive.
6. Corrected only the official asset endpoint to `static.crates.io`. Downloaded `webgraph-0.6.2.crate` (`461,292 B`) and `webgraph-cli-0.4.2.crate` (`61,826 B`) into the temporary directory.
7. Retrieved first-party crates.io release metadata with an explicit research-artifact user agent. Published checksums exactly matched local bytes: `43EE3444AD9A8109842BD7309B099E147FF874BAE36F7438F8F7C813D5FB696A` and `9FD9B9DCFC8972408DF4335AA261941D879A3E37FE06262F9828413B3CCFC638`.
8. Moved only verified archives/metadata to `downloads/verified`, then extracted. Both packages record VCS SHA `6b230673fd8f09ee31e81f09b921671678804de2`; crates.io metadata declares Rust MSRV `1.85`.
9. Read the released `BvCompZ` implementation. It enumerates root plus nonempty in-chunk predecessor actions, stores native estimator costs, selects a best-parent forest, applies its bounded-depth subforest DP, greedily refills legal alternatives, and sends the chosen forest through the native writer.
10. Created `TOOLCHAIN_FREEZE.yaml` before portable toolchain download.

## Portable toolchain closure

11. Downloaded the official MSYS2 base archive `20260322` and verified its detached published SHA-256 before extraction. Extraction and package operations were confined to `toolchain/msys64`; no installer, registry, service or global `PATH` mutation was used.
12. Initialized the local pacman keyring and completed the signed base update. The first update invocation returned exit 1 only when the just-replaced MSYS runtime could not terminate its parent; a fresh invocation completed the signed transaction. This environment-correction retry did not execute candidate code.
13. Before installation, queried the signed repository databases and froze exact versions in `TOOLCHAIN_FREEZE.yaml`. Installed only portable Clang64 packages. Verified `rustc 1.97.0`, `cargo 1.97.0`, `clang 22.1.8`, `cmake 4.4.2`, and `ninja 1.13.2` from the topic-local tree.

## Contract freeze

14. Created `EXPERIMENT_CONTRACT.yaml` before any candidate build, tiny run, structural search or natural-corpus acquisition. It fixes the exact native object/config (`BE`, released default codes, interval 4, `W=4`, `D=3`, chunk 128), complete BvCompZ comparator, exact candidate recurrence, independent exhaustive tiny check, 2,048-case nonadaptive structural domain, conditional natural route, full-cost dimensions and fail-closed boundaries.
15. Before any execution, corrected one internal domain inconsistency in the frozen declaration: structural cases contain 24 nodes because the declared successor universe is `0..24`; the initial `nodes_per_case: 12` would have made successors 12--23 illegal under the exact graph object. No result existed or was inspected when corrected.

## Build fidelity corrections (pre-observation)

16. The first sandboxed Cargo dependency fetch failed with Windows Schannel `SEC_E_NO_CREDENTIALS`; it was interrupted after repeated identical retries and produced no binary or observation. The policy-required approved crates.io-only retry downloaded the lock-resolved dependencies into topic-local `toolchain/cargo-home`.
17. The first compilation then failed before linking because released `mmap_helper.rs` places a rustdoc comment on a Windows macro invocation while the crate denies `unused_doc_comments`. Applied the same non-semantic `///` to `//` portability edit to mechanically copied baseline and candidate trees; no statement or control flow changed. The immutable verified release extraction under `sources/` remains untouched. Updated the contract boundary before any run.
18. The next compile reached only the harness and failed because `BE` is not re-exported by the WebGraph prelude. Added the already lock-resolved `dsi-bitstream 0.7.0` as an explicit harness dependency and imported its `BE` marker; this changes no experiment semantics.
19. The first tiny invocation without the topic-local runtime `PATH` returned exit 1 before program output. With the frozen process-local `PATH`, native compression, sequential equality and offset checking completed, then random-access load failed exactly because `tiny-candidate.ef` did not yet exist. Preserved that audit as a failed preclaim attempt. Added the released first-party test helper that reproduces `webgraph build ef` from `.offsets`; its time and bytes are separately counted. No claim-bearing run occurred.

## Preclaim fidelity gate

20. Rebuilt both copied trees offline. Candidate and unmodified-selection baseline then completed the same nine-node native fixture. The independent Node validator exhaustively enumerated `38,372` legal forests and matched the candidate's exact `148`-bit optimum and lexicographic reference vector. Final BvCompZ also selected that vector.
21. The candidate's selected-action estimator→writer assertions and sum/additivity assertion passed. Candidate and baseline `.graph`, `.offsets`, and `.properties` hashes are pairwise identical. Both native sequential and random-access readers, offset checker, EF construction, and fixed 4,096-query checksum passed.
22. Recorded `results/preclaim/PRECLAIM_GATE_RESULT.md` with status `PASS`. This closes only execution fidelity; no scientific revision or claim-bearing observation existed yet.

## Structural-domain freeze

23. Generated all `2,048` cases in the preregistered four equal strata without running either algorithm. Generator SHA-256 is `69CF5FCADD009A8806F682BC88E1DC02C2040D521239CC9D8EA3FE479D92FFDB`; the 2,048-entry input manifest SHA-256 is `76AFBD0E5C207C267F91AD519C56A628E19E4B756AB49678C8CE83E0F3FA481A`. Total case bytes are `1,098,273`. This freezes the first claim-bearing denominator.
24. The direct structural-runner invocation was rejected by the machine's PowerShell execution policy before script execution. Reinvocation with process-only `-ExecutionPolicy Bypass` (no system policy change) then stopped before the first case because Windows PowerShell 5.1 lacks `.NET`'s newer `ProcessStartInfo.ArgumentList`. Replaced only that call with safely quoted `Arguments`; no audit/metrics file or claim-bearing observation was produced by either failed invocation.

## Claim-bearing structural killer

25. Executed all 2,048 frozen cases in manifest order. Every process exited zero; candidate native estimator→writer/additivity assertions, sequential equality, offsets, EF construction and random-access equality passed.
26. Post-run analysis (not consulted during generation/execution) found `531/2,048` strict native graph-stream divergences (`25.9277%`), `45` tie-only different vectors, and `1,472` identical vectors. Exact DP was never worse. First strict case is `case-0043`: final BvCompZ `561` bits vs exact `560` bits with two changed actions. This is the first claim-bearing observation in the initial Stage A assignment. It does **not** consume the separately permitted scientific `REVISE_ONCE`.
27. Replayed `case-0043` through a separately built unmodified-selection baseline writer. It returned `561` bits and passed both readers, while the candidate returned `560`. Both padded `.graph` files are `72 B`; their graph hashes and offsets hashes differ, and `.properties` records the exact respective bit lengths. This is structural action/bit headroom, not yet a persistent byte or full-cost natural result.

## Conditional natural-corpus freeze

28. Created `NATURAL_CORPUS_FREEZE.yaml` before natural acquisition or execution, retaining the contract's LAW `cnr-2000` native order and SNAP `Wiki-Vote` ascending-ID object. It freezes URLs, provenance, Wiki-Vote duplicate/self-loop semantics and the unchanged native configuration.
29. LAW HTTPS negotiation failed under both Windows Schannel and the topic-local OpenSSL curl; the already frozen official-host HTTP endpoint returned the native graph (`1,164,843 B`) and properties (`982 B`). Downloaded those plus the directory provenance page, hashed them, then moved accepted bytes from temporary storage to `inputs/natural/raw`.
30. The first SNAP GET using Windows Schannel ended with a missing `close_notify` before accepted output. Topic-local OpenSSL curl completed the same frozen official HTTPS assets. Raw Wiki-Vote gzip SHA-256 is `7D3E53626E14B8B09FB3B396BECE9D481AD606BD64CEAB066349FF57D4ADA7FC`.
31. Converted Wiki-Vote exactly under the preregistered ascending-ID rule: `7,115` nodes, `103,689` unique directed arcs, zero duplicates and zero self-loops. Exact list-object SHA-256 is `0C6E2D232478628E55EA153B268392E474628F39E2E77A247578676381FBB848`. Created `inputs/natural/NATURAL_INPUT_MANIFEST.yaml` before compression.
32. The first natural runner stopped on `cnr-2000/baseline` before input decoding because the historic native `.graph` is one byte short of the released Rust reader's required 32-bit mmap padding. No output metric, candidate audit or natural observation was produced. Added exactly one trailing zero byte to a derived copy, retaining the downloaded raw file and properties unchanged; this is the upstream-prescribed padding operation and changes no encoded bit or successor list.

## Natural killer execution

33. With the padded exact-equivalent input, all four frozen tracks exited zero. Native sequential equality, offsets, EF construction, per-node random equality and fixed query checksums passed for both variants on both corpora.
34. Raw graph-stream results: `cnr-2000` final BvCompZ `9,319,309` bits versus candidate `8,763,554`; Wiki-Vote `876,503` versus `875,555`. The corresponding `.graph + .offsets` residuals are `72,792 B` and `136 B` before adding the one-byte properties difference. These are persistent native size residuals.
35. Full execution costs preclude an optimizer-speed claim: end-to-end process elapsed time was `0.451 s` versus `47.167 s` on `cnr-2000`, and `0.102 s` versus `1.330 s` on Wiki-Vote; candidate peak working set was also higher (`69,992,448` versus `66,301,952 B`, and `16,265,216` versus `13,524,992 B`). Reader checksums are equal; repeated reader-only measurement is required before any access-nonregression statement.
36. Ran eleven reader-only repeats per saved native output, excluded repeat 0 as the frozen warmup, and analyzed ten. Sequential full-decode checksums and 100,000-query checksums were stable and pairwise equal. Candidate random-access p50/p90 ratios were `1.094/1.083` on `cnr-2000` and `1.042/1.056` on Wiki-Vote. This stable access regression fails the preregistered no-access-regression success condition; sequential decode showed no consistent regression.
37. Final scientific recommendation is `REVISE_ONCE`, not PASS or STOP. The same-object mechanism has real structural and persistent size headroom, but the frozen full-cost acceptance rule is not met because exact construction is much slower, peak RSS is higher, and random access regresses. The initial assignment leaves the one scientific revision unused for mainline/gate adjudication.

## Delivery closeout

38. Produced the canonical Stage A report, results, Q1/Q2 matrix, user review packet, resource/cost ledger, source manifest and handoff. Stage B remains false with approval `null`; the only requested transition is independent Stage A gate adjudication of `REVISE_ONCE`. No mainline/control file or external location was modified.
39. Prepared a canonical all-file manifest generator/verifier. No deliverable is modified after manifest generation; manifest self-hash and verified entry count are reported to mainline out of band to avoid a self-referential hash cycle.
