# R36 Audit Input Snapshot

## Frozen scope

- `audit_id`: `RULE-AUDIT-20260815-SOURCE41-42-ZERO-YIELD-IDENTITY-QUEUE-R36`
- `audit_date`: `2026-08-15`
- `canonical_cycles`: Source41 and Source42, six completed lanes each
- `active_cycle_excluded_from_intervention`: Source43
- `shared_files_modified`: `false`
- `network/download/experiment/stage/automation_actions`: `0`

## Authoritative control snapshot

| File | SHA256 |
|---|---|
| `AGENTS.md` | `2450D3D49593CC6712338CB563342F7E53A5B47F8F756FF75E4ED3922A3686BF` |
| `plan.md` | `22C99EA579C6474678A5C795E2FB0F4E2191783780D3DA4F44A3ED42C4C1FCC7` |
| `registry.yaml` | `55C94014A3117AF964241266FCBAF16FCD2DB0B638FBC15178D7E17061650F9F` |
| `rules/ROLE_RULE_AUDIT.md` | `8BC9EF3944A5A0D87DBBD984A869883C2A116194CF81908106107896E39CDBB8` |
| `rules/ROLE_MAINLINE.md` | `C9FF89E5553A963FFB710C0B4D4A7F5A467208A128193D31F16424A679216B63` |
| `rules/ROLE_DISCOVERY.md` | `1A5E750718D589F0654B1867BC4ACC6B61BCE505E445CDD571FAA28A4B596C37` |
| `rules/RESOURCE_LOCALIZATION.md` | `A1A1DFB83634F075B2845D57C255CDC53D97B91A6BE5EEFA14953EC4C5B511D4` |

The hash snapshot is evidence of the bytes inspected at close, not authority to edit them. During packaging, mainline independently changed `plan.md` from `1CF5CC40...BAC9` to `22C99EA5...FCC7` and `registry.yaml` from `F8A28B88...C0F4` to `55C94014...F9F`; the close versions were reread for Source41/42 consistency. No decisive Source41/42 fact or Source43 non-interference boundary changed, and this audit did not write either file.

## Canonical cycle artifacts

### Source41

- Control: `stages/discovery/round-20260815-adaptive-source41/control/CONTROL.yaml`, SHA256 `0FE8A5F86D3B8CD2CBFB2602AA9AE52058E9BB18E09A571A22FB694632F04894`.
- Six lane handoffs: S1 `E937BB6F...DD9A`, S2 `FA9848EC...5D84`, S3 `B14D541C...11F2`, S4 `275C01F7...B09C`, S5 `18DD19D7...C1A`, S6 `D8880977...0F9C`.
- Decisive S1 raw: `LLVM_GC_STATEPOINT__EXCEPTIONAL_EDGE_RELOCATION__SAME_DEOPT_AND_EH_SEMANTICS`; one evidence-qualified raw, one deep review, zero clean brief.
- S1 handoff and queue identify finite closure but leave the public managed-runtime carrier, direct same-object paper collision and complete current LLVM union open.

### Source42

- Control: `stages/discovery/round-20260815-adaptive-source42/control/CONTROL.yaml`, SHA256 `F264B22F41D09D8DFB140B3CB5EED1E7C42ED498894DC1BA856E45FBDC09A281`.
- Global identity/queue regression: SHA256 `13CE02B30D6D7B78427307234F3CE7A63A93C553E0A4E1DEDA012DFA73F4078E`.
- Six canonical handoffs: S1 `780564AD...20E`, S2 `398F9F62...32A7`, S3 `83A840BF...D4F4`, S4 `8B085986...3999`, S5 `F95D7521...60C6`, S6 `A59806D9...A0B3`.
- Final canonical funnel: zero admitted raw and zero clean brief.
- Append-only S1 correction: ambiguous WebAssembly/Wasmtime-or-V8 route demoted to `LOCATOR_ONLY__RQ_BACKLOG / EMPTY_NOT_EXHAUSTED`; correction handoff SHA256 `D82B9B35...E5A7`.
- Append-only S5 correction: generic target-compiler/public-corpus route demoted identically; correction rationale SHA256 `A3690E03...0D7`.

### Source43 non-interference proof point

- Current control: `stages/discovery/round-20260815-adaptive-source43/control/CONTROL.yaml`, SHA256 `CEF3379DD0ECD32E5A0191B9E30A612A3C9B8484FA09E47D4C67620BCB1B241D`.
- It already requires an exact project/object/version or deterministic one-project selection rule for an executable closure queue.
- This audit neither reads live lane results for decision-making nor contacts, pauses, or changes Source43.

## Method

The audit used the academic-research-suite evidence workflow: separate claim from evidence, compare disconfirming explanations, preserve a claim ceiling, and treat the two cycles as an observational process sample rather than a calibrated causal evaluation.
