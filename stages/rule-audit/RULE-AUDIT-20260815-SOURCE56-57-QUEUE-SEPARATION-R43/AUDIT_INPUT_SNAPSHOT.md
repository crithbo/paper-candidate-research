# R43 audit input snapshot

## Scope

- Audit ID: `RULE-AUDIT-20260815-SOURCE56-57-QUEUE-SEPARATION-R43`
- Included: completed Source56/57 common controls, canonical six-lane handoffs, Source57 queue telemetry, current `ROLE_DISCOVERY.md`, and the installed R40 skill.
- Excluded: Source58 outcome/files, all Discovery/Stage control actions, experiments, downloads, and external retrieval.
- Historical comparison only: Source55 MIPS FCSR closure is recorded as `UNRESOLVED_BACKLOG` and has no raw/brief/Q2/STOP authority. No MIPS scientific material is used to classify Source56/57.

## Frozen input identity

| Artifact | Path | SHA256 / status |
|---|---|---|
| R40 Discovery skill | `.agents/skills/research-topic-discovery/SKILL.md` | `FC041AE3DB89DDEA1771076E0824929C6AA29C9A34A08BE30C7F322F51721CD2` |
| Source56 control | `stages/discovery/round-20260815-adaptive-source56/control/CONTROL.yaml` | `C2A3595D292D7A5733F3401BE4D06F8CBFD4809715BBBA4F422F6AF635B40AA5` |
| Source57 control | `stages/discovery/round-20260815-adaptive-source57/control/CONTROL.yaml` | `5EC4C5D16BDB90A9F32A0D6F4ABFF3948EB903E1D5E4638B20068C39D00777EB` |
| Discovery role | `rules/ROLE_DISCOVERY.md` | `3B2CBA116A714BB7F4C4B08FF3DFD2F320BCDF969829BB1F072456CC09283252` |

## Queue telemetry, not candidate outcomes

| Queue | Parent | State | Attempts | Permitted meaning |
|---|---|---|---:|---|
| `WASMTIME_THREADS_CQ01` | Source57 S1 | `PENDING_UNEXECUTED` / assigned to separate closure lane | 0 | Exact source bundle exists; no raw or scientific inference yet. |
| `WASMTIME_GC_SCQ_S57_01` | Source57 S2 | `OPEN_BOUNDED` | 1 | One version-pinned route did not close a source locus; not exhausted and no raw/scientific negative. |
| `MIPS_FCSR_CALLABLE_STATE` | Source55 S1 | historical `UNRESOLVED_BACKLOG` | 6 | Comparison only; remains outside Source56/57 denominators. |
