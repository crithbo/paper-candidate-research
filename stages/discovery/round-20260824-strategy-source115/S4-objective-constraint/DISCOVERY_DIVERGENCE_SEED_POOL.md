# Source115 S4 offline divergence seed pool

- Assignment/lane: `DISCOVERY-S4-20260824-SOURCE115-UPSTREAM-FAULT-NEGATIVE-REPLICATION-V1` / `DISCOVERY_S4`
- Generation completed before evidence lookup: `YES`
- Frozen focus: `EXACT_NEGATIVE_REPLICATION_OR_REGRESSION_ARTIFACT`
- Denylist precheck: each seed is `DISTINCT` from Source109–114 exact-or-contains entries; none repeats simulator ranking/calibration, unfrozen trace replay, VLA, or kernel-corpus identities.

| Seed | Denylist before lookup | Offline fault/negative-replication sketch | Intended primary carrier | Disposition |
|---|---|---|---|---|
| S4-115-SEED01 | `DISTINCT` | A current Triton issue may identify an incorrect-code regression whose exact test and fix commit permit a faithful negative replication route. | Triton issue/test/current source | keep |
| S4-115-SEED02 | `DISTINCT` | A current LLVM/MLIR lowering regression may have a versioned reproducer and non-default flag that changes a defined compiler result. | LLVM issue/test/current source | keep |
| S4-115-SEED03 | `DISTINCT` | An OpenXLA compilation issue may expose a current test and fix that delimit a same-program negative replication. | OpenXLA issue/test/current source | keep |
| S4-115-SEED04 | `DISTINCT` | A llama.cpp inference regression may provide an exact model/config/result protocol and a current upstream disposition. | llama.cpp issue/test/current source | keep |
| S4-115-SEED05 | `DISTINCT` | An OpenVINO correctness regression may define a current test and configuration gate without changing the object. | OpenVINO issue/test/current source | keep |
| S4-115-SEED06 | `DISTINCT` | An ExecuTorch delegate regression may define an exact conversion/execution mismatch and a current source locus. | ExecuTorch issue/test/current source | keep |
| S4-115-SEED07 | `DISTINCT` | A fixed upstream regression test might support an empirical characterization of which flag surface prevents reoccurrence. | versioned upstream test | keep |
| S4-115-SEED08 | `DISTINCT` | A current default/non-default configuration may distinguish a real compiler regression from a stale issue-only report. | docs/source/flags triplet | keep |
| S4-115-SEED09 | `DISTINCT` | A resolved issue may provide a negative replication boundary but no paper endpoint; it must be rejected before raw rather than renamed. | issue + fix + test | keep |
| S4-115-SEED10 | `DISTINCT` | A performance regression with no same-function failure may be nonadmissible for the fault track. | issue/test/current source | keep |
| S4-115-SEED11 | `DISTINCT` | A minimal patch may repair a test but leave no generalizable mechanism or decision-changing endpoint. | issue/fix/test | keep |
| S4-115-SEED12 | `DISTINCT` | A current regression artifact may be invalidated if its necessary backend/flag is now removed or changed. | docs/source/flags triplet | keep |

All entries are non-evidence seeds. They state no fault, miscompilation, current absence, or novelty conclusion.
