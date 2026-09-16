# Case r8e1

Cutoff: 2026-08-09. A fixed build action must produce the same content-addressed
directory closure and root digest under an existing remote-execution protocol.
The current implementation already provides memoization for its Merkle input
tree and the protocol fixes digest and upload semantics.

The contemplated improvement reconstructs or reuses tree fragments differently.
Changing a digest or input mapping changes semantics; retaining them leaves only
cache/reuse policy. Decide whether a union-external construction action remains.
