# Topic brief — KALLSYMS-VERSIONAWARE-TOKEN-STABILITY

## Conditional proposal

**Tier:** `TIER_B_Q2_VIABLE` (conditional on a held-out residual).  **Innovation:** `N2`, with optional N3 characterization only if natural tag stability is later measured.  This brief does not claim a result.

### Exact object and same-function guarantee

For adjacent official Linux tags with a fixed configuration and toolchain, construct each tag's complete in-kernel kallsyms representation from that tag's fixed selected symbol→address/type/name mapping.  The unmodified stock decoder/lookup must return the same mapping and normalized `System.map`; no changed symbol selection, reader, build-cache semantics or delta-only artifact is allowed.

### New algorithm and direct subtractors

The candidate constructs a finite frontier of legal per-version codebook/name-stream choices and uses predecessor-aware dynamic programming to jointly optimize local image bytes and deployment delta bytes.  Its direct subtractors are:

1. Stock global token-profit kallsyms generation independently at every version.
2. That exact per-version output plus VCDIFF/standard binary differencing, supplied the same previous version bytes.
3. Ablations: local bytes only; delta only; no predecessor penalty; fixed stock codebook.

The action divergence is that a predecessor-aware rule may choose a locally larger legal codebook when this saves more transition bytes; the stock decision rule only sees the current map.  The DP is exact over the declared finite candidate frontier, with no claim to globally optimize all possible codebooks.

### Natural evidence, full cost and Stage A plan

Carrier: 20–50 adjacent official tags, same architecture/config/toolchain, chronologically split.  Freeze tags/tree IDs, source/config/toolchain hashes and output hashes; compare full `vmlinux`/kallsyms bytes, standard delta bytes, generator/build/link CPU/RSS, boot/lookup CPU-RSS and semantic verification time.  A <=72h killer is a failed exact oracle, direct stock-composition reproduction, unbounded frontier/changed-object dependence, or no full-cost residual on held-out tags.

### Fidelity closure plan and evidence ceiling

Before claim-bearing work, Stage A must pin the exact source, config, candidate-frontier procedure, delta implementation/config, normalized parser/oracle and all cost units.  Current evidence is static source review plus an algebraic action witness; it supports only a conditional Stage0 proposal, not effectiveness, novelty-finality or performance claims.
