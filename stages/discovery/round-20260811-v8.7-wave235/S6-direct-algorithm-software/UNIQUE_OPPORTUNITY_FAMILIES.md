# Unique opportunity families

## F1 — BOLT joint function/block-layout and relocation-aware constructor

Fix executable behavior, ABI exports, relocation/exception semantics, and stock loader behavior. A candidate jointly assigns function/block order, alignment, and legal placement while regenerating dependent references. The witness is two legal function orders in a fixed binary. BOLT already exposes function reordering/code-layout machinery, so a valid N2 would need a new full-cost guarantee over layout quality and rewrite cost—not a pass setting. Source/options and collision closure are incomplete.

## F2 — SquashFS global block/fragment constructor

Fix filesystem tree, metadata, names, file bytes, and stock reader behavior. The candidate may jointly assign file tails/blocks/fragments and regenerate metadata, with image bytes plus build/decompress/read costs. A small file has legal fragment/block representations. Existing writer features and the current exact action union have not been closed; generic packing and compressor tuning are excluded.

## F3 — GNU linker joint section-layout/relaxation constructor

Fix ELF ABI, exported symbols, relocation behavior, section semantics, and stock loader results. A candidate jointly decides legal section/function placement, alignment, and relaxation realization with regenerated addresses/relocations. Two legal placements provide a witness. It must surpass linker-script/backend and existing code-layout composition with an explicit guarantee; the current source/flag union and direct collision are unclosed.

## F4–F6 screen-only exclusions

CPack is a packaging wrapper (`STRUCTURAL_DROP`); BTF and ORC are excluded as registry/lane repeats. They are recorded to make the six-family breadth funnel auditable and were not used to infer new opportunity claims.
