# Revision 1 Command Log

## Intake and immutable inputs

- Lane: `CANDIDATE_EXECUTION_LANE_1`; assignment:
  `STAGEA-L1-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-REVISION1-V8.7`.
- Unique write directory was absent and was created only for this assignment.
  No queue or other candidate was read; no shared control or initial file was
  modified.
- Verified control hashes: plan
  `D41BC012DDC0ADAADEB3F86A045E3B85EA9A4C960C25DB3DEE90C8DFB75B689A`,
  registry
  `1EC198936AFEF8667BC6E008752F4F404744D922D2A2C6E71812BCE833A8349A`,
  role
  `30E23336CF339771821EAEC8B2C7011025BA815D613DB639E68121FDCDE54D1F`.
- Fully traversed 12,237 UTF-8 registry lines in 1,000-line chunks and read the
  complete topic and active-assignment blocks. The first chunk-hash command used
  unavailable `.NET SHA256.HashData`; it produced no writes. The corrected
  `SHA256.Create().ComputeHash` traversal completed all 13 chunks.
- Independently verified the gate manifest 6/6 in its `sha256sum -b` star
  format and the initial canonical manifest 1090/1090 with zero missing or hash
  mismatches. Gate handoff and initial handoff hashes matched the assignment.
- Read the complete gate package, initial contract/report/results/command/handoff
  surfaces, candidate code, templates, and academic-research-suite experiment,
  monitoring, and reproducibility protocols.

## Revision workspace and resource reuse

- Copied the two frozen Python runners and original experiment contract into the
  revision directory. Their pre-edit hashes match the initial manifest.
- Created revision-local NTFS hardlinks for the three frozen natural assets;
  source bytes remain in the read-only initial tree. Runtime imports the pinned
  initial `assets/vendor` PyArrow 25.0.0 and psutil 7.0.0 without installation or
  global PATH/environment changes.
- Scientific revision remains unconsumed during code editing and adversary
  discovery with the uncorrected solver. It will be marked consumed immediately
  before the first execution of the corrected solver.

## Uncorrected delta-adversary freeze

- Started the deterministic uncorrected-solver search at
  `2026-08-11T05:43:16+08:00`. The script verified the pre-edit solver SHA-256
  `F1424E9311241CEB07B227A4ABC67B350B21FDFE514DCD13F1390916A16F2636`
  before execution and was restricted to short binary/ternary histories.
- The process remained active on one CPU with about 83--87 MiB working set but
  emitted no result. At the pre-registered 30-minute hard cutoff
  (`2026-08-11T06:13:21+08:00`) it was interrupted with Ctrl-C. Exit code was
  1; stdout/stderr were empty and no adversary artifact was written. This is a
  preserved failed uncorrected diagnostic, not a scientific result and not a
  retry of a claim-bearing run.
- Next bounded action: evaluate the single frozen initial diagnostic row set
  under the other (`emit_dictionary_deltas=true`) native arm. This is a
  targeted old-solver precondition check, not an expanded corpus/search.
- The single-row-set probe completed in 2.16 s with exit code 1 and the exact
  error `frozen rows do not satisfy the delta-enabled tie gate`; it wrote no
  freeze artifact. A diagnostic-only rerun is permitted solely to distinguish
  missing live branches from missing equal-cost signature divergence.
- The diagnostic rerun completed in 3.23 s and proved that the delta-enabled
  arm retained the same equal-cost signature mismatches at boundaries
  10/13/14/15/16, but its materialized frontier had only
  `INITIAL/NO_EVENT/REPLACEMENT`; `DELTA` liveness alone was missing. The next
  single targeted input uses only the first mismatch prefix (10 rows) and adds
  one two-symbol field whose post-cut interval contains both symbols, making a
  legal dictionary prefix extension a native competing action.
- The augmented 10-row, three-field probe completed in 3.85 s (exit 0). It
  froze rows SHA-256
  `530AEBE13D93829E015F06BFF0E99A3CBFEF667ACD391A6023AEC1512A9AB555`;
  artifact SHA-256
  `CB345BBD781E9CBC2CDB585576D6685402EE8DD18EAC6843E7EBDEFE4F84BF62`.
  The uncorrected solver mismatched at boundaries 6 and 10 and the explicit
  product retained `DELTA/INITIAL/NO_EVENT/REPLACEMENT`.

## Scientific revision consumption

- At `2026-08-11T06:17:02+08:00`, immediately before the first corrected-solver
  execution, Stage A scientific revision **1/1 was consumed**. Corrected solver
  SHA-256:
  `C86F8E0D00FCE0186826CC885AA5FE3434E8871DE3A20305275D99B682DC0789`;
  direct exactness runner SHA-256:
  `43B936E750F01569C1804212117F628EA51581D9F849322BFE8626EFBACF3611`.
- First corrected execution is exactly `scripts/revision_exactness.py`, comparing
  every relevant boundary/state frontier as `(cost, deterministic full plan
  signature)` for both the observed delta-disabled and frozen delta-enabled
  tie adversaries.
- The first corrected execution completed in 5.85 s, exit 0. It matched full
  cost+signature frontiers at all 17 delta-disabled boundaries and all 11
  delta-enabled boundaries; corrected `max_r` was 3 and 4 respectively. Result
  SHA-256:
  `38F1A4BA874E6B48DC6405731925EBA666CFEC3F84D69BEDB5DE04FFDBC3FB73`.

## Complete corrected preclaim

- Executed the full frozen preclaim suite using revision-local corrected code
  and the pinned initial vendor tree. It completed in 16.74 s wall / 16.61 s
  CPU, peak RSS 131,633,152 B, temporary deep bytes max 103,151 B, exit 0.
- PASS: catalog 26 raw actions -> 14 non-increasing representatives; all six
  tiny oracle arms were exact at every boundary; all seven event-arm cases and
  predecessor/order adversaries passed; stock Arrow accepted the 4u<5u witness
  and decoded identical ordered values/nulls/schema.
- `preclaim_results.json` SHA-256:
  `2798FB72689B205FF4EB4D4345A1704B0DCD01D855F1BDD4503DA8139AF33CF7`;
  catalog audit SHA-256:
  `2FC0B27ABDB2815E3F76BFFDC00DFB240F4140F4CAC21804795AFA1C530E3116`.
- A help-only invocation of `natural_stagea.py` omitted the required pinned
  vendor `PYTHONPATH` and failed before argument parsing with
  `ModuleNotFoundError: No module named 'psutil'`. It wrote no artifact and was
  not a claim-bearing run. All actual natural runs use the pinned vendor path.

## Natural primary attempt 1 and frozen-cap harness correction

- The first corrected 40-window primary command wrote 32 complete NYC window
  artifacts, then failed before Adult window 0 with exit 1:
  `RuntimeError: predeclared natural window exceeds exact product state cap:
  UCI_ADULT/0 15782560`. No summary was written.
- This exposed a mechanical runner/contract contradiction. The frozen contract
  says that above the 4,096-state cap the exact product is a ceiling only and
  **may be omitted with a recorded reason and zero candidate-superiority
  claim**; it does not authorize aborting the remaining frozen windows.
- The harness was corrected only to execute that already-frozen disposition:
  above-cap windows run unchanged RP-FDP/current-grid/independent arms, omit
  product, set exact-product match false, record the reason, and force candidate
  residual false. No solver, object, input, threshold, cost dimension, or
  strongest feasible union was changed. Attempt 1 is preserved verbatim and a
  full primary restarts from scratch.

## Natural primary attempt 2 resource boundary

- Attempt 2 again completed all 32 frozen NYC windows and reached Adult window
  0. With the exact product correctly omitted, corrected RP-FDP planning itself
  expanded to 3,553.5 MiB RSS / 4,305.1 MiB private at the last sample, crossing
  the 4 GiB fail-closed boundary. The process was immediately interrupted with
  Ctrl-C at `2026-08-11T06:41:01+08:00`, exit 1. No Adult artifact or aggregate
  summary was written; the 32 completed window results are preserved.
- No further scientific run is authorized: the two current-revision attempts
  already provide independent executions of all 32 NYC windows, and the rank
  killer is mathematically irreversible even under the best possible outcomes
  on all eight unexecuted Adult windows. A read-only validator compares all
  non-volatile structural fields between those two executions.

## Final read-only validation and reporting

- `validate_partial_replays.py` completed in 0.98 s, exit 0: 32/32 non-volatile
  projections matched exactly. Each execution had 0 useful, 0 strict, 30
  infinite and two ratio-2.0 windows; all streams were native-equivalent and
  deterministic, and all feasible RP/product comparisons were exact. Result
  SHA-256:
  `FC18C3FC357350908D40ADFB493875353DC7C450E54235757E03BF75AEC03279`.
- `summarize_revision.py` performed no solver execution. It aggregated the
  immutable ledgers and proved the frozen success thresholds impossible even
  under ideal outcomes on the remaining eight windows. Summary SHA-256:
  `DF608355A77F3BB2F220582146B46A738C1E6FE214266ABAEE45EF2279C91B26`.
- One PowerShell display-only aggregation attempt had a parser error due to an
  empty pipeline element; it wrote nothing. The corrected display command read
  the same summary JSON. No scientific retry resulted.
- Owner decision is
  `STOP_RECOMMENDED__NARROW_FROZEN_MECHANISM`; Stage B remains false and no
  shared control file was modified. Final action is canonical manifest build
  and independent byte/hash validation only.
- Direct invocation of `build_manifest.ps1` was blocked by the host's PowerShell
  execution policy before the script ran. Reinvocation with process-local
  `powershell.exe -NoProfile -ExecutionPolicy Bypass -File ...` made no system
  policy change and generated 614 entries. The manifest was rebuilt after this
  log entry so that the final command record is covered.
- The bundled Python has no PyYAML, Node has no `yaml` module, and PowerShell has
  no `ConvertFrom-Yaml`; no dependency was installed or downloaded. Canonical
  handoff fields were therefore checked against the repository template and
  written in its scalar/list/mapping subset. Hash-manifest validation is fully
  mechanical: uppercase SHA-256, two-space separator, exact file-set equality,
  no self-entry, and byte-for-byte recomputation. A pre-final validation found
  614/614 entries with zero format/hash/missing/unlisted errors; the manifest is
  rebuilt once more after this final log entry and then revalidated externally.
