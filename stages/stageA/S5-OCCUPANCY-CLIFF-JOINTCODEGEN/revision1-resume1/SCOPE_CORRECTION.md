# Mainline Scope Correction

- Applied before final `handoff.yaml` or `HASH_MANIFEST.sha256` existed.
- Withdrawn interpretation: every upstream release asset must independently publish a detached signature or attestation.
- Correct frozen provenance chain: official HTTPS release URL + exact expected byte count + frozen publisher SHA-256; exact LLVM and ROCm source/corpus commits additionally require valid immutable GitHub commit identity/signature.
- Scientific gates unchanged: exact LLVM commit, 8-16 complete natural MIR, same-object current baseline, verifier legality, full cost, and double replay.
- Authority unchanged: one actual clean download, no automatic retry, at most 4 GiB and 4 CPU-hours, no AMD GPU, no Stage B.
- This is an input-scope correction from mainline, not a result-dependent relaxation.

