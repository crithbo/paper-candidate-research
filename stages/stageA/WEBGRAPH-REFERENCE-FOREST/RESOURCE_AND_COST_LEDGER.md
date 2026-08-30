# Resource, acquisition and full-cost ledger

## Frozen ceilings and observed totals

| Resource | Ceiling | Observed/accounted | Status |
|---|---:|---:|---|
| Added disk | 20 GiB | 4,816,311,013 B before final text/manifest | PASS |
| Network | 10 GiB | about 399,001,739 retained/downloaded B; failed handshakes transferred no accepted asset | PASS |
| CPU | 8 CPU-hours | measured claim runs 138.50 CPU-s; all builds/tool setup remained far below 1 CPU-hour | PASS |
| Peak process RSS | no separate cap beyond machine/resource scope | 69,992,448 B in claim-bearing natural runs | PASS |
| GPU/exclusive device | forbidden | none | PASS |
| System/global mutation | forbidden | none; process-local PATH and topic-local portable tree only | PASS |

The retained network accounting is `53,347,654 B` of directly verified source/tool assets, `284,622,942 B` of signed pacman packages, `59,551,942 B` of Cargo crate cache, and `1,479,201 B` of natural raw/provenance assets. HTTP headers and failed sparse-index/TLS attempts add only unretained protocol overhead; the 10-GiB ceiling has more than an order of magnitude margin.

## Exact natural acquisition record

| Asset/attempt | Exact URL | Transport result | Accepted bytes |
|---|---|---|---:|
| LAW graph HTTPS preflight | `https://data.law.di.unimi.it/webdata/cnr-2000/cnr-2000.graph` | Windows Schannel `SEC_E_NO_CREDENTIALS`, then `SEC_E_INVALID_TOKEN`; topic-local OpenSSL `wrong version number` | 0 |
| LAW properties HTTPS preflight | `https://data.law.di.unimi.it/webdata/cnr-2000/cnr-2000.properties` | same TLS errors | 0 |
| LAW graph official HTTP | `http://data.law.di.unimi.it/webdata/cnr-2000/cnr-2000.graph` | HTTP 200; SHA-256 frozen | 1,164,843 |
| LAW properties official HTTP | `http://data.law.di.unimi.it/webdata/cnr-2000/cnr-2000.properties` | HTTP 200; SHA-256 frozen | 982 |
| LAW provenance official HTTP | `http://data.law.di.unimi.it/webdata/cnr-2000/` | HTTP 200; SHA-256 frozen | 9,345 |
| SNAP Windows curl | `https://snap.stanford.edu/data/wiki-Vote.txt.gz` | Schannel server closed without `close_notify`; no accepted file | 0 |
| SNAP topic-local OpenSSL curl | same URL | HTTP 200; gzip validated by conversion and SHA-256 frozen | 290,339 |
| SNAP provenance | `https://snap.stanford.edu/data/wiki-Vote.html` | HTTP 200; SHA-256 frozen | 13,692 |

No mirror or second-party copy was used. A local-path error (`curl` exit 23) occurred before the temporary download directory was created and accepted zero asset bytes. The historic LAW graph required one zero padding byte for the released Rust 32-bit mmap reader; raw and derived hashes are both retained, and the encoded bits/lists are unchanged.

## Claim-bearing compute

| Phase | Aggregate elapsed | Aggregate CPU | Peak RSS | Denominator |
|---|---:|---:|---:|---|
| 2,048-case structural killer | 189.883 s | 88.000 s | 11,821,056 B | all frozen cases, including native writer/read checks |
| Four natural build/validate tracks | 49.049 s | 48.656 s | 69,992,448 B | two corpora × baseline/candidate |
| Reader-only replay processes | 2.051 s | 1.844 s | 10,190,848 B | 11 repeats per output; repeat 0 excluded in comparisons |

## Per-natural-graph full cost

| Corpus | Track | End-to-end elapsed | CPU | Peak RSS | Graph bits | Native payload (`graph+offsets+properties`) | Payload+EF |
|---|---|---:|---:|---:|---:|---:|---:|
| cnr-2000 | final BvCompZ | 0.451 s | 0.469 s | 66,301,952 B | 9,319,309 | 1,486,606 B | 1,774,086 B |
| cnr-2000 | exact frontier DP | 47.167 s | 46.859 s | 69,992,448 B | 8,763,554 | 1,413,813 B | 1,696,957 B |
| Wiki-Vote | final BvCompZ | 0.102 s | 0.047 s | 13,524,992 B | 876,503 | 118,664 B | 127,200 B |
| Wiki-Vote | exact frontier DP | 1.330 s | 1.281 s | 16,265,216 B | 875,555 | 118,529 B | 127,057 B |

Candidate payload residual is `72,793 B (4.897%)` on cnr-2000 and `135 B (0.114%)` on Wiki-Vote. Candidate construction is `104.67×` and `13.04×` slower end to end and uses more peak memory. These costs include list input loading/materialization in process elapsed, native cost construction, planning, native writing, EF construction, sequential validation and random validation/query; `build_ns` separately excludes the pre-build input materialization, so all conclusions use end-to-end elapsed.

## Reader-only repeated cost

| Corpus | Metric | Baseline p50/p90 | Candidate p50/p90 | Candidate ratio p50/p90 |
|---|---|---:|---:|---:|
| cnr-2000 | full sequential decode | 19.255/20.966 ms | 18.766/18.806 ms | 0.975/0.897 |
| cnr-2000 | 100k random lists | 28.251/28.670 ms | 30.899/31.050 ms | 1.094/1.083 |
| Wiki-Vote | full sequential decode | 0.981/1.113 ms | 1.014/1.073 ms | 1.034/0.965 |
| Wiki-Vote | 100k random lists | 29.942/30.137 ms | 31.202/31.823 ms | 1.042/1.056 |

Checksums are stable and equal. The random-access regression is therefore disclosed as a frozen killer failure, not hidden as noise. No work-to-byte conversion or optimizer-speed claim is made.
