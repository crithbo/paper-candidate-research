# Command Log — Resume 1

- Lane: `CANDIDATE_EXECUTION_LANE_3`
- Assignment: `STAGEA-L3-20260811-LLVM-BITCODE-ABBREV-PLANNER-RESUME1-V8.7`
- Unique write directory: this `resume1` directory
- Old candidate root: read-only
- Stage B authorization: false

## 2026-08-11 — intake and continuity

1. Re-read `AGENTS.md`, `plan.md`, `registry.yaml`,
   `rules/ROLE_CANDIDATE_OWNER.md`, ARS `SKILL.md`, the ARS academic-pipeline
   workflow, the pause checkpoint, the complete frozen Discovery/Stage 0
   packages, and the required Stage A templates.
2. Registry binding verified:
   `ACTIVE_LLVM_BITCODE_ABBREV_PLANNER_RESUME1`, this assignment id, this lane,
   this write directory, `execution_allowed=true`, `stageb_authorized=false`.
3. Recomputed the checkpoint and all listed core/upstream hashes without
   modifying the old tree. The deterministic continuity input freeze is
   `edd6b635484828d2e98a51ba5916c9503a847ba1d1fb7d3e34826aa78249502e`.
4. Confirmed the old native baseline and identity re-emission remain identical
   at SHA-256
   `3b8facdb17349e321355bf4153e3c0b5d9949629a31ac66e12d53922da62edd7`.
5. No natural claim-bearing run has started. The old failed-offset rewrite is
   retained as `CODEC_OR_IMPLEMENTATION_CONTROL__NON_CLAIM_BEARING`.

## 2026-08-11 — pinned public headers and B0 source audit

1. `scripts/fetch_pinned_headers.py` first attempted the exact-commit GitHub
   Contents route.  HTTP 429 occurred before any claim-bearing run; the script
   was amended to fall back to exact-commit GitHub raw and official LLVM
   Gitiles and to require byte equality when both fallback routes were used.
2. Acquired eight source/header/license files (82,199 bytes total) into
   `resume1/inputs/upstream_sources`.  URL, byte count, SHA-256, Git blob ID,
   commit, license, and successful route are frozen in
   `inputs/PINNED_HEADER_MANIFEST.tsv`.  No system install or global mutation
   occurred.
3. Ran `scripts/audit_b0_source.py` over the read-only pinned writer sources and
   the resume header set.  It emitted 429 action-callsite rows, nine flag rows,
   and six source-summary entries.  Outputs are the three `results/B0_*` files.
4. Compared normalized release/current callsite inventories and inspected the
   complete `llvm-as` entry route plus public writer/reader interfaces.  The
   bounded human classification is recorded in `B0_CURRENT_NATIVE_AUDIT.md`.

## 2026-08-11 — native ID-width witness construction

The next command is a pre-claim legality/equivalence witness, not a natural
claim-bearing observation.  It creates native STRTAB variants with four and
five local definitions, crossing code width 3 to 4 while retaining the exact
expanded semantic trace and decoded Module.

## 2026-08-11 — interruption-safe fidelity closure

1. Rechecked the resume continuity manifest after the application interruption.
   All immutable inputs and all eight pinned headers match.  `plan.md` and
   `registry.yaml` legitimately differ because they are live mainline-owned
   controls; the current registry still binds this same lane, assignment, and
   write directory.  Evidence: `results/CONTINUITY_RECHECK.json`.
2. `scripts/native_witness.py` produced the four- and five-definition native
   variants.  The 3-to-4 CodeLen step, expanded-trace equality, canonical IR
   equality, and all native checks passed.
3. A first top-level-BLOCKINFO scope construction was rejected by the LLVM IR
   reader (`Invalid abbrev number`).  It remains a pre-claim implementation
   control and was not used for a gate or scientific inference.  The corrected
   capacity-neutral MODULE-BLOCKINFO construction moves the live VST/FNENTRY
   grammar, preserves BLOCKINFO words and offsets, and passes all native checks.
4. `scripts/wl_sldp_planner.py` now charges every ID at the induced fixed block
   CodeLen, exact definition bits, record payloads, Blob alignment, END/alignment,
   and block words.  Smoke sizes are B0/B1/B2/WL = 1736/1728/1728/1728 bytes;
   every arm passed strict common-denominator verification.
5. `scripts/tiny_exact_ceiling.py` independently enumerated 206 tiny
   subset/order cases and all assignments.  B3 and WL-SLDP both reached 160
   bits.  This is a non-natural ceiling only.
6. The five-part gate is recorded PASS in
   `PRE_CLAIM_CONTRACT_FIDELITY_GATE.md`.  No natural source archive or module
   arm had been acquired or run before this boundary; no scientific revision
   was consumed.

## 2026-08-11 — post-gate natural corpus freeze

1. `git ls-remote` and PowerShell HTTPS failed with Windows Schannel
   `SEC_E_NO_CREDENTIALS`; Python anonymous HTTPS remained functional.  The
   official GitHub API resolved signed tag `llvmorg-22.1.8` to tag object
   `6ec524803ed4b104f6eeed8809708c666c518927` and commit
   `28d2f36a29e8bb5de329a828f07729de66df0a9c`.
2. `scripts/fetch_corpus_archive.py` fetched the exact codeload archive.  One
   chunked transfer ended with `IncompleteRead`; the same URL was retried with
   Range-if-supported and tar-integrity completion.  Final archive: 360,676,319
   bytes, SHA-256 `e120b213...c1c`; 4,010 selected files/18,915,023 bytes were
   safely extracted.  This was resource handling, not a scientific result.
3. `scripts/build_natural_corpus.py` wrote its deterministic preregistration
   before compiling.  A pipe-backpressure bug in the measurement wrapper made
   `llvm-bcanalyzer` appear to hang; the resumable command was safely stopped,
   stdout/stderr were drained concurrently, and the same preregistration resumed.
4. The frozen corpus contains 100 distinct native-verified modules (99 C, 1
   C++), 484,840 total bytes, across four balanced O/debug strata.  Freeze
   SHA-256: `74dd2105...ebc0`.  All 107 failed/duplicate/invalid attempts remain
   in the freeze record.

## 2026-08-11 — claim-bearing bounded Stage A run

1. `scripts/run_stagea_corpus.py` ran the frozen 100 modules only after gate
   PASS and corpus freeze.  Bounds: universe 10 per eligible leaf, six selected
   definitions per leaf, 12 per module; five native read processes per arm.
2. All 400 arm files passed expanded trace, native parse/disassembly, canonical
   IR, `opt verify`, and read checks.
3. Totals: B0 484,840 B; B1 484,604 B; B2 484,520 B; WL 484,520 B.
   WL saved 320 B versus B0 on 63 modules, but WL and B2 hashes were identical
   on 100/100.  Strongest-union residual coverage = 0/63 = 0%; p50/p90 residual
   = 0/0 B.
4. Measured cumulative CPU = 71.390625 s (0.019831 h); max planner RSS =
   35,074,048 B; max native RSS = 17,055,744 B.  Topic workspace =
   1,454,520,629 B (1.354628 GiB).
5. Owner disposition: `STOP_RECOMMENDED` because B2 absorbs all candidate
   benefit and natural residual is below 10%.  This is a scientific negative,
   not a resource failure.  Stage B remains false; shared control files remain
   untouched.

## 2026-08-11 — owner package freeze

1. Completed `STAGEA_REPORT.md`, `RESULTS.md`, `Q1_COMPARATOR_MATRIX.md`,
   `USER_REVIEW_PACKET.md`, `handoff.yaml`, the frozen contract, gate/action
   audit, scripts, exact inputs, per-module results, and controls.
2. Confirmed the six zero-byte placeholders in the old candidate root still
   exist and remain untouched.  One zero-byte interrupted compiler temporary in
   resume1 is intentionally retained and excluded by the frozen corpus list.
3. Ran `scripts/hash_manifest.py write` followed by `verify` over every resume1
   file except the self-manifest.  The final verification result and manifest
   SHA-256 are reported to mainline with the handoff.
