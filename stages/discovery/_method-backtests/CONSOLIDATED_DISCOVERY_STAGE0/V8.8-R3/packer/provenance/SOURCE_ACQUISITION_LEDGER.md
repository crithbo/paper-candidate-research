# Source acquisition ledger

Assignment: `BACKTEST-PACKER-20260810-CONSOLIDATED-V8.8-R3`  
Role: `DISCOVERY-BACKTEST-PACKER`  
Status: `COMPLETE_PRIMARY_BYTES_CLOSED`

## Final closure

- Cases: 18.
- Byte-frozen source artifacts: 55.
- Per-case source count: C01 3, C02 4, C03–C18 3 each.
- Total primary-source bytes: 37,681,036.
- Every source has a canonical relative path, byte count, SHA-256, upstream URL
  and cutoff-availability record in its executor-readable `case.yaml`.
- All PDF artifacts pass `%PDF-` magic checks; all source/text/HTML artifacts
  are nonempty; no downloaded HTML file matches the error-page signatures used
  in the mechanical audit.

## Transport history

Windows Schannel failed before source bytes were received with
`SEC_E_NO_CREDENTIALS`. The bundled OpenSSL/Python transport was therefore used
for public HTTPS acquisition. This is a transport substitution only; no
candidate method, experiment or historical result was run.

The first byte-acquisition pass completed 41/54 records and failed 13 records.
Failures were retained as acquisition observations, not as scientific evidence:

- transient `IncompleteRead`: C02/S03, C04/S02, C06/S02, C07/S01, C07/S03,
  C14/S02, C14/S03 and C16/S01;
- publisher access failure: C09/S02 and C09/S03 returned HTTP 403;
- versioned documentation route failure: C13/S01 returned an incomplete
  zero-byte response and C13/S03 returned HTTP 404;
- filename evolution: C18/S02 returned HTTP 404 for the obsolete `.rst` path.

No incomplete, zero-byte, 403, 404, snippet, search-result or error-page payload
was accepted. Retries recovered the same public primary bytes where possible.
Otherwise the replacement was first-party/author-hosted and pre-cutoff:

- C06/S02: fixed CUTLASS commit `dcf215a...` TMA source;
- C09/S02: author-hosted Saarland PDF; C09/S03: arXiv `2409.08013` PDF;
- C13/S01 and S03: Git `v2.55.0` documentation source;
- C18/S02: the pinned LLVM `BitCodeFormat.md` path.

The final pack also tightened mutable-page provenance before sealing:

- C07/S03 uses Transformer Engine commit
  `bffde8f4a0a4eea9036dc753e28269247e5de69d` dated 2026-07-31;
- C08/S02 and S03 use TensorFlow/ONNX Runtime commits dated 2026-08-09 and
  2026-08-08;
- C10/S02 and S03 use Arrow/DataFusion commits dated 2026-08-08;
- C12/S01 and S02 use the official OSDI 2026 paper PDFs rather than mutable
  presentation pages.

## Inclusion rule

A source was included only when all conditions held:

1. it was official/upstream, venue-hosted, author-hosted or the paper original;
2. its publication/release/commit precedes the case cutoff;
3. complete bytes were retrieved and hashed;
4. it closes at least one of exact object/guarantee, nearest same-object work,
   current first-party action family, generic kernel, deployed configuration
   union, natural evidence route or hardware claim ceiling;
5. it does not contain the hidden local target result or a downstream
   correction.

## Exclusion rule

Excluded from executor-visible packets:

- every local Discovery brief, Stage-0/Stage-A report, candidate title/method,
  terminal label, blocker disposition and later adjudication;
- any paper, artifact or source commit first public after the case cutoff;
- the August 2026 Parquet-related preprint whose cutoff availability was not
  safely established;
- all partial downloads, cached snippets, search pages and provenance stubs;
- all candidate/native outputs, experiment results and post-hoc corrections.

The acquisition helpers are preserved under `provenance/` so an auditor can
reproduce URLs and transport history. They are not executor-readable.

