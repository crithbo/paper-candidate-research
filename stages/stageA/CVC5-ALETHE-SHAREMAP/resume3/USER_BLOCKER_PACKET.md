# CVC5-ALETHE-SHAREMAP User Blocker Packet

- Stage and assignment: Stage A resource resume, `RESOURCE-STAGEA-L1-20260811-CVC5-ALETHE-SHAREMAP-RESUME3-R3C1`
- Status: `BLOCKED_USER_ACTION_REQUIRED__ROUTES_EXHAUSTED`
- Blocker kind: `TOOLCHAIN`
- Exact failure: final authorized Rust 1.72 Windows GNU clean build cannot locate `libgcc_eh` and `libgcc`; Cargo exits 101 and produces no `carcara.exe`.
- Claim-bearing observation obtained before failure: no
- Scientific inference allowed: none
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: no
- Immutable failure directory: `stages\stageA\CVC5-ALETHE-SHAREMAP\resume3`

## Exact resource needed

Preferred: one unmodified Windows x86_64 `carcara.exe` version 1.1.0 built from
commit `5d817d86bd18ea2a850a580d602f17f36959ee99` and the source archive whose
SHA-256 is `FCD42C4ED6501B690E3F363E980B2B1403A1A7C9DF262FECC0A4C831B8960F30`.
Provide exact bytes, SHA-256, compiler/Rust version, complete build command/log,
unchanged `Cargo.lock` hash `0E9C953C…7378`, and Apache-2.0 notice. A typical
release executable is expected to be below roughly 20 MiB, but its actual size
and hash must be supplied rather than guessed.

Accepted alternative: explicitly authorize a new immutable resume assignment
with a checksum-frozen portable MinGW-w64 GCC-compatible runtime/toolchain for
Rust 1.72 `x86_64-pc-windows-gnu`, including working `libgcc.a` and
`libgcc_eh.a`, exact version/hash/license and a native link smoke. The current
build budget is exhausted, so this alternative requires new user/mainline authority.

An isolated Linux checker route may also be proposed under new explicit authority.
WSL/system installation remains unapproved and must not be inferred from R3H.

## Minimum user action

Provide the preferred binary plus provenance to mainline, or explicitly approve
one of the alternative routes above. Mainline should create a new immutable
`resume4` assignment; do not place or overwrite files in `resume3`.

First safe checks after unblocking:

1. compute exact file size and SHA-256;
2. run `carcara --version` and `carcara --help` with process-local environment;
3. run `carcara check <proof> <same-input.smt2>` on the frozen small witness;
4. only after those pass, restart the full preclaim contract gate.

## Approved finite recovery envelope

- Authorization: R3C1 + R3A + R3H
- R3A bootstrap: used; neither registered tree contains `libgcc*.a`
- Clean build 1: exhausted, offline metadata failure
- One mechanical correction: exhausted, exact locked fetch succeeded
- Corrected clean build 2: exhausted, missing `libgcc_eh`/`libgcc`
- Approved routes not attempted: none
- Additional build now authorized: no
- Storage: below 8 GiB; CPU/wall well below 6 CPU-hours; no GPU/device
- R3H authorized: yes, only after routes exhausted
- Recommended reversible state: `HUMAN_RESEARCH_RESERVE__USER_DIRECTED_RESOURCE_BLOCKED__NO_SCIENTIFIC_INFERENCE`
- Reactivation: user-only `RESUME_FROM_RESERVE` into a new immutable directory

## Work explicitly not executed

No checker smoke, candidate, natural corpus, claim-bearing run, scientific
revision, Stage B, source/Cargo/GMP/MPFR/test change, system install, global
environment change, WSL/VM, automation, project or external submission occurred.
