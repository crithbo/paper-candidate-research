# Static Model Audit — O4-DYNCACHE-PGM

## Finding

The submitted implementation is deterministic and internally consistent, but the three advertised local caps are non-discriminating under the frozen constants. They do not yet establish a PDEC-specific residual over a conventional copy-on-write leaf implementation.

## Why the caps are implied by the model

The frozen probe uses `epsilon = 1`, page capacity `4`, page-touch cap `4`, auxiliary-page cap `2`, and rebuild-credit cap `5`.

For a sorted three-key page `(a,b,c)` with distinct integer keys, the endpoint-affine prediction for the middle key has predicted rank

`2(b-a)/(c-a)`.

Because `0 < (b-a)/(c-a) < 1`, its distance from the true middle rank `1` is strictly less than `1`. One- and two-key pages are handled as zero-error cases. Therefore every page of at most three keys is feasible at `epsilon = 1`, independently of the key distribution.

After one insertion, a previously legal four-key leaf has at most five keys. The frozen local partitioner can always choose a `3+2` partition. Consequently:

- new pages are at most `2` by construction;
- auxiliary pages equal the number of new pages, so they are at most `2`;
- rebuild slots equal the post-update payload length, so they are at most `5`;
- reported page touches are `1` logical route charge + at most `1` old-page read + at most `2` new-page writes, so they are at most `4`.

The exhaustive `1,740` states and `27,840` transitions are useful implementation checks, but under this state space they cannot falsify those caps. A certificate may cause a four-key page to split earlier, yet the submission supplies no control demonstrating that this changes an admissible transition, guarantee, or fully priced metric relative to a plain COW B+tree leaf or the same leaf with an affine hint.

## Consequence for the Stage A premise

The result supports a narrower statement: the submitted leaf-local COW implementation is exact on its enumerated queries and deterministic on the locked inputs. It does not yet support the mechanism-specific statement needed to distinguish PDEC from a routine wrapper. This is an evidence-readiness defect, not a conclusion that the proposed scalable PDEC/directory/deferred-credit system cannot work.

## Required atomic correction

Use one same-object `LEAF_LOCAL_NONVACUITY_AND_BTREE_ABSORPTION_GATE`:

1. Under the same information, capacity, atomic publication semantics and local cost ledger, specify a minimal plain COW B+tree leaf and a `B+tree + affine hint` control.
2. Prove statically or test exhaustively whether those controls generate the same reachable transitions and caps.
3. Predeclare and exhibit at least one reachable or natural case where the PDEC certificate changes an admissible state/transition and yields a guarantee or fully priced metric not inherited by either control.
4. If no such residual exists, report absorption and stop this object. If the residual requires a small two-level fence/credit state, it may be a bounded same-object counterexample-search extension, not a full Stage B benchmark or a new research object.

No full ESA/PGM/ALEX/TLX build is required to close this single Stage A revision gate.
