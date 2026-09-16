# Reproduce or resume

This directory reproduces only the frozen-input and resource-blocker audit. It intentionally cannot reproduce a scientific result because no claim-bearing run occurred.

1. Verify `HASH_MANIFEST.sha256` from this directory without modifying files.
2. Confirm the frozen archive and official source hashes listed in `RESOURCE_INVENTORY.yaml`.
3. Confirm Triton source `cmake/llvm-hash.txt` is `1f126a6dea50d185c0781743a667390037ae88bd` and inspect both backend `make_llir` boundaries cited in `PRE_CLAIM_CONTRACT_FIDELITY_GATE.yaml`.
4. Do not execute `bootstrap_checkouts.sh`; it was never run here.
5. Do not start mutants. Resume only in a new immutable directory after mainline freezes an executable-resource assignment.

Minimum resumed environment: unmodified Triton v3.7.1 / expected commit `f797708c0626e5f9840ca5b0a98790e2c7cb09ad`, LLVM `1f126a6dea50d185c0781743a667390037ae88bd`, both NVIDIA and AMD `make_llir` paths, observer-only capture at the exact boundary, and one frozen primary SMT solver with replay. A matching gfx1100 device is additionally needed only for its performance witness, not for the semantic capture itself.
