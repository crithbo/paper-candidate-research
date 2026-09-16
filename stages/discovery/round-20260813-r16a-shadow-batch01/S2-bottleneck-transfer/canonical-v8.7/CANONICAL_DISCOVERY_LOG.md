# Canonical v8.7 output — R16A S2

Frozen from `../neutral-source-snapshot/SNAPSHOT.md` before any V9 shadow artifact was created.

## Canonical dispositions

| Family | v8.7 disposition | Reason limited to canonical evidence | Canonical Stage0 routing |
|---|---|---|---|
| S2R16A-01-OPENSSL-HASHDIR | `DROP` | Stock verifier derives lookup from the subject/issuer hash and the official rehash action creates those exact names. A different physical index requires a different loader/path contract; remaining choices are `-old/-compat/-n` configuration or link generation. | None. |
| S2R16A-02-OPENSSH-KNOWNHOSTS-HASHLOOKUP | `DROP` | Stock `ssh-keygen -H` replaces hostnames with hashed representations and stock matching must preserve host-key acceptance/rejection. An auxiliary index needs a new reader; the remaining `HashKnownHosts` choice is configuration. | None. |
| S2R16A-03-PHP-OPCACHE-FILECACHE | `DROP` | Official OPcache already defines shared-memory cache, second-level file cache, preloading, consistency checks and fallback. A residual framed as placement/admission is cache control, not a same-object constructor. | None. |
| S2R16A-04-SYSTEMD-JOURNAL-CONSTRUCTOR | `NOT_ADMITTED_UNFROZEN` | The on-disk format exposes DATA/FIELD hash tables, ENTRY arrays and sealing, but no target-specific whole constructor/guarantee was frozen without changing append/recovery semantics. This is not a resource or result negative. | None; retain only as nonterminal opportunity-family record. |

## Canonical current-reality checks

- OpenSSL: docs state `rehash` creates subject/issuer hash-named links; current default is SHA-1, while `-old`, `-compat`, `-n`, provider and property options were considered. No claim asserts that another action is absent.
- OpenSSH: current manuals and `hostfile.c`/`sshconnect2.c` routes cover hashed host names, `HashKnownHosts`, `KnownHostsCommand`, host-file options and `ssh-keygen -F/-H`; no absence claim is made.
- PHP: documented file-cache, file-cache-only, consistency-check, fallback, preload, validation and update-protection options constitute the native cache-control union.
- systemd: format documents append-only DATA/FIELD/ENTRY objects, two initial hash tables, ENTRY arrays, tags/sealing and rotation. Current source route is recorded; no source-level absence is asserted.

## Canonical result

`COMPLETE_ZERO_PROPOSALS`. No canonical brief was produced. This is independent of the later V9 shadow assessment.
