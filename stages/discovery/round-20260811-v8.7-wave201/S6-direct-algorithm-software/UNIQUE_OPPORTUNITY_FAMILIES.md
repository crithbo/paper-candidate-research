# Unique opportunity families

## U1 — ECMA-335 metadata table row / heap assignment

- Exact proposed object: a fixed managed assembly with identical IL, resources, public reflection behavior, and stock CLI/PE reader semantics.
- Apparent whole action: assign rows of TypeDef, MethodDef, Field, MemberRef and related tables; assign heap offsets; regenerate simple/coded indexes, IL tokens, PDB references, and strong-name material.
- Minimal native-legal divergence: two otherwise independent MethodDef rows can be exchanged only if every affected table reference and IL metadata token is regenerated and sorted-table constraints remain valid.
- Decisive defect: the swap changes the row-id component of the method token. Microsoft documents those tokens as persisted in CIL, and stock reflection exposes them. Hence this is a legal *different assembly representation*, not the fixed same-object output.
- Disposition: `STRUCTURAL_DROP__SAME_OBJECT_TOKEN_OBSERVABILITY`. No brief.
