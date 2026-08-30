# Terminal artifact cleanup record

- Authorization: `UNBLOCK-AUTH-20260810-R1`
- Date: 2026-08-10 (Asia/Shanghai)
- Topic state before cleanup: `CONFIRM_STOP / BELOW_Q2_STOP`
- Reason: user authorized deletion of obsolete and unnecessary large files; terminal scientific kernel is preserved in registry/history and the independent gate package.
- Preserved: top-level reports, contracts, result summaries/CSVs/JSON, source/corpus metadata, command log, handoff, prior manifest, scripts, and independent gate package.
- Prior manifest remains a historical record of the pre-cleanup package and is not expected to verify after cleanup.

Deleted targets after absolute-path validation:

| Target | Pre-delete bytes | Purpose/disposition |
|---|---:|---|
| `toolchain/` | 1,516,410,853 | Reacquirable Rust/Zig/checker toolchain |
| `revision1/` | 534,000,351 | Detailed revision run tree already summarized and independently gated |
| `runs/` | 413,613,667 | Initial detailed run tree |
| `build/` | 349,953,554 | Build products |
| `artifact/` | 285,997,959 | Expanded/raw experimental artifacts |
| `cache/` | 284,460,844 | Reacquirable caches |
| `zig-x86_64-windows-0.16.0.zip` | 97,217,739 | Reacquirable archive |
| `certified_maxpre_experimental_data.zip` | 30,547,369 | Duplicate packaged artifact; compact corpus/source records remain |

Total scheduled deletion: `3,512,202,336` bytes.

Recovery: not recoverable from this workspace after deletion. Public toolchains/sources can be reacquired; the terminal legality/full-cost findings remain in retained summaries and independent review.
