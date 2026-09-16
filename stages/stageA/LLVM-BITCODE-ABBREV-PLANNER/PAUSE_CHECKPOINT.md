# Safe Pause Checkpoint

- Assignment: `STAGEA-L3-20260809-LLVM-BITCODE-ABBREV-PLANNER-INITIAL-V8.7`
- Topic: `LLVM-BITCODE-ABBREV-PLANNER`
- Lane: `CANDIDATE-EXECUTION-LANE-3`
- Pause state: `PAUSED_BY_USER__ASSIGNMENT_RETAINED`
- Pause date: 2026-08-09 (Asia/Shanghai)
- Authorized write root: this candidate directory only
- Stage B: not started; `stageb_user_approval_id=null`
- Owner adjudication: none; this checkpoint is neither PASS nor STOP

## Completed before the pause

1. Read the required project entry, candidate-owner rule, ARS skill/workflow,
   frozen Discovery and Stage 0 packages, and Stage A templates.
2. Froze the assignment and upstream inputs.  The combined upstream input
   freeze is
   `14887ea76079bcbb7e028af2bf5ae3252b3319939d6d09802cfd8d281afeac43`.
3. Separated the current-source absence audit commit
   `a1194be1baefa99d20a09bd04b16056be0ab7225` from the executable official
   LLVM 22.1.8 release commit
   `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1`.  Cross-version differences
   are not eligible to carry a claim.
4. Acquired and selectively extracted the official LLVM 22.1.8 native tools
   (`clang`, `llvm-as`, `llvm-dis`, `opt`, `llvm-bcanalyzer`, `llvm-config`)
   from the pinned portable archive.
5. Closed the basic native smoke chain on `native_minimal.ll`:
   `llvm-as=0`, `llvm-dis=0`, and `opt -passes=verify -disable-output=0`.
   The native baseline is 1,736 bytes with SHA-256
   `3B8FACDB17349E321355BF4153E3C0B5D9949629A31AC66E12D53922DA62EDD7`.
6. Implemented a trace-level native LLVM bitstream parser/writer prototype in
   `scripts/bitstream_lab.py`.  Its original-grammar re-emission is byte-for-
   byte identical to the native baseline (same SHA-256 above).
7. Produced the expanded trace and bit-accounting development artifacts.  The
   frozen development trace hash printed by the parser is
   `a04637e56743bfd22bf9a80d86c63e4e44bcd3ee5067156f6adb09281cca14d5`.

## Development observation, not a scientific result

The all-UNABBREV/native-blob development rewrite preserved the prototype's
expanded semantic trace hash and reduced the file from 1,736 to 1,588 bytes,
but the unmodified native `llvm-dis` and `opt` rejected it with
`Expected value symbol table subblock`.  The cause is the frozen physical
offset records (`VSTOFFSET`/`FNENTRY`) no longer pointing to their original
word positions after layout changed.  This occurred before the contract
fidelity gate and before any natural claim-bearing run.  It is a control and
implementation constraint only: it cannot support PASS, STOP, or a mechanism
claim.

## Last atomic command

The final pre-pause command was a read-only `tar -tf` listing against the
pinned portable archive for three development headers.  It completed with no
matching lines and made no filesystem changes.  No subsequent download,
implementation, experiment, sample, or review step was started.

Immediately before that command, two attempts to fetch the extra headers
failed: `curl` reported Schannel `SEC_E_NO_CREDENTIALS`, and the GitHub API
route reported a closed receive connection.  Those failed routes left six
zero-byte placeholder files under the two `inputs/upstream_sources` version
trees.  They are not trusted source blobs, are absent from
`SOURCE_BLOB_MANIFEST.tsv`, and must not be consumed after resume.

## Integrity snapshot

- Candidate-directory inventory at pause: 53 files, 1,046,432,287 bytes
  (0.9746 GiB), below the 4 GiB cap.
- `ASSIGNMENT_FREEZE.yaml`:
  `60FCC7DAC905D3884CFA25DAD7C7C80993D41E326BEF886559583FB16BBD1BB2`
- `EXPERIMENT_CONTRACT.yaml`:
  `69C587ABB6E5FC45B8824258FD9A1695265783E0BD50EA72CD7F92645CF1221C`
- `scripts/bitstream_lab.py`:
  `DD930654E8EC6322BCA33E530721EDDAE69BCC314F8B7536EC6F9AB80EE64F14`
- baseline and identity re-emission:
  `3B8FACDB17349E321355BF4153E3C0B5D9949629A31AC66E12D53922DA62EDD7`
- failed-offset development rewrite:
  `608E035F42708CD4AC20108F59478AEBB463C8C391EE3484B7541B55B7A79628`
- expanded trace JSON:
  `235BEE80EFCF79423CCD528A2F53D4751DBECBF4D059A2ABB80C21E422CFBFB5`
- native bit-accounting JSON:
  `6AB7F864B47DFAB2954F870C44F02B7ADD3B493492119070F5ED855D1249B31C`
- source blob manifest:
  `DA60E72D178A75D0194B98D3793EC536B5894E4A36DD3F3E29FDA08DE7BF096E`

## Not started / gate still open

- Complete B0 current-native action/flag enumeration and source audit.
- Reacquire and hash the missing related headers without trusting the six
  zero-byte placeholders.
- Construct and natively validate the required abbreviation-ID-width-step
  witness.
- Implement and validate the named `WL-SLDP` candidate and B1/B2/B3 arms.
- Demonstrate atomic-action mapping, native codec parity, comparator semantic
  parity, common denominator/full-cost accounting, and the small witness.
- Download/build/preregister any natural corpus or start any claim-bearing run.
- Produce final comparator/results/report/user packet/handoff/manifest.

`PRE_CLAIM_CONTRACT_FIDELITY_GATE` therefore remains **OPEN**, not PASS or
FAIL.

## Resource and evidence state

- Claim-bearing observation produced: **no**.
- Scientific evidence ceiling at pause: **none assigned**; no scientific
  inference is authorized from the development observations.
- Scientific revision consumed: **no**.
- Active resource blocker: **no**.  The official native executable toolchain
  is present and works; the header-fetch errors were route failures and the
  pause was user-requested, not resource-forced.
- Formal state recommendation: retain the active assignment in this lane as
  user-paused.  Do not transition to `BLOCKED_USER_ACTION_REQUIRED`, PASS,
  STOP, reserve, or archive based on this checkpoint.

## Resume entry

Resume only on an explicit mainline/user instruction for this same frozen
assignment.  Start from this checkpoint (not from a new candidate session):

1. verify the hashes above and quarantine/remove only the six explicitly
   identified zero-byte failed-route placeholders;
2. reacquire the missing source headers through a pinned public archive or a
   working exact-commit HTTP route and extend the source manifest;
3. finish B0 enumeration and the native ID-width-step witness;
4. close every fidelity-gate item and record the gate result;
5. only after a gate PASS, preregister/freeze the natural corpus and begin the
   bounded claim-bearing Stage A run.

