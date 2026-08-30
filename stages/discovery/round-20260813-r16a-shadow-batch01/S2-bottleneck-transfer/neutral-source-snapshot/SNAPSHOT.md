# Neutral source snapshot — R16A S2

Frozen at: 2026-08-13 (Asia/Shanghai). This is the sole source snapshot for both the canonical v8.7 and V9 shadow artifacts. It contains no shadow-derived conclusion.

## Accepted unique opportunity families

| Family ID | Canonical signature | Exact object / same-function contract | Neutral current-source snapshot |
|---|---|---|---|
| S2R16A-01-OPENSSL-HASHDIR | `X509_HASHDIR|PEM_CERT_CRL_SET|HASHED_FILENAME_LOOKUP|STOCK_X509_VERIFY|BUILD_LOOKUP_VERIFY_BYTES` | Fixed PEM certificate/CRL directory and the same OpenSSL X.509 verification result under stock hashed-directory lookup. | OpenSSL docs: `openssl-rehash(1)`, `X509_LOOKUP_hash_dir(3)`, `openssl-verification-options(1)`; source route `openssl/openssl:apps/rehash.c` and `crypto/x509/by_dir.c`, branch `master`, accessed 2026-08-13. |
| S2R16A-02-OPENSSH-KNOWNHOSTS-HASHLOOKUP | `OPENSSH_KNOWN_HOSTS|FIXED_HOSTKEY_SET|HASHED_HOSTNAME_MATCH|STOCK_SSH_HOSTKEY_CHECK|BUILD_LOOKUP_VERIFY_BYTES` | Fixed host-key set and identical stock SSH host-key acceptance/rejection behavior. | OpenSSH `ssh-keygen(1)` (`-F`, `-H`) and `ssh(1)` known-hosts documentation; source route `openssh-portable:hostfile.c, sshconnect2.c, readconf.c`, branch `master`, accessed 2026-08-13. |
| S2R16A-03-PHP-OPCACHE-FILECACHE | `PHP_OPCACHE_FILECACHE|FIXED_PHP_SCRIPT_TREE|PERSISTENT_OPCODE_CACHE|STOCK_PHP_EXECUTION|COMPILE_LOAD_EXECUTE_BYTES` | Fixed PHP script tree and observable PHP execution under OPcache/file-cache semantics. | PHP OPcache book/configuration/preloading docs; source route `php/php-src:ext/opcache/`, branch `master`, accessed 2026-08-13. |
| S2R16A-04-SYSTEMD-JOURNAL-CONSTRUCTOR | `SYSTEMD_JOURNAL|FIXED_ENTRY_FIELD_SEQUENCE|APPEND_INDEX_SEAL|STOCK_SD_JOURNAL_READER|WRITE_QUERY_VERIFY_BYTES` | Fixed journal entry/field sequence with stock `sd-journal` observable query and integrity behavior. | systemd `JOURNAL_FILE_FORMAT`; source route `systemd/systemd:src/libsystemd/sd-journal/journal-file.c` and `journal-def.h`, branch `main`, accessed 2026-08-13. |

## Snapshot integrity and limits

- Git remote-head resolution was attempted read-only on 2026-08-13 but local credential transport failed (`SEC_E_NO_CREDENTIALS`); no absence claim relies on an unresolved commit hash.
- Official documentation and current public source routes were preserved as source locators. All absence-sensitive conclusions are avoided; no claim depends on a missing API.
- CPython `.pyc` was discovered during mainline dedup to be a historical Wave259 identity object. It is retained only as `EXCLUDED_REPEATED__HISTORICAL_PYC_IDENTITY_OBJECT`, and does not count toward the four accepted families.
- Registry scan found no identical signature for the replacement OpenSSH family. Cross-lane ownership is pending mainline's mechanical comparison; any later duplicate does not count toward this lane's four.
- No download, experiment, benchmark, E2 smoke, installation, automation, or environment mutation occurred.
