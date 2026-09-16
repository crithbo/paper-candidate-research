# GNU Make official-source route recovery — resume1

## Scope frozen by addendum

Only the current official source locus for GNU Make's Remaking Makefiles semantics
was in scope. This packet has no authority for a new RQ, raw admission, brief,
novelty/current-absence claim, experiment, or scientific disposition.

## Resource preflight

- Resource root: `resources/`, under the unique write directory.
- Mandatory `downloads`, `archives`, `src`, `build`, `env`, `cache`, `tmp`, and
  `logs` subdirectories were created and verified.
- Tool: `curl.exe 8.21.0`; all writable surfaces were limited to explicit output
  paths and process-local `TEMP`, `TMP`, and `TMPDIR` under `resources/tmp`.
- Download cap: `3,145,728` bytes per call; no persistent response, extraction,
  build, install, or experiment occurred.

## Attempt ledger

| Attempt | Authorized official route | Outcome |
|---:|---|---|
| 1 | GNU Savannah cgit raw `doc/make.texi` | `curl.exe` failed before transfer with Schannel `SEC_E_NO_CREDENTIALS`; zero bytes persisted. |
| 2 | GNU FTP `make-4.4.1.tar.gz`, fixed member `make-4.4.1/doc/make.texi` | The same pre-transfer Schannel credential failure; zero bytes persisted. |

The third numerical attempt was not used: it would repeat a route already blocked
by the identical process-local credential error, and the frozen addendum authorizes
no different source, TLS-policy bypass, or unofficial mirror.

## Outcome

`BLOCKED_TRANSPORT_OR_TOOL_POLICY__NO_SCIENTIFIC_INFERENCE`

The official manual/source locus is not closed. No bytes were available to inspect,
so this addendum leaves SC86-01-CQ01's scientific status unchanged and does not
establish a current union, a current absence, a raw record, or a brief.
