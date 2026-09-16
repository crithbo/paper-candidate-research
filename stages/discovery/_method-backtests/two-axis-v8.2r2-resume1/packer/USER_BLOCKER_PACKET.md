# User blocker packet — two-axis v8.2r2 RESUME1

## State

`BLOCKED_USER_ACTION_REQUIRED` at Discovery historical-backtest PACKER source
acquisition. Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
No method execution, candidate judgment, sealed packet, executor contact, or
auditor contact occurred. This is not a scientific STOP and does not consume a
scientific revision.

## Exact observed failure

At 2026-08-09 (Asia/Shanghai), this command failed before response bytes were
received:

```text
curl.exe -L --fail --silent --show-error --head https://arxiv.org/abs/1012.1802
curl: (35) schannel: AcquireCredentialsHandle failed: SEC_E_NO_CREDENTIALS (0x8009030e)
```

Runtime: `curl 8.21.0 (Windows) libcurl/8.21.0 Schannel zlib/1.3.2`; Windows
PowerShell `5.1.26100.8875`. A prior direct USENIX request reproduced the same
Schannel credential failure. Received byte count: `0`; no byte hash can exist.

## Required source set and safe recovery boundary

Eleven r8.2r1 records are already designated reusable by the prior PACKER
ledger. Seven replacements still require raw, first-party, pre-cutoff artifact
bytes; do not substitute a search snippet, challenge page, publisher landing
page without the artifact, or a local paraphrase.

| Source ID | Previous first-party endpoint | Required acceptable substitute |
| --- | --- | --- |
| l1_s2 | `https://www.usenix.org/system/files/conference/nsdi13/nsdi13-final142.pdf` | Public USENIX/author/university PDF or official archival record with directly downloadable bytes |
| l4_s3 | `https://www.usenix.org/system/files/conference/atc15/atc15-paper-kulkarni.pdf` | Public USENIX/author/university PDF or official archival record with directly downloadable bytes |
| l5_s1 | `https://dl.acm.org/doi/10.1145/362686.362692` | Author/university-maintained paper PDF or other first-party archival artifact, legally public |
| l5_s2 | `https://dl.acm.org/doi/10.1145/1071647.1071655` | Author/university-maintained paper PDF or other first-party archival artifact, legally public |
| l5_s3 | `https://dl.acm.org/doi/10.1016/j.jalgor.2003.12.001` | Author/university-maintained paper PDF or other first-party archival artifact, legally public |
| l6_s1 | `https://people.csail.mit.edu/sparis/publi/halide-pldi13.pdf` | Official Halide/author/university PDF with directly downloadable bytes |
| l6_s2 | `https://dl.acm.org/doi/10.1145/1480881.1480915` | Author/university-maintained PDF or official arXiv record with directly downloadable bytes |

For every replacement, the resumed PACKER needs: canonical URL; provenance
(official, author, or university); first-public/artifact date not later than
the associated frozen cutoff; actual downloaded bytes; byte count; SHA-256;
retrieval timestamp; and a license/access note. Exact file size and hash are
unknown until bytes are supplied or direct transport succeeds.

## Minimum user action

Restore a usable TLS credential chain for this Codex workspace (or provide the
seven byte-identical, legally public source files plus their canonical URLs and
provenance). A constrained HTTPS proxy/CA setup is acceptable if it permits
direct byte retrieval without altering artifacts. Do not provide credentials,
cookies, or a paywalled/copyright-restricted copy. Resume by assigning the
same frozen contract to an idle PACKER lane and write only under a new
`resumeN` directory; this directory must not be overwritten.
