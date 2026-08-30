# User Blocker Packet — Carcara 1.1.0 Windows execution

## Minimum unblock action

Provide one provenance- and checksum-frozen Windows x86_64 `carcara.exe` version 1.1.0, built without source changes from the release archive whose SHA-256 is `FCD42C4ED6501B690E3F363E980B2B1403A1A7C9DF262FECC0A4C831B8960F30`.

Required metadata:

- exact file size and SHA-256;
- build provenance, compiler/Rust version and build command;
- Apache-2.0 license notice;
- a successful `--version` run and a minimal valid Alethe checker smoke, or enough build provenance for this lane to reproduce those smokes;
- expected binary size: normally below `20 MiB`; a larger file is acceptable only with an explanation and within the topic limit.

After mainline creates a new resource-resume assignment, place it under the new immutable directory, expected as `stages\stageA\CVC5-ALETHE-SHAREMAP\resume2\incoming\`. Do not overwrite `resume1`.

## Acceptable alternatives

1. Provide a checksum-frozen portable Windows x86_64 toolchain matching the prior preferred compatibility route (Clang 19.1.4 and a Rust 1.72.x-compatible build environment) that can execute the unmodified locked Carcara 1.1.0 build and dependency tests.
2. Explicitly authorize an equivalent, independently auditable Linux checker execution route and its isolated placement. Installing WSL/VM or making system changes is not authorized by the current assignment.

## Not acceptable under the current contract

- enabling `gmp-mpfr-sys` `c-no-tests`;
- switching Cargo features such as `use-system-libs` without a newly frozen equivalence rationale;
- patching Carcara, GMP, MPFR, Cargo.lock, or the test suite;
- accepting a differently versioned checker without a new exact freeze and unmodified smoke;
- running the candidate, proof corpus, or any claim-bearing workload before the checker and the full preclaim gate close.

## Exact current failure

The single permitted locked retry failed in `gmp-mpfr-sys 1.6.1` while testing MPFR 4.2.1: `tsprintf.exe` exited `127` after `GNU MP assertion failed: len < total_width`. One of 198 MPFR tests failed; Cargo exited `101`; no Carcara executable exists.

Estimated minimum user payload is one signed/checksummed `carcara.exe` plus provenance, ordinarily under `20 MiB`. This is a resource failure only. It does not consume a scientific revision and supports no scientific inference.

