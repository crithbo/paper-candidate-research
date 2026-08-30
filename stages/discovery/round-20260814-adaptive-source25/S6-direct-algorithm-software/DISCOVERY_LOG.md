# Source25 — divergence-to-evidence funnel

## Compliance

- Assignment: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE25-DIVERGENCE-V1R1`.
- v8.7 canonical; V9 OFF.  Network-security, vulnerability, attack, exploit and protocol-security families excluded.
- Seed generation was completed offline before any source lookup; see `DIVERGENCE_SEED_POOL.md`.
- Public source retrieval stayed within the per-lane response/storage budget; no material download, build, install, E2, experiment, benchmark or Stage activity occurred.

## Funnel reconciliation

| Stage | Count | Note |
|---|---:|---|
| divergence seeds | 10 | Five engines; non-evidentiary. |
| coverage-selected locators | 5 | Representatives selected before lookup. |
| Question Cards complete / fresh raw | 1 | QC-01 only. |
| locator-only | 4 | Incomplete hard fields; not raw. |
| C0 | 1 | QC-01 current union closed. |
| D1 / deep / brief | 0 / 0 / 0 | Direct current-union absorption at C0. |

## QC-01 current-union outcome

LLVM’s current `RISCVInsertVSETVLI` source defines the relevant complete native union for the proposed action: phase 1 computes per-block VL/VTYPE changes; phase 2 propagates them by dataflow; phase 3 inserts required VSETVLI, avoids first-block insertions when possible, performs PRE, mutates prior configurations when legal, and coalesces VSETVLIs.  The source also carries a default-on whole-vector valid-VTYPE setting. [source](https://www.llvm.org/docs/doxygen/RISCVInsertVSETVLI_8cpp_source.html)

Thus a claimed finite-state state-placement constructor that merely selects/propagates/coalesces legal VSETVLI actions is already represented by the current native union.  The current source contains the same three-phase contract, not merely an API/configuration hook.  Consequently QC-01 is `STRUCTURAL_DROP__CURRENT_DIRECT_ABSORPTION`; it does not enter D1.  This is a source-absorption decision, not an inference from unavailable RVV hardware, implementation, results, or AI readiness.

## No-backfill record

The unused C0/deep capacity expires.  The other four selected cards are preserved as `LOCATOR_ONLY` because their Question Cards lack required fields; they cannot be upgraded to fill capacity.
