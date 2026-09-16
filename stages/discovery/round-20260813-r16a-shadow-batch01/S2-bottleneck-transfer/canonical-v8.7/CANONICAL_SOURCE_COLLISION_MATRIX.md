# Canonical source and collision matrix — R16A S2

| Family | Current official/source anchor | Natural/canonical carrier | Full-cost boundary | Bounded collision status |
|---|---|---|---|---|
| OpenSSL hash-dir | OpenSSL `openssl-rehash(1)` and `X509_LOOKUP_hash_dir(3)`; `apps/rehash.c`, `crypto/x509/by_dir.c`. | Versioned PEM CA/CRL bundle. | rehash CPU/RSS/temp, links/bytes, certificate lookup and stock verification. | Current reader contract absorbs the proposed index; no paper novelty claim. |
| OpenSSH known_hosts | OpenSSH `ssh-keygen(1)` and `ssh(1)`; `hostfile.c`, `sshconnect2.c`, `readconf.c`. | Versioned public host-key list. | rewrite CPU/RSS/temp, file bytes, lookup and stock host-key verification. | Hashing/lookup behavior is current native contract; no residual beyond configuration or changed reader. |
| PHP OPcache | PHP OPcache configuration and preloading docs; `ext/opcache/`. | Versioned PHP application tree. | compilation, SHM/file-cache bytes, load/execute CPU/RSS and validation. | Existing cache-control union covers proposed shift; no residual claimed. |
| systemd journal | systemd `JOURNAL_FILE_FORMAT`; `journal-file.c`, `journal-def.h`. | Versioned exported journal / test journal entry sequence. | append, index/seal, file bytes, query/verify CPU/RSS and temporary storage. | `SEARCH_BOUNDED_OPEN`; action/guarantee not frozen, so nonterminal unfrozen. |
