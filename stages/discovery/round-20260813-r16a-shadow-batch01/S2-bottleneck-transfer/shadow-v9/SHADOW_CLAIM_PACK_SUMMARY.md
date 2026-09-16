# V9 shadow claim-pack summary — R16A S2

This directory was generated only after the canonical v8.7 subdirectory and its manifest were frozen. It is noncanonical process evidence, not candidate evidence.

| Family | Shadow A/C/D/E coordinates | Shadow disposition | Source/action correction relative to canonical |
|---|---|---|---|
| S2R16A-01-OPENSSL-HASHDIR | A0/C0/D1/E1 | `C0_DIRECT_COVERED__SHADOW` | No decision correction; makes the fixed loader-contract predicate explicit. |
| S2R16A-02-OPENSSH-KNOWNHOSTS-HASHLOOKUP | A0/C0/D1/E1 | `C0_DIRECT_COVERED__SHADOW` | Replacement after historical pyc exclusion; makes the stock hashed-hostname contract explicit. |
| S2R16A-03-PHP-OPCACHE-FILECACHE | A0/C0/D1/E1 | `C0_DIRECT_COVERED__SHADOW` | No decision correction; enumerates file-cache controls. |
| S2R16A-04-SYSTEMD-JOURNAL-CONSTRUCTOR | A2/C2/D1/E1 | `SEARCH_BOUNDED_OPEN__SHADOW` | No decision correction; identifies the missing target-specific whole action/guarantee as an explicit shadow facet. |

Leakage check: shadow uses only source locators in `../neutral-source-snapshot/SNAPSHOT.md`; no shadow text was used to set canonical dispositions. Stability: all four canonical results remain unchanged under shadow rendering.
