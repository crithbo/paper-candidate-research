# S4 DCGM–MLPerf counter compatibility — independent confirmation

## Disposition

- Assignment: `STAGE0-C2-20260814-S4-DCGM-MLPERF-COUNTER-COMPATIBILITY-CONFIRM-V8.7`
- Role: independent confirmation; no device access, MLPerf run, build, download, revision, Stage A, or Stage B occurred.
- Decision: `CONFIRM_REVISE_ONCE`
- Conditional paper shape: `TIER_B_Q2_VIABLE` as an N3 measurement-characterization / benchmark-validity contribution, not an optimizer or dashboard.
- Evidence ceiling: `E1_STATIC_PREFLIGHT__PINNED_DCGM_MLPERF_CONTRACT_AND_CONCLUSION_ESTIMAND_PENDING`
- Sole gate: `PINNED_DCGM_NATIVE_GROUP_CONTRACT__MLPERF_PAIRED_WINDOW_CONCLUSION_STABILITY_CERTIFICATE`

The PRIMARY decision is confirmed.  A finite static revision can make the
claim falsifiable without pre-running hardware: it must turn a generic
monitoring comparison into one locked, conclusion-changing measurement
contract.  Lack of a device, MLPerf result, or power analyser is not used as a
STOP reason.

## Frozen-input integrity

The four PRIMARY canonical members recompute to the contract values:
`STAGE0_REPORT.md` `747953213D0A16CFAC39BC9444416CCE974F9BCB8B2B85891E8C2631D5C92F4D`,
`Q1_COMPARATOR_MATRIX.md` `CC09169368298F27FF78CE13A8A1D0CFFC1E24012921BE1EB4E9B8CD15752BDC`,
`SOURCE_AUDIT.md` `7E2C07CE2EC9BF32A1EBF3A10AA7FCAC454F4990E6BBF5A6213694CF06AF89C1`,
and `handoff.yaml` `1AE53C46B435204663DD1EFB58056D78A40841F89A8DA67738C4F9440B780572`.
The upstream manifest self-hash is
`67DE87E2AFD3D339CBCC09D359EF03AE51CDF414DC8587C2CEC03786A5145901`.

## Independent attack

### Exact object and native plans

The official DCGM profiling module discovers hardware-specific compatible
metric groups and provides automatic multiplexing when requested counters
conflict.  Its values are interval averages, not kernel/source/instruction
traces.  Thus the two admissible plans are:

- **A:** one stock DCGM watch of the identical requested field set using native
  automatic multiplexing; and
- **B:** the complete, runtime-enumerated compatible-group partition of that
  same field set, collected in randomized paired windows.

Neither plan may change fields, sampling delay, MLPerf release/model/dataset,
quality target, LoadGen scenario, recorded request stream, SUT, GPU mode,
driver, DCGM version, or power path.  B is not a new field selector or a
controller: it is a repeated observation plan.  It must include all group
members/coverage and a predeclared zero, blank, warmup and exclusion policy.

The non-GPM condition is essential, not cosmetic.  NVIDIA documents that
Hopper-and-newer GPM groups can be watched concurrently without the legacy
resource-conflict restriction.  A GPM device is therefore a preregistered
no-gain stratum; it cannot be used to claim a multiplex residual.  The
revision must name a non-GPM SKU and preserve a native `dcgmi profile --list`
catalogue snapshot as the action grammar.

### The conclusion, not raw numbers, is the research object

DCGM itself already covers field access, compatible-group discovery,
automatic multiplexing, pause/resume and routine monitoring.  A study that
only reports changed counter values is directly absorbed.

The gate must instead freeze one declared conclusion functional
`C(raw counters, throughput, tail, wall energy, quality)` and a materiality
interval.  It must say in advance which concrete bottleneck classification,
SUT/model-scenario ranking, or benchmark-design decision changes when A and B
are compared.  The paired estimator must preserve the same inference target,
not merely find a difference somewhere in the field vector.  A held-out
model–scenario–GPU stratum must be capable of falsifying the resulting
boundary by retaining the same conclusion within that interval.

This repairs a material ambiguity in the PRIMARY: a raw “bottleneck” label is
not sufficient because DCGM explicitly warns that high activity does not by
itself prove a particular bottleneck.  The revision must state the
multi-metric/throughput rule and its allowed interpretation; it may not infer
kernel attribution.

### Full cost and confounding

Randomization must pair A/B windows across a frozen request-stream replay (or
the exact MLPerf-approved equivalent), explicitly balance temporal position,
thermal/power state, host co-tenancy, NVML/DCGM ownership, and warmup.  The
ledger must charge wall energy via the MLPerf power path, throughput and tail,
quality/output checks, window and retry count, host-engine CPU/RSS,
collection/analysis cost, and blank/zero handling.

DCGM introspection reports the host engine as a whole rather than per-client
or per-watch cost; the claim must therefore report it as a shared system cost,
not falsely allocate it to B.  MLPerf power uses a physical analyser and
PTDaemon workflow, so GPU-only watts cannot substitute for the wall-energy
denominator.  These are finite fidelity requirements, not an instruction to
run an experiment now.

### Current collision boundary

CounterPoint is a real, strong measurement-methodology subtractor: its public
abstract defines a framework for checking user-specified microarchitectural
models against noisy counters with multi-dimensional confidence regions, with
a Haswell MMU case study.  It absorbs a generic “multiplexing is noisy” story
and ungrounded confidence intervals.  It does not, on the reviewed record,
show the exact DCGM-native runtime-group grammar plus MLPerf quality/request,
wall-energy/tail, paired-window conclusion-stability and held-out-falsifier
contract.  That boundary is `SEARCH_BOUNDED_OPEN`, not an absence claim.

No reviewed source establishes direct absorption of the complete contract.
Conversely, if the revision finds CounterPoint or current tooling already
implements that exact same-object protocol and conclusion guarantee, this
candidate is absorbed and must STOP rather than rename generic tooling as N3.

## Single permitted revision and Stage A fidelity gate

The sole revision may proceed only by freezing:

1. one MLPerf release/model/dataset/quality/LoadGen scenario and replayable
   request stream; one non-GPM GPU SKU/mode, SUT, driver and DCGM version;
2. the runtime compatible-group catalogue, complete A/B plans and their
   identical field/delay contract;
3. paired randomization, zero/blank/exclusion rules, materiality interval,
   statistical conclusion functional, confound controls and held-out falsifier;
4. the full-cost ledger and an explicit prohibition on kernel-level attribution.

The first Stage A claim-bearing observation must verify the frozen catalogue,
LoadGen/quality equality, raw-schema completeness, same power path and the
ledger before using any result.  It stops the direction if the field groups
are concurrently compatible, B cannot preserve the identical MLPerf contract,
the held-out paired full-cost interval retains the conclusion, or the strong
union implements the same protocol.

## Evidence and claim limit

Evidence: current NVIDIA [DCGM profiling](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/profiling.html),
[profiling API](https://docs.nvidia.com/datacenter/dcgm/latest/dcgm-api/dcgm-api-profiling.html),
and [introspection](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/introspection.html)
documentation; MLCommons [Inference](https://docs.mlcommons.org/inference/index_gh/)
and [power](https://docs.mlcommons.org/inference/power/) contracts; and
[CounterPoint](https://arxiv.org/abs/2601.01265).  Inference: the frozen
protocol could support a bounded N3 measurement/benchmark paper if a held-out
conclusion boundary appears.  No counter result, hardware effect, benchmark
outcome or universal counter-reliability law is claimed.

`STAGE0_REPAIR_VECTOR: [ATOMIC_ACTION_UNCLEAR, FULL_COST_GAP,
EVIDENCE_LOCATOR_OR_VERSION_GAP, EFFECT_OR_GUARANTEE_UNCLEAR]`.

