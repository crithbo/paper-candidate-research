# Reproducibility

## Public-source replay

From this assignment directory, using the bundled Python runtime:

```powershell
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' .\scripts\acquire_primary_sources.py
& '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' .\scripts\audit_pdf_text.py
```

The first command is network-mutating and is not needed to validate the frozen package; validators should prefer the existing assets and `SOURCE_MANIFEST.yaml`. The second command regenerates only the derived text audit from frozen PDFs.

## Scientific replay boundary

There is no claim-bearing scientific run to replay. The absence is intentional and enforced by `PRE_CLAIM_CONTRACT_FIDELITY_GATE.md`. A valid future replay requires the exact human research package listed in `USER_RESEARCH_REQUEST.md`; it may not substitute a synthetic trace or another platform.

## Mechanical verification

Run `scripts/validate_package.py` with the bundled Python runtime. It verifies input hashes, source sizes/hashes, required decision fields, Stage B prohibition, lane state and the final manifest.
