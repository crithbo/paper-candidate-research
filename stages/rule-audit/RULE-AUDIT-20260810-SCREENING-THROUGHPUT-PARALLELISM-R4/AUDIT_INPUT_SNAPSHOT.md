# Audit Input Snapshot

- captured_at: `2026-08-10T21:40:56+08:00`
- authority_state: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__p1-shadow-not-authoritative`
- note: Mainline was actively implementing R3; these hashes identify the exact control-file versions inspected for R4 and are not assertions that the files will remain unchanged.

| File | SHA-256 |
|---|---|
| `AGENTS.md` | `F7748F08564834334D57A45279302850C786637C94CE32A7145281319AF33258` |
| `plan.md` | `046236B59B3A2F89CF3894879E3DB3AB5F4ACD357BE09EB452922E8DC061952E` |
| `registry.yaml` | `8220F0CBB93AC1FA2C7D3120C72D0879AC59096A855B435DCE41C7F7AC1D4E0C` |
| `rules/ROLE_MAINLINE.md` | `00BE2F4A4F9089B29D5A832A87D9FAE742FE45771F49E7800E04FD9C4D79D326` |
| `rules/ROLE_DISCOVERY.md` | `F669980E485855F499D0046FBB1B1502F84ADABADDD1229104A2B470CDACB667` |
| `rules/ROLE_STAGE0_REVIEW.md` | `AD00B257F80FB1AF3B842E652E395A0B964291E43B0BA2FD7526CA098D2546B9` |
| `rules/ROLE_CANDIDATE_OWNER.md` | `30E23336CF339771821EAEC8B2C7011025BA815D613DB639E68121FDCDE54D1F` |
| `rules/ROLE_STAGEA_REVIEW.md` | `7403DD87FD0091BA836F782EE215AFDFB231BB5AFBF37570571B09EC524E94A8` |
| `rules/ROLE_RULE_AUDIT.md` | `9D0064D8E448ECFD3761E7125E776074417F81EF7012C9C49967AB7FA7148C99` |

## Live task observations

- Mainline: active, R3 P0/P1/P2 implementation in progress.
- v8.8 consolidated backtest PACKER: active in existing long-lived task.
- AIGER Stage 0 confirmation: completed `CONFIRM_STAGE0_PASS / TIER_B_Q2_VIABLE`; mainline acceptance not yet reflected in the inspected registry snapshot.
- Stage 0 PRIMARY: idle.
- Stage 0 confirmation lane: idle after AIGER handoff.
- Candidate execution lane1: idle/not loaded.
- Stage A gate1: idle.

Live task status is observational scheduling evidence, not candidate evidence and not an authority for state transitions.
