# Source / collision matrix

| Deep | Official source and pin | Current default/non-default union | Natural cliff status | Same-object full-cost | Collision result |
|---|---|---|---|---|---|
| Cargo | [Cargo resolver reference](https://doc.rust-lang.org/cargo/reference/resolver.html), [features reference](https://doc.rust-lang.org/cargo/reference/features.html), master `97b3bcefc74ddf1203b21f158129e4b7df33254a` | Resolver 1/2/3, feature unification, `--features`, `--no-default-features`, target, locked/frozen and compatibility paths | Schema only; no measured natural cliff | Resolver + lockfile + duplicate-build denominator | Unfrozen; no union-external algorithm witness |
| systemd | [systemd unit documentation](https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html), main `9b75d9bc66dc4f64e4fdd33603d199d374c0873b` | Manager/generator/unit/config union not fully source-enumerated | Schema only; no measured natural cliff | Transaction + activation + journal/I/O/RSS denominator | Unfrozen |
| OpenSSL | [X509 verify documentation](https://docs.openssl.org/3.4/man3/X509_verify_cert/), [verification options](https://docs.openssl.org/4.0/man1/openssl-verification-options/), master `6d250710fb8cfd5c9a41af373c0c1ca85ff836c2` | Trust/untrusted stores, `trusted_first`, alt-chain/partial-chain/security options and callback context | Schema only; no measured natural cliff | Store construction + chain-build/verify CPU/RSS/tail/bytes | Unfrozen; visible option paths are included in union |

No old issue or synthetic stress input is used as N3 evidence. Source pins were obtained read-only on 2026-08-11.
