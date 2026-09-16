# Revision 1 Command Log

Runtime used: `<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe` (Python 3.12.13). Working directory for all experiment commands: this revision directory.

1. Source preflight: read-only pinned HTTPS fetch; 17,477 bytes; SHA-256 `8301352a6b70d0d79bd0eeecfdff39081e3f565b000ccabc8ba5ca63653b05d8`.
2. Contract frozen by creating `REVISION_EXPERIMENT_CONTRACT.yaml` before artifact materialization, implementation, or execution.
3. Acquisition: `curl.exe -L --fail --max-time 30 -o inputs/simple_vec_add_root_7.json <frozen-raw-url>` — exit 0.
4. First `prepare_natural.py` attempt — exit 1 before output creation. Cause: parser implementation required the referenced canonical child node itself to remain, instead of resolving the child's e-class as specified by the contract. This was an implementation defect, not an experimental result.
5. Parser corrected to resolve child e-class from the immutable raw node table. Contract, source, projection rule, costs, sizes, roots, and stop criteria were not changed.
6. `prepare_natural.py --source inputs/simple_vec_add_root_7.json --output inputs/locked_natural_projection.json` — exit 0.
7. `python -m unittest -v test_revision.py` — exit 0; 4/4 passed.
8. `run_revision.py ... --output results/run1.json` — exit 0.
9. Identical second command to `results/run2.json` — exit 0.
10. `validate_revision.py ... --output results/validation.json` — exit 0; `REPRODUCIBLE`, 81 replay checks, 0 violations, fallacy scan 11/11.

No retry was used to search for a positive result. The only correction restored the already-frozen e-class edge semantics, and the complete run was then executed twice.

