# User Blocker Packet — Carcara 1.1.0 Windows x64

- Assignment: `RESOURCE-STAGEA-L2-20260811-CVC5-ALETHE-SHAREMAP-RESUME2-R2BC`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Kind: `RESOURCE_ASSET_UNAVAILABLE`
- Failure point: before download, version/help or stock checker smoke
- Claim-bearing observation: no
- Scientific revision consumed: no
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`

## Exact failure

The official `carcara-1.1.0` GitHub release contains only `carcara-linux`,
5,402,048 bytes. It contains no Windows x86_64 executable. No mainline/user
incoming `carcara.exe` or frozen byte/hash/provenance record exists in D root.

Verified provenance:

- release: `https://github.com/ufmg-smite/carcara/releases/tag/carcara-1.1.0`
- exact commit: `5d817d86bd18ea2a850a580d602f17f36959ee99`
- GitHub commit verification: valid
- license: Apache-2.0

## Minimum user/mainline action

Provide one unmodified Windows x86_64 `carcara.exe` built from the exact commit
above. Place it in a newly assigned immutable resume directory; do not overwrite
`resume2`.

The handoff must freeze:

- exact file byte count and SHA-256;
- build source URL/archive hash and exact commit;
- Rust/compiler versions and complete build command;
- confirmation that Carcara source, `Cargo.lock`, GMP/MPFR and tests were not
  patched or bypassed;
- Apache-2.0 license notice;
- expected `--version`, `--help` and minimal stock checker smoke command/output.

Preferred next location, subject to mainline assignment:
`stages\stageA\CVC5-ALETHE-SHAREMAP\resume3\incoming\carcara.exe`.

An acceptable alternative is for the upstream maintainer to publish an official
Windows x64 release asset tied to the same tag; its official URL, bytes and
SHA-256 must be frozen before execution.

## Not acceptable

- the Linux binary on this Windows route;
- another version or weaker checker;
- enabling `c-no-tests`, switching linkage features or patching source/dependencies;
- reusing an unregistered executable from another assignment;
- candidate or natural runs before resource and full fidelity PASS.

## Resume sequence and ceiling

1. Copy/download once into a temporary path.
2. Verify actual bytes/SHA-256 and provenance before execution.
3. Run unmodified version/help and stock checker smoke.
4. Only on resource PASS, resume the frozen full fidelity gate and then StageA.

Retain the current 6 GiB/4 CPU-hours, CPU-only, no-system-install boundary unless
mainline explicitly changes it. This resource failure must not STOP, reserve or
archive the topic.

