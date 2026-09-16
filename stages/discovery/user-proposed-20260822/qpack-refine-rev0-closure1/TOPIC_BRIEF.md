# Topic brief — QPACK-REFINE-REV0

## Canonical disposition

`DROP`

## Reason

The only concrete nontrivial action in the proposed loader-to-kernel refinement
is already in the tag-pinned vLLM W4A16 path: packed-axis conversion is not a
simple metadata change but a full unpack, transpose, and repack; the same path
also transforms scale/zero data, checks accepted shapes/group sizes, and passes
the resulting tensors to a kernel with explicit nibble and group semantics.

The remaining proposal is an auxiliary assertion/checker of that existing
action. It has no independent same-object whole constructor, target-specific
algorithmic guarantee, or non-wrapper endpoint. Under the Discovery rules this
is direct absorption plus a checker/wrapper, not a finite-fidelity gap.

## Claim ceiling

No novelty or performance claim is made. The bounded collision search remaining
open is immaterial to the direct-fatal native action record. No Stage 0 is
recommended or dispatched.

## Potential/readiness separation

- Structural potential if a distinct native action existed: not assessed beyond
  this frozen path.
- Current evidence readiness: sufficient to establish direct absorption for the
  exact path; no implementation, model run, or hardware resource was required.

